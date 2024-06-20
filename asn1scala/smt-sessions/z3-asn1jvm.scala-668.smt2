; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18778 () Bool)

(assert start!18778)

(declare-fun b!93320 () Bool)

(declare-fun res!77018 () Bool)

(declare-fun e!61291 () Bool)

(assert (=> b!93320 (=> (not res!77018) (not e!61291))))

(declare-datatypes ((array!4370 0))(
  ( (array!4371 (arr!2599 (Array (_ BitVec 32) (_ BitVec 8))) (size!1982 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3486 0))(
  ( (BitStream!3487 (buf!2352 array!4370) (currentByte!4694 (_ BitVec 32)) (currentBit!4689 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3486)

(declare-fun base!8 () BitStream!3486)

(declare-fun isPrefixOf!0 (BitStream!3486 BitStream!3486) Bool)

(assert (=> b!93320 (= res!77018 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93321 () Bool)

(declare-fun res!77022 () Bool)

(assert (=> b!93321 (=> (not res!77022) (not e!61291))))

(declare-fun bitStream2!8 () BitStream!3486)

(assert (=> b!93321 (= res!77022 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93322 () Bool)

(declare-fun e!61293 () Bool)

(declare-fun array_inv!1808 (array!4370) Bool)

(assert (=> b!93322 (= e!61293 (array_inv!1808 (buf!2352 base!8)))))

(declare-fun b!93323 () Bool)

(declare-fun res!77014 () Bool)

(assert (=> b!93323 (=> (not res!77014) (not e!61291))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93323 (= res!77014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1982 (buf!2352 bitStream1!8))) ((_ sign_extend 32) (currentByte!4694 bitStream1!8)) ((_ sign_extend 32) (currentBit!4689 bitStream1!8)) nBits!484))))

(declare-fun b!93324 () Bool)

(declare-fun res!77013 () Bool)

(assert (=> b!93324 (=> (not res!77013) (not e!61291))))

(declare-datatypes ((List!849 0))(
  ( (Nil!846) (Cons!845 (h!964 Bool) (t!1599 List!849)) )
))
(declare-fun listBits!13 () List!849)

(declare-fun length!440 (List!849) Int)

(assert (=> b!93324 (= res!77013 (> (length!440 listBits!13) 0))))

(declare-fun b!93325 () Bool)

(declare-fun res!77016 () Bool)

(assert (=> b!93325 (=> (not res!77016) (not e!61291))))

(assert (=> b!93325 (= res!77016 (and (= (buf!2352 bitStream1!8) (buf!2352 bitStream2!8)) (= (buf!2352 bitStream1!8) (buf!2352 base!8))))))

(declare-fun b!93326 () Bool)

(declare-fun res!77015 () Bool)

(assert (=> b!93326 (=> (not res!77015) (not e!61291))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93326 (= res!77015 (bvslt (bitIndex!0 (size!1982 (buf!2352 base!8)) (currentByte!4694 base!8) (currentBit!4689 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93327 () Bool)

(declare-fun res!77019 () Bool)

(assert (=> b!93327 (=> (not res!77019) (not e!61291))))

(assert (=> b!93327 (= res!77019 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1982 (buf!2352 bitStream1!8)) (currentByte!4694 bitStream1!8) (currentBit!4689 bitStream1!8))) (bitIndex!0 (size!1982 (buf!2352 bitStream2!8)) (currentByte!4694 bitStream2!8) (currentBit!4689 bitStream2!8))))))

(declare-fun b!93329 () Bool)

(declare-fun e!61292 () Bool)

(assert (=> b!93329 (= e!61292 (array_inv!1808 (buf!2352 bitStream2!8)))))

(declare-fun b!93330 () Bool)

(declare-fun e!61290 () Bool)

(assert (=> b!93330 (= e!61290 (array_inv!1808 (buf!2352 bitStream1!8)))))

(declare-fun b!93331 () Bool)

(declare-fun res!77017 () Bool)

(assert (=> b!93331 (=> (not res!77017) (not e!61291))))

(assert (=> b!93331 (= res!77017 (validate_offset_bits!1 ((_ sign_extend 32) (size!1982 (buf!2352 bitStream2!8))) ((_ sign_extend 32) (currentByte!4694 bitStream2!8)) ((_ sign_extend 32) (currentBit!4689 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93332 () Bool)

(assert (=> b!93332 (= e!61291 (bvslt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93328 () Bool)

(declare-fun res!77021 () Bool)

(assert (=> b!93328 (=> (not res!77021) (not e!61291))))

(assert (=> b!93328 (= res!77021 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun res!77020 () Bool)

(assert (=> start!18778 (=> (not res!77020) (not e!61291))))

(assert (=> start!18778 (= res!77020 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18778 e!61291))

(assert (=> start!18778 true))

(declare-fun inv!12 (BitStream!3486) Bool)

(assert (=> start!18778 (and (inv!12 bitStream1!8) e!61290)))

(assert (=> start!18778 (and (inv!12 bitStream2!8) e!61292)))

(assert (=> start!18778 (and (inv!12 base!8) e!61293)))

(assert (= (and start!18778 res!77020) b!93324))

(assert (= (and b!93324 res!77013) b!93320))

(assert (= (and b!93320 res!77018) b!93321))

(assert (= (and b!93321 res!77022) b!93328))

(assert (= (and b!93328 res!77021) b!93325))

(assert (= (and b!93325 res!77016) b!93326))

(assert (= (and b!93326 res!77015) b!93327))

(assert (= (and b!93327 res!77019) b!93323))

(assert (= (and b!93323 res!77014) b!93331))

(assert (= (and b!93331 res!77017) b!93332))

(assert (= start!18778 b!93330))

(assert (= start!18778 b!93329))

(assert (= start!18778 b!93322))

(declare-fun m!137123 () Bool)

(assert (=> b!93327 m!137123))

(declare-fun m!137125 () Bool)

(assert (=> b!93327 m!137125))

(declare-fun m!137127 () Bool)

(assert (=> b!93324 m!137127))

(declare-fun m!137129 () Bool)

(assert (=> b!93326 m!137129))

(declare-fun m!137131 () Bool)

(assert (=> b!93320 m!137131))

(declare-fun m!137133 () Bool)

(assert (=> b!93321 m!137133))

(declare-fun m!137135 () Bool)

(assert (=> b!93331 m!137135))

(declare-fun m!137137 () Bool)

(assert (=> b!93330 m!137137))

(declare-fun m!137139 () Bool)

(assert (=> b!93323 m!137139))

(declare-fun m!137141 () Bool)

(assert (=> b!93322 m!137141))

(declare-fun m!137143 () Bool)

(assert (=> b!93329 m!137143))

(declare-fun m!137145 () Bool)

(assert (=> start!18778 m!137145))

(declare-fun m!137147 () Bool)

(assert (=> start!18778 m!137147))

(declare-fun m!137149 () Bool)

(assert (=> start!18778 m!137149))

(declare-fun m!137151 () Bool)

(assert (=> b!93328 m!137151))

(check-sat (not b!93331) (not b!93323) (not b!93320) (not b!93327) (not b!93326) (not b!93328) (not b!93321) (not b!93322) (not start!18778) (not b!93324) (not b!93329) (not b!93330))
(check-sat)
