//
//  EventTypes.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/1/18.
//

import Foundation

public enum EventTypes: String {
    case CheckRunEvent
    case CheckSuiteEvent
    case CommitCommentEvent
    case CreateEvent
    case DeleteEvent
    case DeploymentEvent
    case DeploymentStatusEvent
    case DownloadEvent
    case FollowEvent
    case ForkEvent
    case ForkApplyEvent
    case GitHubAppAuthorizationEvent
    case GistEvent
    case GollumEvent
    case InstallationEvent
    case InstallationRepositoriesEvent
    case IssueCommentEvent
    case IssuesEvent
    case LabelEvent
    case MemberEvent
    case MembershipEvent
    case MilestoneEvent
    case OrganizationEvent
    case PageBuildEvent
    case ProjectCardEvent
    case ProjectColumnEvent
    case ProjectEvent
    case PublicEvent
    case PullRequestEvent
    case PullRequestReviewEvent
    case PullRequestReviewCommentEvent
    case PushEvent
    case ReleaseEvent
    case RepositoryEvent
    case StatusEvent
    case TeamEvent
    case TeamAddEvent
    case UserEvent
    case WatchEvent
}
