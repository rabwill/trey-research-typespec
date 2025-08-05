import "@typespec/http";
import "@microsoft/typespec-m365-copilot";

using TypeSpec.Http;
using TypeSpec.M365.Copilot.Actions;

@service
@server(TreyAPI.SERVER_URL)
@actions(TreyAPI.ACTIONS_METADATA)
namespace TreyAPI{
  /**
   * Metadata for the API actions.
   */
  const ACTIONS_METADATA = #{
    nameForHuman: "Trey Research Agent",
    descriptionForHuman: "You are a handy assistant for consultants at Trey Research, a boutique consultancy specializing in software development and clinical trials.",
    descriptionForModel: "You are a handy assistant for consultants at Trey Research, a boutique consultancy specializing in software development and clinical trials.",
    legalInfoUrl: "https://docs.github.com/en/site-policy/github-terms/github-terms-of-service",
    privacyPolicyUrl: "https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement"
  };

  /**
   * The base URL for the  API.
   */
  const SERVER_URL = "https://wx1gq6fz-7071.asse.devtunnels.ms/api";

  /**
 * Get consultant profile of the logged in user.
 */

  @route("/me")
  @get  op getUserInformation(): Consultant;


  /* model definitions*/
  model Location {
    street: string;
    city: string;
    state: string;
    country: string;
    postalCode: string;
    latitude: float64;
    longitude: float64;
  }
  
  model Project {
    projectName: string;
    projectDescription: string;
    projectLocation: Location;
    mapUrl: url;
    role: string;
    forecastThisMonth: int32;
    forecastNextMonth: int32;
    deliveredLastMonth: int32;
    deliveredThisMonth: int32;
  }

  model Consultant {
    id: string;
    name: string;
    @format("email")
    email: string;
    phone: string;
    location: Location;
    skills: string[];
    certifications: string[];
    roles: string[];
    @format("uri")
    consultantPhotoUrl: string;
    projects: Project[];
    forecastThisMonth: int32;
    forecastNextMonth: int32;
    deliveredLastMonth: int32;
    deliveredThisMonth: int32;
  }
   
}