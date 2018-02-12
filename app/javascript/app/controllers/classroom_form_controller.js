import { Controller } from "stimulus";
import NestedFields from "../nested_fields.js";

export default class extends Controller {
  initialize() {
    new NestedFields();
  }
}
