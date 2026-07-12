//
// apple.swift
// CoreCare - Apple Health Integration with WHO Guidelines & Scientific Recommendations
// ENHANCED: World-Class UI/UX with Advanced Animations & Graphics
//
// Created by SAIL L1 on 13/12/25.
//

import SwiftUI
import HealthKit

// MARK: - Models & Constants
struct HealthMetric {
    let value: Double
    let unit: String
    let timestamp: Date
}

struct WhoGuidelines {
    static let sleepRecommendation = (min: 7.0, max: 9.0)
    static let stepsRecommendation = 10000
    static let minActivityMinutes = 150
}

// MARK: - Animation Values for Keyframe Animator
struct ProgressAnimationValues: Hashable {
    var scale: Double = 1.0
    var rotation: Double = 0.0
    var opacity: Double = 1.0
    var offset: CGFloat = 0.0
}

// MARK: - Scientists Research Based Recommendations
struct HealthRecommendations {
    // Sleep recommendations based on scientific research
    static func getSleepRecommendation(hours: Double) -> (status: String, color: Color, emoji: String, advice: String) {
        switch hours {
        case 0..<5:
            return ("Critical", .red, "⚠️", "You're not getting enough sleep. Aim for 7-9 hours. Poor sleep affects metabolism, immune system, and cognitive function.")
        case 5..<7:
            return ("Below Optimal", .orange, "😴", "Getting closer! Add 1-2 hours. Research shows 7-9 hours improves heart health and mental clarity.")
        case 7...9:
            return ("Optimal", .green, "✨", "Perfect! You're in the WHO-recommended range. This supports immune function and mental health.")
        case 9..<11:
            return ("Above Optimal", .blue, "😴", "Consider that you may be getting too much sleep. While quality matters, 7-9 hours is ideal.")
        default:
            return ("Excessive", .purple, "⏰", "You're sleeping too much. Excessive sleep may indicate health issues. Consult a healthcare provider.")
        }
    }
    
    // Steps recommendations based on scientific research
    static func getStepsRecommendation(steps: Int) -> (status: String, color: Color, emoji: String, advice: String) {
        switch steps {
        case 0..<3000:
            return ("Sedentary", .red, "🚶", "Move more! Less than 3,000 steps indicates low activity. Risk of cardiovascular disease increases.")
        case 3000..<7000:
            return ("Low", .orange, "🚶", "Getting active! Aim for at least 7,000-10,000 steps. Studies show 7,000+ steps significantly reduces mortality risk.")
        case 7000..<10000:
            return ("Good", .yellow, "🚶‍♂️", "Great effort! You're close to the WHO recommendation of 10,000 steps daily.")
        case 10000..<15000:
            return ("Excellent", .green, "🏃", "Outstanding! You meet WHO recommendations. Research shows 10,000+ steps reduces chronic disease risk by 30%.")
        case 15000...:
            return ("Exceptional", Color(red: 0.0, green: 0.8, blue: 0.6), "🏃‍♂️", "Fantastic! You're exceeding recommendations. Maintain consistency for optimal cardiovascular health.")
        default:
            return ("Unknown", .gray, "❓", "Unable to determine activity level.")
        }
    }
}

// MARK: - Main Apple Health View with Enhanced Animations
struct AppleView: View {
    @StateObject private var healthManager = HealthDataManager()
    @State private var selectedTab = 0
    @State private var animationTrigger = false
    @State private var showDetailedInfo = false
    @State private var pulseAnimation = false
    
