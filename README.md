# DefectDojo Import Scan ( GitHub Action )

This uploads reports from your workflow to your DefectDojo dashboard.

# What's new

- Upload any type of scan report

# Usage

See [action.yml](action.yml)

### Upload Report
```yaml
steps:
  - name: Clone code repository
    uses: actions/checkout@v2
  - name: Publish report
    id: import-scan
    uses: ivanamat/defectdojo-import-scan@v1
    with:
      token: ${{ secrets.DEFECTOJO_TOKEN }}
      defectdojo_url: ${{ secrets.DEFECTOJO_URL }}
      file: reports/trivy-scan-report.json
      scan_type: Trivy Scan
      engagement: 1
  - name: Show response
    run: |
      set -e
      printf '%s\n' '${{ steps.import-scan.outputs.response }}'
```
### Parameters
There are available the same parameters that are specified in your DefectDojo panel documentation ( https://defectdojo.mydomain.com/api/v2/doc/ ). Don't forget to see [action.yml](action.yml) for more information.

In addition you can provide defectdojo_endpoint where you can specify the import-scan endpoint if is different than /api/v2/import-scan/.

### Outputs

- **response:** This output returns the DefectDojo's API response. Usually, return the import result as a JSON string.

# Limitations
This action has the same limitations as your DefectDojo dashboard API. This action only executes a CURL to your DefectDojo's API import-scan endpoint with the params you have provided.

```bash
curl -v -X POST "$INPUT_DEFECTDOJO_URL$INPUT_DEFECTDOJO_ENDPOINT" -H "Authorization: Token $INPUT_TOKEN" -H "accept: application/json" -H  "Content-Type: multipart/form-data" -F '...'
```
See [entrypoint.sh](entrypoint.sh)

### Additional Documentation

DefectDojo official documentation https://defectdojo.github.io/django-DefectDojo/

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
