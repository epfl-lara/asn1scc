; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19978 () Bool)

(assert start!19978)

(declare-fun b!99430 () Bool)

(declare-fun e!65071 () Bool)

(declare-fun e!65073 () Bool)

(assert (=> b!99430 (= e!65071 e!65073)))

(declare-fun res!81578 () Bool)

(assert (=> b!99430 (=> (not res!81578) (not e!65073))))

(declare-fun lt!144288 () Bool)

(declare-datatypes ((array!4677 0))(
  ( (array!4678 (arr!2727 (Array (_ BitVec 32) (_ BitVec 8))) (size!2134 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3742 0))(
  ( (BitStream!3743 (buf!2491 array!4677) (currentByte!4937 (_ BitVec 32)) (currentBit!4932 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8002 0))(
  ( (tuple2!8003 (_1!4256 BitStream!3742) (_2!4256 Bool)) )
))
(declare-fun lt!144289 () tuple2!8002)

(declare-datatypes ((Unit!6095 0))(
  ( (Unit!6096) )
))
(declare-datatypes ((tuple2!8004 0))(
  ( (tuple2!8005 (_1!4257 Unit!6095) (_2!4257 BitStream!3742)) )
))
(declare-fun lt!144292 () tuple2!8004)

(assert (=> b!99430 (= res!81578 (and (= (_2!4256 lt!144289) lt!144288) (= (_1!4256 lt!144289) (_2!4257 lt!144292))))))

(declare-fun thiss!1305 () BitStream!3742)

(declare-fun readBitPure!0 (BitStream!3742) tuple2!8002)

(declare-fun readerFrom!0 (BitStream!3742 (_ BitVec 32) (_ BitVec 32)) BitStream!3742)

(assert (=> b!99430 (= lt!144289 (readBitPure!0 (readerFrom!0 (_2!4257 lt!144292) (currentBit!4932 thiss!1305) (currentByte!4937 thiss!1305))))))

(declare-fun b!99431 () Bool)

(declare-fun e!65074 () Bool)

(assert (=> b!99431 (= e!65074 (not true))))

(declare-fun e!65075 () Bool)

(assert (=> b!99431 e!65075))

(declare-fun res!81575 () Bool)

(assert (=> b!99431 (=> (not res!81575) (not e!65075))))

(assert (=> b!99431 (= res!81575 (= (size!2134 (buf!2491 thiss!1305)) (size!2134 (buf!2491 (_2!4257 lt!144292)))))))

(declare-fun appendBit!0 (BitStream!3742 Bool) tuple2!8004)

(assert (=> b!99431 (= lt!144292 (appendBit!0 thiss!1305 lt!144288))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!99431 (= lt!144288 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99432 () Bool)

(declare-fun lt!144291 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99432 (= e!65073 (= (bitIndex!0 (size!2134 (buf!2491 (_1!4256 lt!144289))) (currentByte!4937 (_1!4256 lt!144289)) (currentBit!4932 (_1!4256 lt!144289))) lt!144291))))

(declare-fun b!99433 () Bool)

(assert (=> b!99433 (= e!65075 e!65071)))

(declare-fun res!81576 () Bool)

(assert (=> b!99433 (=> (not res!81576) (not e!65071))))

(declare-fun lt!144290 () (_ BitVec 64))

(assert (=> b!99433 (= res!81576 (= lt!144291 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144290)))))

(assert (=> b!99433 (= lt!144291 (bitIndex!0 (size!2134 (buf!2491 (_2!4257 lt!144292))) (currentByte!4937 (_2!4257 lt!144292)) (currentBit!4932 (_2!4257 lt!144292))))))

(assert (=> b!99433 (= lt!144290 (bitIndex!0 (size!2134 (buf!2491 thiss!1305)) (currentByte!4937 thiss!1305) (currentBit!4932 thiss!1305)))))

(declare-fun b!99434 () Bool)

(declare-fun res!81577 () Bool)

(assert (=> b!99434 (=> (not res!81577) (not e!65074))))

(assert (=> b!99434 (= res!81577 (bvslt i!615 nBits!396))))

(declare-fun b!99435 () Bool)

(declare-fun res!81572 () Bool)

(assert (=> b!99435 (=> (not res!81572) (not e!65071))))

(declare-fun isPrefixOf!0 (BitStream!3742 BitStream!3742) Bool)

(assert (=> b!99435 (= res!81572 (isPrefixOf!0 thiss!1305 (_2!4257 lt!144292)))))

(declare-fun b!99436 () Bool)

(declare-fun res!81571 () Bool)

(assert (=> b!99436 (=> (not res!81571) (not e!65074))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99436 (= res!81571 (validate_offset_bits!1 ((_ sign_extend 32) (size!2134 (buf!2491 thiss!1305))) ((_ sign_extend 32) (currentByte!4937 thiss!1305)) ((_ sign_extend 32) (currentBit!4932 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99437 () Bool)

(declare-fun res!81574 () Bool)

(assert (=> b!99437 (=> (not res!81574) (not e!65074))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99437 (= res!81574 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99429 () Bool)

(declare-fun e!65072 () Bool)

(declare-fun array_inv!1936 (array!4677) Bool)

(assert (=> b!99429 (= e!65072 (array_inv!1936 (buf!2491 thiss!1305)))))

(declare-fun res!81573 () Bool)

(assert (=> start!19978 (=> (not res!81573) (not e!65074))))

(assert (=> start!19978 (= res!81573 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19978 e!65074))

(assert (=> start!19978 true))

(declare-fun inv!12 (BitStream!3742) Bool)

(assert (=> start!19978 (and (inv!12 thiss!1305) e!65072)))

(assert (= (and start!19978 res!81573) b!99436))

(assert (= (and b!99436 res!81571) b!99437))

(assert (= (and b!99437 res!81574) b!99434))

(assert (= (and b!99434 res!81577) b!99431))

(assert (= (and b!99431 res!81575) b!99433))

(assert (= (and b!99433 res!81576) b!99435))

(assert (= (and b!99435 res!81572) b!99430))

(assert (= (and b!99430 res!81578) b!99432))

(assert (= start!19978 b!99429))

(declare-fun m!144799 () Bool)

(assert (=> b!99430 m!144799))

(assert (=> b!99430 m!144799))

(declare-fun m!144801 () Bool)

(assert (=> b!99430 m!144801))

(declare-fun m!144803 () Bool)

(assert (=> b!99431 m!144803))

(declare-fun m!144805 () Bool)

(assert (=> start!19978 m!144805))

(declare-fun m!144807 () Bool)

(assert (=> b!99437 m!144807))

(declare-fun m!144809 () Bool)

(assert (=> b!99432 m!144809))

(declare-fun m!144811 () Bool)

(assert (=> b!99436 m!144811))

(declare-fun m!144813 () Bool)

(assert (=> b!99429 m!144813))

(declare-fun m!144815 () Bool)

(assert (=> b!99433 m!144815))

(declare-fun m!144817 () Bool)

(assert (=> b!99433 m!144817))

(declare-fun m!144819 () Bool)

(assert (=> b!99435 m!144819))

(push 1)

(assert (not b!99433))

(assert (not b!99431))

(assert (not b!99430))

(assert (not b!99435))

(assert (not b!99432))

(assert (not b!99436))

(assert (not start!19978))

(assert (not b!99437))

(assert (not b!99429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

