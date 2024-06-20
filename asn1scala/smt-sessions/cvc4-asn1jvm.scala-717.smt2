; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20018 () Bool)

(assert start!20018)

(declare-fun b!100119 () Bool)

(declare-fun res!82207 () Bool)

(declare-fun e!65520 () Bool)

(assert (=> b!100119 (=> (not res!82207) (not e!65520))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!100119 (= res!82207 (bvslt i!615 nBits!396))))

(declare-fun b!100120 () Bool)

(declare-fun res!82208 () Bool)

(declare-fun e!65526 () Bool)

(assert (=> b!100120 (=> (not res!82208) (not e!65526))))

(declare-datatypes ((array!4717 0))(
  ( (array!4718 (arr!2747 (Array (_ BitVec 32) (_ BitVec 8))) (size!2154 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3782 0))(
  ( (BitStream!3783 (buf!2511 array!4717) (currentByte!4957 (_ BitVec 32)) (currentBit!4952 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3782)

(declare-datatypes ((Unit!6135 0))(
  ( (Unit!6136) )
))
(declare-datatypes ((tuple2!8082 0))(
  ( (tuple2!8083 (_1!4296 Unit!6135) (_2!4296 BitStream!3782)) )
))
(declare-fun lt!144780 () tuple2!8082)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100120 (= res!82208 (invariant!0 (currentBit!4952 thiss!1305) (currentByte!4957 thiss!1305) (size!2154 (buf!2511 (_2!4296 lt!144780)))))))

(declare-fun b!100121 () Bool)

(assert (=> b!100121 (= e!65520 (not true))))

(declare-fun e!65524 () Bool)

(assert (=> b!100121 e!65524))

(declare-fun res!82206 () Bool)

(assert (=> b!100121 (=> (not res!82206) (not e!65524))))

(declare-datatypes ((tuple2!8084 0))(
  ( (tuple2!8085 (_1!4297 BitStream!3782) (_2!4297 Bool)) )
))
(declare-fun lt!144788 () tuple2!8084)

(declare-fun lt!144781 () tuple2!8084)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100121 (= res!82206 (= (bitIndex!0 (size!2154 (buf!2511 (_1!4297 lt!144788))) (currentByte!4957 (_1!4297 lt!144788)) (currentBit!4952 (_1!4297 lt!144788))) (bitIndex!0 (size!2154 (buf!2511 (_1!4297 lt!144781))) (currentByte!4957 (_1!4297 lt!144781)) (currentBit!4952 (_1!4297 lt!144781)))))))

(declare-fun lt!144784 () Unit!6135)

(declare-fun lt!144782 () BitStream!3782)

(declare-fun lt!144789 () tuple2!8082)

(declare-fun readBitPrefixLemma!0 (BitStream!3782 BitStream!3782) Unit!6135)

(assert (=> b!100121 (= lt!144784 (readBitPrefixLemma!0 lt!144782 (_2!4296 lt!144789)))))

(declare-fun readBitPure!0 (BitStream!3782) tuple2!8084)

(assert (=> b!100121 (= lt!144781 (readBitPure!0 (BitStream!3783 (buf!2511 (_2!4296 lt!144789)) (currentByte!4957 thiss!1305) (currentBit!4952 thiss!1305))))))

(assert (=> b!100121 (= lt!144788 (readBitPure!0 lt!144782))))

(assert (=> b!100121 (= lt!144782 (BitStream!3783 (buf!2511 (_2!4296 lt!144780)) (currentByte!4957 thiss!1305) (currentBit!4952 thiss!1305)))))

(assert (=> b!100121 e!65526))

(declare-fun res!82203 () Bool)

(assert (=> b!100121 (=> (not res!82203) (not e!65526))))

(declare-fun isPrefixOf!0 (BitStream!3782 BitStream!3782) Bool)

(assert (=> b!100121 (= res!82203 (isPrefixOf!0 thiss!1305 (_2!4296 lt!144789)))))

(declare-fun lt!144790 () Unit!6135)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3782 BitStream!3782 BitStream!3782) Unit!6135)

