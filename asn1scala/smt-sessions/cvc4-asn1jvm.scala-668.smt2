; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18780 () Bool)

(assert start!18780)

(declare-fun b!93359 () Bool)

(declare-fun e!61314 () Bool)

(declare-datatypes ((array!4372 0))(
  ( (array!4373 (arr!2600 (Array (_ BitVec 32) (_ BitVec 8))) (size!1983 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3488 0))(
  ( (BitStream!3489 (buf!2353 array!4372) (currentByte!4695 (_ BitVec 32)) (currentBit!4690 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3488)

(declare-fun array_inv!1809 (array!4372) Bool)

(assert (=> b!93359 (= e!61314 (array_inv!1809 (buf!2353 base!8)))))

(declare-fun b!93360 () Bool)

(declare-fun res!77049 () Bool)

(declare-fun e!61308 () Bool)

(assert (=> b!93360 (=> (not res!77049) (not e!61308))))

(declare-fun bitStream1!8 () BitStream!3488)

(declare-fun bitStream2!8 () BitStream!3488)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93360 (= res!77049 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1983 (buf!2353 bitStream1!8)) (currentByte!4695 bitStream1!8) (currentBit!4690 bitStream1!8))) (bitIndex!0 (size!1983 (buf!2353 bitStream2!8)) (currentByte!4695 bitStream2!8) (currentBit!4690 bitStream2!8))))))

(declare-fun b!93361 () Bool)

(declare-fun res!77048 () Bool)

(assert (=> b!93361 (=> (not res!77048) (not e!61308))))

(declare-fun isPrefixOf!0 (BitStream!3488 BitStream!3488) Bool)

(assert (=> b!93361 (= res!77048 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93362 () Bool)

(declare-fun res!77044 () Bool)

(assert (=> b!93362 (=> (not res!77044) (not e!61308))))

(declare-datatypes ((List!850 0))(
  ( (Nil!847) (Cons!846 (h!965 Bool) (t!1600 List!850)) )
))
(declare-fun listBits!13 () List!850)

(declare-fun length!441 (List!850) Int)

(assert (=> b!93362 (= res!77044 (> (length!441 listBits!13) 0))))

(declare-fun b!93363 () Bool)

(declare-fun res!77047 () Bool)

(assert (=> b!93363 (=> (not res!77047) (not e!61308))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93363 (= res!77047 (validate_offset_bits!1 ((_ sign_extend 32) (size!1983 (buf!2353 bitStream1!8))) ((_ sign_extend 32) (currentByte!4695 bitStream1!8)) ((_ sign_extend 32) (currentBit!4690 bitStream1!8)) nBits!484))))

(declare-fun b!93364 () Bool)

(declare-fun res!77052 () Bool)

(assert (=> b!93364 (=> (not res!77052) (not e!61308))))

(assert (=> b!93364 (= res!77052 (bvslt (bitIndex!0 (size!1983 (buf!2353 base!8)) (currentByte!4695 base!8) (currentBit!4690 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun res!77043 () Bool)

(assert (=> start!18780 (=> (not res!77043) (not e!61308))))

(assert (=> start!18780 (= res!77043 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18780 e!61308))

(assert (=> start!18780 true))

(declare-fun e!61312 () Bool)

(declare-fun inv!12 (BitStream!3488) Bool)

(assert (=> start!18780 (and (inv!12 bitStream1!8) e!61312)))

(declare-fun e!61309 () Bool)

(assert (=> start!18780 (and (inv!12 bitStream2!8) e!61309)))

(assert (=> start!18780 (and (inv!12 base!8) e!61314)))

(declare-fun b!93365 () Bool)

(assert (=> b!93365 (= e!61312 (array_inv!1809 (buf!2353 bitStream1!8)))))

(declare-fun b!93366 () Bool)

(declare-fun res!77045 () Bool)

(assert (=> b!93366 (=> (not res!77045) (not e!61308))))

(assert (=> b!93366 (= res!77045 (validate_offset_bits!1 ((_ sign_extend 32) (size!1983 (buf!2353 bitStream2!8))) ((_ sign_extend 32) (currentByte!4695 bitStream2!8)) ((_ sign_extend 32) (currentBit!4690 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93367 () Bool)

(declare-fun res!77051 () Bool)

(assert (=> b!93367 (=> (not res!77051) (not e!61308))))

(assert (=> b!93367 (= res!77051 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93368 () Bool)

(declare-fun res!77050 () Bool)

(assert (=> b!93368 (=> (not res!77050) (not e!61308))))

(assert (=> b!93368 (= res!77050 (and (= (buf!2353 bitStream1!8) (buf!2353 bitStream2!8)) (= (buf!2353 bitStream1!8) (buf!2353 base!8))))))

(declare-fun b!93369 () Bool)

(assert (=> b!93369 (= e!61309 (array_inv!1809 (buf!2353 bitStream2!8)))))

(declare-fun b!93370 () Bool)

(declare-fun res!77046 () Bool)

(assert (=> b!93370 (=> (not res!77046) (not e!61308))))

(assert (=> b!93370 (= res!77046 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93371 () Bool)

(assert (=> b!93371 (= e!61308 (bvslt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!18780 res!77043) b!93362))

(assert (= (and b!93362 res!77044) b!93370))

(assert (= (and b!93370 res!77046) b!93367))

(assert (= (and b!93367 res!77051) b!93361))

(assert (= (and b!93361 res!77048) b!93368))

(assert (= (and b!93368 res!77050) b!93364))

(assert (= (and b!93364 res!77052) b!93360))

(assert (= (and b!93360 res!77049) b!93363))

(assert (= (and b!93363 res!77047) b!93366))

(assert (= (and b!93366 res!77045) b!93371))

(assert (= start!18780 b!93365))

(assert (= start!18780 b!93369))

(assert (= start!18780 b!93359))

(declare-fun m!137153 () Bool)

(assert (=> b!93367 m!137153))

(declare-fun m!137155 () Bool)

(assert (=> b!93363 m!137155))

(declare-fun m!137157 () Bool)

(assert (=> b!93369 m!137157))

(declare-fun m!137159 () Bool)

(assert (=> b!93359 m!137159))

(declare-fun m!137161 () Bool)

(assert (=> b!93370 m!137161))

(declare-fun m!137163 () Bool)

(assert (=> b!93366 m!137163))

(declare-fun m!137165 () Bool)

(assert (=> b!93360 m!137165))

(declare-fun m!137167 () Bool)

(assert (=> b!93360 m!137167))

(declare-fun m!137169 () Bool)

(assert (=> start!18780 m!137169))

(declare-fun m!137171 () Bool)

(assert (=> start!18780 m!137171))

(declare-fun m!137173 () Bool)

(assert (=> start!18780 m!137173))

(declare-fun m!137175 () Bool)

(assert (=> b!93365 m!137175))

(declare-fun m!137177 () Bool)

(assert (=> b!93362 m!137177))

(declare-fun m!137179 () Bool)

(assert (=> b!93361 m!137179))

(declare-fun m!137181 () Bool)

(assert (=> b!93364 m!137181))

(push 1)

(assert (not b!93366))

(assert (not b!93360))

(assert (not b!93367))

(assert (not b!93365))

(assert (not b!93359))

(assert (not b!93369))

(assert (not b!93363))

(assert (not b!93361))

(assert (not start!18780))

(assert (not b!93364))

(assert (not b!93362))

(assert (not b!93370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

