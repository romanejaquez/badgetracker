import 'package:badgetracker/models/badge.dart';
import 'package:badgetracker/models/session.dart';
import 'package:flutter/material.dart';

class Utils {
  static const Color darkGrey = Color(0xFF555555);
  static const Color lightBlue = Color(0xFFEFF9FF);
  static const Color mainBlue = Color(0xFF008DE5);
  static const Color mainGreen = Color(0xFF34A853);
  static const Color lightGrey = Color(0xFFE5E5E5);
  static const Color lightGreen = Color(0xFFCFEBD6);
  static const Color mainYellow = Color(0xFFFBBC39);
  static const Color mainRed = Color(0xFFEA4335);

  static List<Session> getDefaultSessions() {
    
    return [
      Session(
        index: 0,
        isSelected: false,
        date: '2022-07-07T00:00:00Z',
        badges: [
          Badge(
            badgeTitle: 'Preparing for Your Associate Cloud Engineer Journey',
            link: ''
          ),
          Badge(
            badgeTitle: 'Google Cloud Fundamentals: Core Infrastructure',
            link: ''
          ),
          Badge(
            badgeTitle: 'Create and Manage Cloud Resources',
            link: ''
          )
        ]
      ),
      Session(
        index: 1,
        isSelected: false,
        date: '2022-07-21T00:00:00Z',
        badges: [
          Badge(
            badgeTitle: 'Essential Google Cloud Infrastructure: Foundation',
            link: ''
          ),
          Badge(
            badgeTitle: 'Perform Foundational Infrastructure Tasks in Google Cloud',
            link: ''
          ),
        ]
      ),
      Session(
        index: 2,
        isSelected: false,
        date: '2022-08-04T00:00:00Z',
        badges: [
          Badge(
            badgeTitle: 'Essential Google Cloud Infrastructure: Core Services',
            link: ''
          ),
          Badge(
            badgeTitle: 'Set Up and Configure a Cloud Environment in Google Cloud',
            link: ''
          ),
        ]
      ),
      Session(
        index: 3,
        isSelected: false,
        date: '2022-08-18T00:00:00Z',
        badges: [
          Badge(
            badgeTitle: 'Elastic Google Cloud Infrastructure: Scaling and Automation',
            link: ''
          ),
          Badge(
            badgeTitle: 'Automating Infrastructure on Google Cloud with Terraform',
            link: ''
          ),
        ]
      ),
      Session(
        index: 4,
        isSelected: false,
        date: '2022-09-01T00:00:00Z',
        badges: [
          Badge(
            badgeTitle: 'Reliable Google Cloud Infrastructure: Design and Process',
            link: ''
          ),
        ]
      ),
      Session(
        index: 5,
        isSelected: false,
        date: '2022-09-15T00:00:00Z',
        badges: [
          Badge(
            badgeTitle: 'Getting Started with Google Kubernetes Engine',
            link: ''
          ),
          Badge(
            badgeTitle: 'Deploy to Kubernetes in Google Cloud',
            link: ''
          ),
        ]
      )
    ];
  }
}