; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27348 () Bool)

(assert start!27348)

(declare-fun b!140353 () Bool)

(declare-fun e!93548 () Bool)

(declare-datatypes ((array!6414 0))(
  ( (array!6415 (arr!3609 (Array (_ BitVec 32) (_ BitVec 8))) (size!2902 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5062 0))(
  ( (BitStream!5063 (buf!3323 array!6414) (currentByte!6174 (_ BitVec 32)) (currentBit!6169 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5062)

(declare-fun array_inv!2691 (array!6414) Bool)

(assert (=> b!140353 (= e!93548 (array_inv!2691 (buf!3323 thiss!1634)))))

(declare-fun res!117016 () Bool)

(declare-fun e!93549 () Bool)

(assert (=> start!27348 (=> (not res!117016) (not e!93549))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6414)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27348 (= res!117016 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2902 arr!237))))))

(assert (=> start!27348 e!93549))

(assert (=> start!27348 true))

(assert (=> start!27348 (array_inv!2691 arr!237)))

(declare-fun inv!12 (BitStream!5062) Bool)

(assert (=> start!27348 (and (inv!12 thiss!1634) e!93548)))

(declare-fun b!140354 () Bool)

(declare-fun res!117021 () Bool)

(declare-fun e!93547 () Bool)

(assert (=> b!140354 (=> (not res!117021) (not e!93547))))

(declare-datatypes ((Unit!8783 0))(
  ( (Unit!8784) )
))
(declare-datatypes ((tuple2!12286 0))(
  ( (tuple2!12287 (_1!6473 Unit!8783) (_2!6473 BitStream!5062)) )
))
(declare-fun lt!218697 () tuple2!12286)

(declare-fun isPrefixOf!0 (BitStream!5062 BitStream!5062) Bool)

(assert (=> b!140354 (= res!117021 (isPrefixOf!0 thiss!1634 (_2!6473 lt!218697)))))

(declare-fun b!140355 () Bool)

(declare-fun res!117019 () Bool)

(assert (=> b!140355 (=> (not res!117019) (not e!93549))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140355 (= res!117019 (invariant!0 (currentBit!6169 thiss!1634) (currentByte!6174 thiss!1634) (size!2902 (buf!3323 thiss!1634))))))

(declare-fun b!140356 () Bool)

(assert (=> b!140356 (= e!93549 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(assert (=> b!140356 e!93547))

(declare-fun res!117018 () Bool)

(assert (=> b!140356 (=> (not res!117018) (not e!93547))))

(assert (=> b!140356 (= res!117018 (= (size!2902 (buf!3323 thiss!1634)) (size!2902 (buf!3323 (_2!6473 lt!218697)))))))

(declare-fun appendByte!0 (BitStream!5062 (_ BitVec 8)) tuple2!12286)

(assert (=> b!140356 (= lt!218697 (appendByte!0 thiss!1634 (select (arr!3609 arr!237) from!447)))))

(declare-fun b!140357 () Bool)

(declare-fun res!117022 () Bool)

(assert (=> b!140357 (=> (not res!117022) (not e!93547))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140357 (= res!117022 (= (bitIndex!0 (size!2902 (buf!3323 (_2!6473 lt!218697))) (currentByte!6174 (_2!6473 lt!218697)) (currentBit!6169 (_2!6473 lt!218697))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2902 (buf!3323 thiss!1634)) (currentByte!6174 thiss!1634) (currentBit!6169 thiss!1634)))))))

(declare-fun b!140358 () Bool)

(declare-fun res!117020 () Bool)

(assert (=> b!140358 (=> (not res!117020) (not e!93549))))

(assert (=> b!140358 (= res!117020 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!12288 0))(
  ( (tuple2!12289 (_1!6474 BitStream!5062) (_2!6474 BitStream!5062)) )
))
(declare-fun lt!218698 () tuple2!12288)

(declare-datatypes ((tuple2!12290 0))(
  ( (tuple2!12291 (_1!6475 BitStream!5062) (_2!6475 (_ BitVec 8))) )
))
(declare-fun lt!218699 () tuple2!12290)

(declare-fun b!140359 () Bool)

(assert (=> b!140359 (= e!93547 (and (= (_2!6475 lt!218699) (select (arr!3609 arr!237) from!447)) (= (_1!6475 lt!218699) (_2!6474 lt!218698))))))

(declare-fun readBytePure!0 (BitStream!5062) tuple2!12290)

(assert (=> b!140359 (= lt!218699 (readBytePure!0 (_1!6474 lt!218698)))))

(declare-fun reader!0 (BitStream!5062 BitStream!5062) tuple2!12288)

(assert (=> b!140359 (= lt!218698 (reader!0 thiss!1634 (_2!6473 lt!218697)))))

(declare-fun b!140360 () Bool)

(declare-fun res!117017 () Bool)

(assert (=> b!140360 (=> (not res!117017) (not e!93549))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140360 (= res!117017 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2902 (buf!3323 thiss!1634))) ((_ sign_extend 32) (currentByte!6174 thiss!1634)) ((_ sign_extend 32) (currentBit!6169 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27348 res!117016) b!140360))

(assert (= (and b!140360 res!117017) b!140358))

(assert (= (and b!140358 res!117020) b!140355))

(assert (= (and b!140355 res!117019) b!140356))

(assert (= (and b!140356 res!117018) b!140357))

(assert (= (and b!140357 res!117022) b!140354))

(assert (= (and b!140354 res!117021) b!140359))

(assert (= start!27348 b!140353))

(declare-fun m!216137 () Bool)

(assert (=> start!27348 m!216137))

(declare-fun m!216139 () Bool)

(assert (=> start!27348 m!216139))

(declare-fun m!216141 () Bool)

(assert (=> b!140357 m!216141))

(declare-fun m!216143 () Bool)

(assert (=> b!140357 m!216143))

(declare-fun m!216145 () Bool)

(assert (=> b!140353 m!216145))

(declare-fun m!216147 () Bool)

(assert (=> b!140360 m!216147))

(declare-fun m!216149 () Bool)

(assert (=> b!140356 m!216149))

(assert (=> b!140356 m!216149))

(declare-fun m!216151 () Bool)

(assert (=> b!140356 m!216151))

(declare-fun m!216153 () Bool)

(assert (=> b!140354 m!216153))

(declare-fun m!216155 () Bool)

(assert (=> b!140355 m!216155))

(assert (=> b!140359 m!216149))

(declare-fun m!216157 () Bool)

(assert (=> b!140359 m!216157))

(declare-fun m!216159 () Bool)

(assert (=> b!140359 m!216159))

(push 1)

(assert (not b!140357))

(assert (not b!140360))

(assert (not start!27348))

(assert (not b!140353))

(assert (not b!140359))

(assert (not b!140356))

(assert (not b!140354))

(assert (not b!140355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