(assert (=> b!100121 (= lt!144790 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4296 lt!144780) (_2!4296 lt!144789)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3782 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8082)

(assert (=> b!100121 (= lt!144789 (appendNLeastSignificantBitsLoop!0 (_2!4296 lt!144780) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65523 () Bool)

(assert (=> b!100121 e!65523))

(declare-fun res!82211 () Bool)

(assert (=> b!100121 (=> (not res!82211) (not e!65523))))

(assert (=> b!100121 (= res!82211 (= (size!2154 (buf!2511 thiss!1305)) (size!2154 (buf!2511 (_2!4296 lt!144780)))))))

(declare-fun lt!144783 () Bool)

(declare-fun appendBit!0 (BitStream!3782 Bool) tuple2!8082)

(assert (=> b!100121 (= lt!144780 (appendBit!0 thiss!1305 lt!144783))))

(assert (=> b!100121 (= lt!144783 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100122 () Bool)

(declare-fun e!65519 () Bool)

(assert (=> b!100122 (= e!65523 e!65519)))

(declare-fun res!82205 () Bool)

(assert (=> b!100122 (=> (not res!82205) (not e!65519))))

(declare-fun lt!144785 () (_ BitVec 64))

(declare-fun lt!144786 () (_ BitVec 64))

(assert (=> b!100122 (= res!82205 (= lt!144785 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144786)))))

(assert (=> b!100122 (= lt!144785 (bitIndex!0 (size!2154 (buf!2511 (_2!4296 lt!144780))) (currentByte!4957 (_2!4296 lt!144780)) (currentBit!4952 (_2!4296 lt!144780))))))

(assert (=> b!100122 (= lt!144786 (bitIndex!0 (size!2154 (buf!2511 thiss!1305)) (currentByte!4957 thiss!1305) (currentBit!4952 thiss!1305)))))

(declare-fun b!100123 () Bool)

(declare-fun e!65522 () Bool)

(assert (=> b!100123 (= e!65519 e!65522)))

(declare-fun res!82202 () Bool)

(assert (=> b!100123 (=> (not res!82202) (not e!65522))))

(declare-fun lt!144787 () tuple2!8084)

(assert (=> b!100123 (= res!82202 (and (= (_2!4297 lt!144787) lt!144783) (= (_1!4297 lt!144787) (_2!4296 lt!144780))))))

(declare-fun readerFrom!0 (BitStream!3782 (_ BitVec 32) (_ BitVec 32)) BitStream!3782)

(assert (=> b!100123 (= lt!144787 (readBitPure!0 (readerFrom!0 (_2!4296 lt!144780) (currentBit!4952 thiss!1305) (currentByte!4957 thiss!1305))))))

(declare-fun b!100124 () Bool)

(declare-fun res!82204 () Bool)

(assert (=> b!100124 (=> (not res!82204) (not e!65519))))

(assert (=> b!100124 (= res!82204 (isPrefixOf!0 thiss!1305 (_2!4296 lt!144780)))))

(declare-fun b!100125 () Bool)

(declare-fun e!65525 () Bool)

(declare-fun array_inv!1956 (array!4717) Bool)

(assert (=> b!100125 (= e!65525 (array_inv!1956 (buf!2511 thiss!1305)))))

(declare-fun b!100126 () Bool)

(declare-fun res!82201 () Bool)

(assert (=> b!100126 (=> (not res!82201) (not e!65520))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100126 (= res!82201 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!100127 () Bool)

(assert (=> b!100127 (= e!65522 (= (bitIndex!0 (size!2154 (buf!2511 (_1!4297 lt!144787))) (currentByte!4957 (_1!4297 lt!144787)) (currentBit!4952 (_1!4297 lt!144787))) lt!144785))))

(declare-fun res!82209 () Bool)

(assert (=> start!20018 (=> (not res!82209) (not e!65520))))

(assert (=> start!20018 (= res!82209 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20018 e!65520))

(assert (=> start!20018 true))

(declare-fun inv!12 (BitStream!3782) Bool)

(assert (=> start!20018 (and (inv!12 thiss!1305) e!65525)))

(declare-fun b!100128 () Bool)

(assert (=> b!100128 (= e!65524 (= (_2!4297 lt!144788) (_2!4297 lt!144781)))))

(declare-fun b!100129 () Bool)

(assert (=> b!100129 (= e!65526 (invariant!0 (currentBit!4952 thiss!1305) (currentByte!4957 thiss!1305) (size!2154 (buf!2511 (_2!4296 lt!144789)))))))

(declare-fun b!100130 () Bool)

(declare-fun res!82210 () Bool)

(assert (=> b!100130 (=> (not res!82210) (not e!65520))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100130 (= res!82210 (validate_offset_bits!1 ((_ sign_extend 32) (size!2154 (buf!2511 thiss!1305))) ((_ sign_extend 32) (currentByte!4957 thiss!1305)) ((_ sign_extend 32) (currentBit!4952 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!20018 res!82209) b!100130))

(assert (= (and b!100130 res!82210) b!100126))

(assert (= (and b!100126 res!82201) b!100119))

(assert (= (and b!100119 res!82207) b!100121))

(assert (= (and b!100121 res!82211) b!100122))

(assert (= (and b!100122 res!82205) b!100124))

(assert (= (and b!100124 res!82204) b!100123))

(assert (= (and b!100123 res!82202) b!100127))

(assert (= (and b!100121 res!82203) b!100120))

(assert (= (and b!100120 res!82208) b!100129))

(assert (= (and b!100121 res!82206) b!100128))

(assert (= start!20018 b!100125))

(declare-fun m!145483 () Bool)

(assert (=> b!100122 m!145483))

(declare-fun m!145485 () Bool)

(assert (=> b!100122 m!145485))

(declare-fun m!145487 () Bool)

(assert (=> b!100120 m!145487))

(declare-fun m!145489 () Bool)

(assert (=> b!100129 m!145489))

(declare-fun m!145491 () Bool)

(assert (=> b!100124 m!145491))

(declare-fun m!145493 () Bool)

(assert (=> b!100121 m!145493))

(declare-fun m!145495 () Bool)

(assert (=> b!100121 m!145495))

(declare-fun m!145497 () Bool)

(assert (=> b!100121 m!145497))

(declare-fun m!145499 () Bool)

(assert (=> b!100121 m!145499))

(declare-fun m!145501 () Bool)

(assert (=> b!100121 m!145501))

(declare-fun m!145503 () Bool)

(assert (=> b!100121 m!145503))

(declare-fun m!145505 () Bool)

(assert (=> b!100121 m!145505))

(declare-fun m!145507 () Bool)

(assert (=> b!100121 m!145507))

(declare-fun m!145509 () Bool)

(assert (=> b!100121 m!145509))

(declare-fun m!145511 () Bool)

(assert (=> b!100125 m!145511))

(declare-fun m!145513 () Bool)

(assert (=> b!100130 m!145513))

(declare-fun m!145515 () Bool)

(assert (=> b!100123 m!145515))

(assert (=> b!100123 m!145515))

(declare-fun m!145517 () Bool)

(assert (=> b!100123 m!145517))

(declare-fun m!145519 () Bool)

(assert (=> start!20018 m!145519))

(declare-fun m!145521 () Bool)

(assert (=> b!100127 m!145521))

(declare-fun m!145523 () Bool)

(assert (=> b!100126 m!145523))

(push 1)

(assert (not b!100124))

(assert (not start!20018))

(assert (not b!100130))

(assert (not b!100121))

(assert (not b!100120))

(assert (not b!100122))

(assert (not b!100129))

(assert (not b!100127))

(assert (not b!100126))

(assert (not b!100123))

(assert (not b!100125))

(check-sat)