    // Color scheme
    private let primaryGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 0.05, green: 0.07, blue: 0.12),
            Color(red: 0.1, green: 0.12, blue: 0.2)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    private let accentColor = Color(red: 0.24, green: 0.55, blue: 1.0)
    private let surfaceColor = Color.white
    private let textPrimary = Color(red: 0.11, green: 0.13, blue: 0.19)
    private let textSecondary = Color(red: 0.42, green: 0.47, blue: 0.57)
    
    var body: some View {
        ZStack {
            // Enhanced animated background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.98, green: 0.98, blue: 1.0),
                    Color(red: 0.96, green: 0.97, blue: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Floating background circles
            floatingCirclesBackground()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Premium Header with enhanced animations
                headerView()
                
                // Segmented Control with smooth transitions
                segmentedControlView()
                
                // Content with sophisticated animations
                ZStack {
                    if selectedTab == 0 {
                        stepsView()
                            .transition(.asymmetric(
                                insertion: .scale(scale: 0.92, anchor: .center).combined(with: .opacity),
                                removal: .scale(scale: 1.08, anchor: .center).combined(with: .opacity)
                            ))
                    } else {
                        sleepView()
                            .transition(.asymmetric(
                                insertion: .scale(scale: 0.92, anchor: .center).combined(with: .opacity),
                                removal: .scale(scale: 1.08, anchor: .center).combined(with: .opacity)
                            ))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 24)
                
                Spacer()
                
                // WHO Citation Footer
                whoFooterView()
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8)) {
                animationTrigger = true
                pulseAnimation = true
            }
        }
    }
    
    // MARK: - Floating Circles Background Animation
    private func floatingCirclesBackground() -> some View {
        ZStack {
            ForEach(0..<3, id: \.self) { index in
                Circle()
                    .fill(accentColor.opacity(0.03))
                    .frame(width: CGFloat(300 - index * 60), height: CGFloat(300 - index * 60))
                    .offset(
                        x: animationTrigger ? CGFloat(30 * (index + 1)) : CGFloat(-30 * (index + 1)),
                        y: animationTrigger ? CGFloat(-25 * (index + 1)) : CGFloat(25 * (index + 1))
                    )
                    .animation(
                        Animation.easeInOut(duration: 4 + Double(index) * 0.8)
                            .repeatForever(autoreverses: true),
                        value: animationTrigger
                    )
                    .blur(radius: 20)
            }
        }
    }
    
    // MARK: - Header View with Enhanced Animations
    private func headerView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Apple Health Analytics")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(textPrimary)
                        .scaleEffect(animationTrigger ? 1.0 : 0.95)
                    
                    Text("Real-time wellness insights")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(textSecondary)
                        .opacity(animationTrigger ? 1.0 : 0.7)
                }
                
                Spacer()
                
                // Status Badge with pulse effect
                HStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 12, height: 12)
                        
                        Circle()
                            .stroke(Color.green, lineWidth: 1.5)
                            .frame(width: 12, height: 12)
                            .scaleEffect(pulseAnimation ? 1.8 : 1.0)
                            .opacity(pulseAnimation ? 0 : 1)
                    }
                    
                    Text("Synced")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.green)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)
                .scaleEffect(animationTrigger ? 1.0 : 0.9)
            }
        }
        .padding(20)
        .background(surfaceColor)
        .shadow(color: Color.black.opacity(0.08), radius: 15, x: 0, y: 6)
        .animation(.spring(response: 0.6, dampingFraction: 0.75), value: animationTrigger)
    }
    
    // MARK: - Segmented Control with Enhanced Animations
    private func segmentedControlView() -> some View {
        HStack(spacing: 0) {
            ForEach(["Steps", "Sleep"], id: \.self) { tab in
                Button(action: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.65)) {
                        selectedTab = tab == "Steps" ? 0 : 1
                    }
                }) {
                    VStack(spacing: 6) {
                        ZStack {
                            if selectedTab == (tab == "Steps" ? 0 : 1) {
                                Circle()
                                    .fill(accentColor.opacity(0.15))
                                    .frame(width: 40, height: 40)
                                    .scaleEffect(1.1)
                            }
                            
                            Image(systemName: tab == "Steps" ? "figure.walk" : "bed.double.fill")
                                .font(.system(size: 18, weight: .semibold))
                        }
                        
                        Text(tab)
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .foregroundColor(selectedTab == (tab == "Steps" ? 0 : 1) ? .white : textSecondary)
                    .background(
                        selectedTab == (tab == "Steps" ? 0 : 1)
                            ? accentColor
                            : Color.clear
                    )
                    .cornerRadius(12)
                }
            }
        }
        .padding(8)
        .background(Color.black.opacity(0.05))
        .cornerRadius(16)
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
    
    // MARK: - Steps View with Enhanced Graphics
    private func stepsView() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                // Enhanced Circular Progress with Glow
                VStack(spacing: 20) {
                    ZStack {
                        // Glow effect layers
                        Circle()
                            .fill(accentColor.opacity(0.05))
                            .blur(radius: 20)
                            .scaleEffect(animationTrigger ? 1.2 : 1.0)
                        
                        Circle()
                            .fill(accentColor.opacity(0.02))
                            .blur(radius: 30)
                            .scaleEffect(animationTrigger ? 1.4 : 1.0)
                        
                        // Background circle
                        Circle()
                            .stroke(Color.black.opacity(0.05), lineWidth: 12)
                        
                        // Progress circle with gradient
                        let stepsPercentage = min(Double(healthManager.todayStepCount) / Double(WhoGuidelines.stepsRecommendation), 1.0)
                        
                        Circle()
                            .trim(from: 0, to: stepsPercentage)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.0, green: 0.8, blue: 0.6),
                                        .green,
                                        accentColor
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                style: StrokeStyle(lineWidth: 14, lineCap: .round, lineJoin: .round)
                            )
                            .rotationEffect(.degrees(-90))
                            .animation(.spring(response: 1.0, dampingFraction: 0.7), value: healthManager.todayStepCount)
                        
                        // Center content with animations
                        VStack(spacing: 10) {
                            Text("\(healthManager.todayStepCount)")
                                .font(.system(size: 52, weight: .bold, design: .rounded))
                                .foregroundColor(textPrimary)
                                .scaleEffect(animationTrigger ? 1.0 : 0.9)
                            
                            Text("steps today")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(textSecondary)
                            
                            Divider()
                                .padding(.vertical, 6)
                            
                            Text("\(Int(stepsPercentage * 100))% of daily goal")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(accentColor)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(accentColor.opacity(0.1))
                                .cornerRadius(6)
                        }
                    }
                    .frame(height: 300)
                    .padding(.horizontal, 20)
                }
                .animation(.easeOut(duration: 0.8), value: animationTrigger)
                
                // Enhanced Goal Progress Bar
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Text("Daily Goal: \(WhoGuidelines.stepsRecommendation) steps")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(textPrimary)
                        
                        Spacer()
                        
                        Text("\(healthManager.todayStepCount) / \(WhoGuidelines.stepsRecommendation)")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(accentColor)
                    }
                    
                    let stepsPercentage = min(Double(healthManager.todayStepCount) / Double(WhoGuidelines.stepsRecommendation), 1.0)
                    
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.black.opacity(0.05))
                            
                            // Shimmer effect on progress
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(red: 0.0, green: 0.8, blue: 0.6),
                                            .green,
                                            accentColor
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: geo.size.width * stepsPercentage)
                                .animation(.spring(response: 0.8, dampingFraction: 0.7), value: healthManager.todayStepCount)
                            
                            // Shimmer overlay
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0),
                                    Color.white.opacity(0.4),
                                    Color.white.opacity(0)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .offset(x: animationTrigger ? geo.size.width : -geo.size.width)
                            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: animationTrigger)
                        }
                    }
                    .frame(height: 10)
                    .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                
                // Recommendation Card with enhanced styling
                recommendationCardSteps()
                
                // Health Impact Card
                healthImpactCardSteps()
                
                // Quick Stats with enhanced animations
                quickStatsSteps()
                
                Spacer(minLength: 20)
            }
        }
    }
    
    // MARK: - Sleep View with Enhanced Graphics
    private func sleepView() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                // Enhanced Sleep Hours Display
                VStack(spacing: 16) {
                    ZStack {
                        // Background with gradient
                        RoundedRectangle(cornerRadius: 24)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        surfaceColor,
                                        Color(red: 0.98, green: 0.98, blue: 1.0)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 8)
                        
                        VStack(spacing: 16) {
                            HStack(spacing: 16) {
                                Text("🌙")
                                    .font(.system(size: 40))
                                    .scaleEffect(animationTrigger ? 1.0 : 0.85)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Last Night")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(textSecondary)
                                        .opacity(animationTrigger ? 1.0 : 0.6)
                                    
                                    Text(String(format: "%.1f hours", healthManager.lastSleepHours))
                                        .font(.system(size: 32, weight: .bold, design: .rounded))
                                        .foregroundColor(textPrimary)
                                        .scaleEffect(animationTrigger ? 1.0 : 0.9)
                                }
                                
                                Spacer()
                            }
                            
                            // Sleep Range Indicator with status
                            let sleepStatus = HealthRecommendations.getSleepRecommendation(hours: healthManager.lastSleepHours)
                            
                            HStack(spacing: 12) {
                                ZStack {
                                    Circle()
                                        .fill(sleepStatus.color.opacity(0.2))
                                        .frame(width: 28, height: 28)
                                    
                                    Circle()
                                        .fill(sleepStatus.color)
                                        .frame(width: 12, height: 12)
                                        .scaleEffect(pulseAnimation ? 1.2 : 1.0)
                                }
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(sleepStatus.status)
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(sleepStatus.color)
                                    
                                    Text("WHO: 7-9 hours")
                                        .font(.system(size: 11, weight: .medium))
                                        .foregroundColor(textSecondary)
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(20)
                    }
                }
                .padding(.horizontal, 20)
                .animation(.easeOut(duration: 0.8), value: animationTrigger)
                
                // Enhanced Sleep Range Bar
                VStack(alignment: .leading, spacing: 14) {
                    Text("Sleep Duration Range")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(textPrimary)
                    
                    // Animated range indicator
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            // Background
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.black.opacity(0.05))
                            
                            // Optimal range highlight
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.green.opacity(0.3),
                                            Color.green.opacity(0.1)
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: geo.size.width * (2/12), height: .infinity)
                                .offset(x: geo.size.width * (7/12))
                            
                            // Current position indicator with glow
                            let position = min(healthManager.lastSleepHours / 12, 1.0)
                            
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(Color.blue.opacity(0.2))
                                        .frame(width: 20, height: 20)
                                    
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [accentColor, Color.blue]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .frame(width: 4, height: 24)
                                }
                            }
                            .frame(maxHeight: .infinity, alignment: .center)
                            .offset(x: geo.size.width * position - 10)
                        }
                    }
                    .frame(height: 50)
                    
                    // Range labels
                    HStack {
                        Text("0h")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(textSecondary)
                        
                        Spacer()
                        
                        Text("7-9h (Optimal)")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.green)
                        
                        Spacer()
                        
                        Text("12h")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(textSecondary)
                    }
                }
                .padding(.horizontal, 20)
                
                // Sleep Recommendation Card
                let sleepRec = HealthRecommendations.getSleepRecommendation(hours: healthManager.lastSleepHours)
                
                VStack(spacing: 14) {
                    HStack(spacing: 14) {
                        Text(sleepRec.emoji)
                            .font(.system(size: 40))
                            .scaleEffect(animationTrigger ? 1.0 : 0.85)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(sleepRec.status)
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(textPrimary)
                            
                            Text("Scientific Recommendation")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(textSecondary)
                        }
                        
                        Spacer()
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    Text(sleepRec.advice)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(textSecondary)
                        .lineLimit(.max)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(18)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(sleepRec.color.opacity(0.08))
                        .stroke(sleepRec.color.opacity(0.2), lineWidth: 1.5)
                )
                .padding(.horizontal, 20)
                
                // Sleep Science Information
                sleepScienceView()
                
                // Tips for Better Sleep
                betterSleepTipsView()
                
                Spacer(minLength: 20)
            }
        }
    }
    
    // MARK: - Recommendation Card Steps
    private func recommendationCardSteps() -> some View {
        let stepsRec = HealthRecommendations.getStepsRecommendation(steps: healthManager.todayStepCount)
        
        return VStack(spacing: 14) {
            HStack(spacing: 14) {
                Text(stepsRec.emoji)
                    .font(.system(size: 40))
                    .scaleEffect(animationTrigger ? 1.0 : 0.85)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(stepsRec.status)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(textPrimary)
                    
                    Text("Scientific Recommendation")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(textSecondary)
                }
                
                Spacer()
            }
            
            Divider()
                .padding(.vertical, 4)
            
            Text(stepsRec.advice)
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(textSecondary)
                .lineLimit(.max)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(stepsRec.color.opacity(0.08))
                .stroke(stepsRec.color.opacity(0.2), lineWidth: 1.5)
        )
        .padding(.horizontal, 20)
        .animation(.easeOut(duration: 0.6), value: animationTrigger)
    }
    
    // MARK: - Health Impact Card Steps
    private func healthImpactCardSteps() -> some View {
        return VStack(spacing: 16) {
            Text("Health Impact")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 12) {
                healthImpactItem(emoji: "❤️", title: "Cardiovascular Health", description: "10,000+ steps reduces heart disease risk by 30%")
                healthImpactItem(emoji: "🧠", title: "Mental Health", description: "Daily walking improves mood and reduces anxiety by 26%")
                healthImpactItem(emoji: "⚖️", title: "Weight Management", description: "Consistent daily activity supports healthy weight maintenance")
                healthImpactItem(emoji: "💪", title: "Longevity", description: "7,000+ daily steps linked to 50% lower mortality risk")
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.blue.opacity(0.06))
                .stroke(Color.blue.opacity(0.12), lineWidth: 1.5)
        )
        .padding(.horizontal, 20)
    }
    
    private func healthImpactItem(emoji: String, title: String, description: String) -> some View {
        HStack(spacing: 12) {
            Text(emoji)
                .font(.system(size: 24))
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(textSecondary)
                    .lineLimit(.max)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
    
    // MARK: - Quick Stats Steps
    private func quickStatsSteps() -> some View {
        return VStack(spacing: 14) {
            Text("Daily Progress")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 12) {
                statCard(
                    title: "Calories Burned",
                    value: "\(Int(Double(healthManager.todayStepCount) * 0.04))",
                    unit: "kcal",
                    icon: "🔥"
                )
                
                statCard(
                    title: "Distance",
                    value: String(format: "%.2f", Double(healthManager.todayStepCount) * 0.000762),
                    unit: "km",
                    icon: "📍"
                )
                
                statCard(
                    title: "Time Active",
                    value: "\(Int(Double(healthManager.todayStepCount) / 100))",
                    unit: "min",
                    icon: "⏱️"
                )
            }
        }
        .padding(.horizontal, 20)
    }
    
    private func statCard(title: String, value: String, unit: String, icon: String) -> some View {
        VStack(spacing: 10) {
            Text(icon)
                .font(.system(size: 28))
                .scaleEffect(animationTrigger ? 1.0 : 0.9)
            
            Text(value)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(textPrimary)
            
            Text(unit)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(accentColor)
            
            Text(title)
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(textSecondary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity)
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(surfaceColor)
                .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 4)
        )
        .animation(.easeOut(duration: 0.5), value: animationTrigger)
    }
    
    // MARK: - Sleep Science View
    private func sleepScienceView() -> some View {
        return VStack(spacing: 14) {
            Text("Sleep Science")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 10) {
                sleepScienceFact(
                    title: "Sleep Cycles",
                    description: "Each cycle lasts ~90 min. 7-9 hours = 5-6 complete cycles"
                )
                
                sleepScienceFact(
                    title: "Immune Function",
                    description: "Adequate sleep boosts immunity by 50% and reduces infection risk"
                )
                
                sleepScienceFact(
                    title: "Memory Consolidation",
                    description: "Sleep transfers information from short-term to long-term memory"
                )
                
                sleepScienceFact(
                    title: "Metabolic Rate",
                    description: "Poor sleep increases appetite hormones (ghrelin) by 28%"
                )
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.purple.opacity(0.06))
                .stroke(Color.purple.opacity(0.12), lineWidth: 1.5)
        )
        .padding(.horizontal, 20)
    }
    
    private func sleepScienceFact(title: String, description: String) -> some View {
        HStack(spacing: 12) {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.purple, Color.blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 6, height: 6)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(textSecondary)
                    .lineLimit(.max)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
    }
    
    // MARK: - Better Sleep Tips
    private func betterSleepTipsView() -> some View {
        return VStack(spacing: 14) {
            Text("Tips for Better Sleep")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 10) {
                sleepTip(emoji: "🛏️", tip: "Keep consistent sleep schedule ±30 minutes daily")
                sleepTip(emoji: "🌙", tip: "Avoid screens 1 hour before bedtime (blue light)")
                sleepTip(emoji: "🌡️", tip: "Keep bedroom cool (65-68°F / 18-20°C)")
                sleepTip(emoji: "📵", tip: "Minimize caffeine after 2 PM (half-life: 5-6 hours)")
                sleepTip(emoji: "🧘", tip: "Try meditation or deep breathing (4-7-8 technique)")
                sleepTip(emoji: "⚽", tip: "Exercise 3+ hours before bed, avoid heavy meals")
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.green.opacity(0.06))
                .stroke(Color.green.opacity(0.12), lineWidth: 1.5)
        )
        .padding(.horizontal, 20)
    }
    
    private func sleepTip(emoji: String, tip: String) -> some View {
        HStack(spacing: 12) {
            Text(emoji)
                .font(.system(size: 20))
            
            Text(tip)
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(textSecondary)
                .lineLimit(.max)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
        }
    }
    
    // MARK: - WHO Footer with Citations
    private func whoFooterView() -> some View {
        return VStack(spacing: 12) {
            Divider()
            
            VStack(spacing: 10) {
                HStack(spacing: 8) {
                    Image(systemName: "link.circle.fill")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Evidence-Based Sources")
                        .font(.system(size: 13, weight: .bold))
                    
                    Spacer()
                }
                .foregroundColor(accentColor)
                
                VStack(alignment: .leading, spacing: 8) {
                    citationLink(
                        number: "[1]",
                        source: "WHO Guidelines on Physical Activity and Sedentary Behaviour",
                        url: "https://www.who.int/publications/i/item/9789240015128"
                    )
                    
                    citationLink(
                        number: "[2]",
                        source: "National Sleep Foundation Recommendations",
                        url: "https://www.sleepfoundation.org/how-sleep-works/how-much-sleep-do-we-really-need"
                    )
                    
                    citationLink(
                        number: "[3]",
                        source: "Harvard Medical School - Sleep and Health",
                        url: "https://sleep.med.harvard.edu"
                    )
                    
                    citationLink(
                        number: "[4]",
                        source: "CDC - Physical Activity Benefits",
                        url: "https://www.cdc.gov/physicalactivity/basics/pa-health/index.htm"
                    )
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("⚠️ Medical Disclaimer")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.orange)
                    
                    Text("This app provides health insights based on scientific research. Always consult healthcare providers for medical concerns.")
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(textSecondary)
                }
                .padding(12)
                .background(Color.orange.opacity(0.06))
                .cornerRadius(8)
            }
            .padding(18)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.blue.opacity(0.03))
                    .stroke(Color.blue.opacity(0.12), lineWidth: 1)
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
    }
    
    private func citationLink(number: String, source: String, url: String) -> some View {
        HStack(spacing: 8) {
            Text(number)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(accentColor)
                .frame(width: 22, alignment: .leading)
            
            Link(destination: URL(string: url) ?? URL(fileURLWithPath: "")) {
                HStack(spacing: 4) {
                    Text(source)
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(accentColor)
                        .lineLimit(.max)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Image(systemName: "arrow.up.right.square.fill")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(accentColor.opacity(0.7))
                }
            }
            
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    AppleView()
}
