; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18782 () Bool)

(assert start!18782)

(declare-fun b!93392 () Bool)

(declare-fun res!77068 () Bool)

(declare-fun e!61333 () Bool)

(assert (=> b!93392 (=> (not res!77068) (not e!61333))))

(declare-datatypes ((List!851 0))(
  ( (Nil!848) (Cons!847 (h!966 Bool) (t!1601 List!851)) )
))
(declare-fun listBits!13 () List!851)

(declare-fun length!442 (List!851) Int)

(assert (=> b!93392 (= res!77068 (> (length!442 listBits!13) 0))))

(declare-fun b!93393 () Bool)

(declare-fun res!77073 () Bool)

(assert (=> b!93393 (=> (not res!77073) (not e!61333))))

(declare-datatypes ((array!4374 0))(
  ( (array!4375 (arr!2601 (Array (_ BitVec 32) (_ BitVec 8))) (size!1984 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3490 0))(
  ( (BitStream!3491 (buf!2354 array!4374) (currentByte!4696 (_ BitVec 32)) (currentBit!4691 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3490)

(declare-fun bitStream2!8 () BitStream!3490)

(declare-fun isPrefixOf!0 (BitStream!3490 BitStream!3490) Bool)

(assert (=> b!93393 (= res!77073 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93395 () Bool)

(declare-fun res!77067 () Bool)

(assert (=> b!93395 (=> (not res!77067) (not e!61333))))

(declare-fun base!8 () BitStream!3490)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93395 (= res!77067 (bvslt (bitIndex!0 (size!1984 (buf!2354 base!8)) (currentByte!4696 base!8) (currentBit!4691 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93396 () Bool)

(declare-fun e!61334 () Bool)

(declare-fun array_inv!1810 (array!4374) Bool)

(assert (=> b!93396 (= e!61334 (array_inv!1810 (buf!2354 bitStream2!8)))))

(declare-fun b!93397 () Bool)

(declare-fun e!61329 () Bool)

(assert (=> b!93397 (= e!61329 (array_inv!1810 (buf!2354 bitStream1!8)))))

(declare-fun b!93398 () Bool)

(declare-fun res!77071 () Bool)

(assert (=> b!93398 (=> (not res!77071) (not e!61333))))

(assert (=> b!93398 (= res!77071 (and (= (buf!2354 bitStream1!8) (buf!2354 bitStream2!8)) (= (buf!2354 bitStream1!8) (buf!2354 base!8))))))

(declare-fun b!93399 () Bool)

(assert (=> b!93399 (= e!61333 false)))

(declare-fun lt!138449 () (_ BitVec 64))

(assert (=> b!93399 (= lt!138449 (bitIndex!0 (size!1984 (buf!2354 bitStream2!8)) (currentByte!4696 bitStream2!8) (currentBit!4691 bitStream2!8)))))

(declare-fun lt!138450 () (_ BitVec 64))

(assert (=> b!93399 (= lt!138450 (bitIndex!0 (size!1984 (buf!2354 bitStream1!8)) (currentByte!4696 bitStream1!8) (currentBit!4691 bitStream1!8)))))

(declare-fun res!77072 () Bool)

(assert (=> start!18782 (=> (not res!77072) (not e!61333))))

(assert (=> start!18782 (= res!77072 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18782 e!61333))

(assert (=> start!18782 true))

(declare-fun inv!12 (BitStream!3490) Bool)

(assert (=> start!18782 (and (inv!12 bitStream1!8) e!61329)))

(assert (=> start!18782 (and (inv!12 bitStream2!8) e!61334)))

(declare-fun e!61330 () Bool)

(assert (=> start!18782 (and (inv!12 base!8) e!61330)))

(declare-fun b!93394 () Bool)

(declare-fun res!77070 () Bool)

(assert (=> b!93394 (=> (not res!77070) (not e!61333))))

(assert (=> b!93394 (= res!77070 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93400 () Bool)

(declare-fun res!77069 () Bool)

(assert (=> b!93400 (=> (not res!77069) (not e!61333))))

(assert (=> b!93400 (= res!77069 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93401 () Bool)

(assert (=> b!93401 (= e!61330 (array_inv!1810 (buf!2354 base!8)))))

(assert (= (and start!18782 res!77072) b!93392))

(assert (= (and b!93392 res!77068) b!93400))

(assert (= (and b!93400 res!77069) b!93394))

(assert (= (and b!93394 res!77070) b!93393))

(assert (= (and b!93393 res!77073) b!93398))

(assert (= (and b!93398 res!77071) b!93395))

(assert (= (and b!93395 res!77067) b!93399))

(assert (= start!18782 b!93397))

(assert (= start!18782 b!93396))

(assert (= start!18782 b!93401))

(declare-fun m!137183 () Bool)

(assert (=> b!93399 m!137183))

(declare-fun m!137185 () Bool)

(assert (=> b!93399 m!137185))

(declare-fun m!137187 () Bool)

(assert (=> b!93395 m!137187))

(declare-fun m!137189 () Bool)

(assert (=> start!18782 m!137189))

(declare-fun m!137191 () Bool)

(assert (=> start!18782 m!137191))

(declare-fun m!137193 () Bool)

(assert (=> start!18782 m!137193))

(declare-fun m!137195 () Bool)

(assert (=> b!93392 m!137195))

(declare-fun m!137197 () Bool)

(assert (=> b!93396 m!137197))

(declare-fun m!137199 () Bool)

(assert (=> b!93393 m!137199))

(declare-fun m!137201 () Bool)

(assert (=> b!93397 m!137201))

(declare-fun m!137203 () Bool)

(assert (=> b!93394 m!137203))

(declare-fun m!137205 () Bool)

(assert (=> b!93400 m!137205))

(declare-fun m!137207 () Bool)

(assert (=> b!93401 m!137207))

(push 1)

(assert (not b!93397))

(assert (not b!93396))

(assert (not b!93401))

(assert (not b!93392))

(assert (not b!93393))

(assert (not start!18782))

(assert (not b!93399))

(assert (not b!93394))

(assert (not b!93395))

(assert (not b!93400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

