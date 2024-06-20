; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18770 () Bool)

(assert start!18770)

(declare-fun b!93185 () Bool)

(declare-fun res!76917 () Bool)

(declare-fun e!61203 () Bool)

(assert (=> b!93185 (=> (not res!76917) (not e!61203))))

(declare-datatypes ((array!4362 0))(
  ( (array!4363 (arr!2595 (Array (_ BitVec 32) (_ BitVec 8))) (size!1978 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3478 0))(
  ( (BitStream!3479 (buf!2348 array!4362) (currentByte!4690 (_ BitVec 32)) (currentBit!4685 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3478)

(declare-fun base!8 () BitStream!3478)

(declare-fun isPrefixOf!0 (BitStream!3478 BitStream!3478) Bool)

(assert (=> b!93185 (= res!76917 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93186 () Bool)

(declare-fun res!76916 () Bool)

(assert (=> b!93186 (=> (not res!76916) (not e!61203))))

(declare-datatypes ((List!845 0))(
  ( (Nil!842) (Cons!841 (h!960 Bool) (t!1595 List!845)) )
))
(declare-fun listBits!13 () List!845)

(declare-fun length!436 (List!845) Int)

(assert (=> b!93186 (= res!76916 (> (length!436 listBits!13) 0))))

(declare-fun b!93187 () Bool)

(declare-fun res!76918 () Bool)

(assert (=> b!93187 (=> (not res!76918) (not e!61203))))

(declare-fun bitStream2!8 () BitStream!3478)

(assert (=> b!93187 (= res!76918 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93188 () Bool)

(declare-fun e!61207 () Bool)

(declare-fun array_inv!1804 (array!4362) Bool)

(assert (=> b!93188 (= e!61207 (array_inv!1804 (buf!2348 bitStream2!8)))))

(declare-fun b!93189 () Bool)

(declare-fun res!76920 () Bool)

(assert (=> b!93189 (=> (not res!76920) (not e!61203))))

(assert (=> b!93189 (= res!76920 (and (= (buf!2348 bitStream1!8) (buf!2348 bitStream2!8)) (= (buf!2348 bitStream1!8) (buf!2348 base!8))))))

(declare-fun b!93191 () Bool)

(declare-fun res!76915 () Bool)

(assert (=> b!93191 (=> (not res!76915) (not e!61203))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93191 (= res!76915 (bvslt (bitIndex!0 (size!1978 (buf!2348 base!8)) (currentByte!4690 base!8) (currentBit!4685 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93192 () Bool)

(declare-fun e!61204 () Bool)

(assert (=> b!93192 (= e!61204 (array_inv!1804 (buf!2348 bitStream1!8)))))

(declare-fun res!76914 () Bool)

(assert (=> start!18770 (=> (not res!76914) (not e!61203))))

(assert (=> start!18770 (= res!76914 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18770 e!61203))

(assert (=> start!18770 true))

(declare-fun inv!12 (BitStream!3478) Bool)

(assert (=> start!18770 (and (inv!12 bitStream1!8) e!61204)))

(assert (=> start!18770 (and (inv!12 bitStream2!8) e!61207)))

(declare-fun e!61209 () Bool)

(assert (=> start!18770 (and (inv!12 base!8) e!61209)))

(declare-fun b!93190 () Bool)

(assert (=> b!93190 (= e!61203 false)))

(declare-fun lt!138431 () (_ BitVec 64))

(assert (=> b!93190 (= lt!138431 (bitIndex!0 (size!1978 (buf!2348 bitStream2!8)) (currentByte!4690 bitStream2!8) (currentBit!4685 bitStream2!8)))))

(declare-fun lt!138432 () (_ BitVec 64))

(assert (=> b!93190 (= lt!138432 (bitIndex!0 (size!1978 (buf!2348 bitStream1!8)) (currentByte!4690 bitStream1!8) (currentBit!4685 bitStream1!8)))))

(declare-fun b!93193 () Bool)

(assert (=> b!93193 (= e!61209 (array_inv!1804 (buf!2348 base!8)))))

(declare-fun b!93194 () Bool)

(declare-fun res!76919 () Bool)

(assert (=> b!93194 (=> (not res!76919) (not e!61203))))

(assert (=> b!93194 (= res!76919 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(assert (= (and start!18770 res!76914) b!93186))

(assert (= (and b!93186 res!76916) b!93185))

(assert (= (and b!93185 res!76917) b!93187))

(assert (= (and b!93187 res!76918) b!93194))

(assert (= (and b!93194 res!76919) b!93189))

(assert (= (and b!93189 res!76920) b!93191))

(assert (= (and b!93191 res!76915) b!93190))

(assert (= start!18770 b!93192))

(assert (= start!18770 b!93188))

(assert (= start!18770 b!93193))

(declare-fun m!137015 () Bool)

(assert (=> b!93194 m!137015))

(declare-fun m!137017 () Bool)

(assert (=> b!93192 m!137017))

(declare-fun m!137019 () Bool)

(assert (=> b!93188 m!137019))

(declare-fun m!137021 () Bool)

(assert (=> b!93186 m!137021))

(declare-fun m!137023 () Bool)

(assert (=> start!18770 m!137023))

(declare-fun m!137025 () Bool)

(assert (=> start!18770 m!137025))

(declare-fun m!137027 () Bool)

(assert (=> start!18770 m!137027))

(declare-fun m!137029 () Bool)

(assert (=> b!93185 m!137029))

(declare-fun m!137031 () Bool)

(assert (=> b!93193 m!137031))

(declare-fun m!137033 () Bool)

(assert (=> b!93187 m!137033))

(declare-fun m!137035 () Bool)

(assert (=> b!93191 m!137035))

(declare-fun m!137037 () Bool)

(assert (=> b!93190 m!137037))

(declare-fun m!137039 () Bool)

(assert (=> b!93190 m!137039))

(push 1)

(assert (not b!93191))

(assert (not b!93187))

(assert (not b!93186))

(assert (not b!93188))

(assert (not b!93192))

(assert (not b!93194))

(assert (not b!93190))

(assert (not b!93185))

(assert (not start!18770))

(assert (not b!93193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

