; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39962 () Bool)

(assert start!39962)

(declare-fun b!182069 () Bool)

(declare-fun res!151290 () Bool)

(declare-fun e!126385 () Bool)

(assert (=> b!182069 (=> (not res!151290) (not e!126385))))

(declare-datatypes ((array!9722 0))(
  ( (array!9723 (arr!5218 (Array (_ BitVec 32) (_ BitVec 8))) (size!4288 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7684 0))(
  ( (BitStream!7685 (buf!4737 array!9722) (currentByte!8959 (_ BitVec 32)) (currentBit!8954 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7684)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182069 (= res!151290 (invariant!0 (currentBit!8954 thiss!1204) (currentByte!8959 thiss!1204) (size!4288 (buf!4737 thiss!1204))))))

(declare-fun b!182070 () Bool)

(declare-fun e!126389 () Bool)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!182070 (= e!126389 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-datatypes ((Unit!13073 0))(
  ( (Unit!13074) )
))
(declare-datatypes ((tuple2!15716 0))(
  ( (tuple2!15717 (_1!8503 Unit!13073) (_2!8503 BitStream!7684)) )
))
(declare-fun lt!279546 () tuple2!15716)

(declare-fun lt!279558 () tuple2!15716)

(declare-fun lt!279542 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182070 (validate_offset_bits!1 ((_ sign_extend 32) (size!4288 (buf!4737 (_2!8503 lt!279546)))) ((_ sign_extend 32) (currentByte!8959 (_2!8503 lt!279558))) ((_ sign_extend 32) (currentBit!8954 (_2!8503 lt!279558))) lt!279542)))

(declare-fun lt!279552 () Unit!13073)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7684 array!9722 (_ BitVec 64)) Unit!13073)

(assert (=> b!182070 (= lt!279552 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8503 lt!279558) (buf!4737 (_2!8503 lt!279546)) lt!279542))))

(assert (=> b!182070 (= lt!279542 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!15718 0))(
  ( (tuple2!15719 (_1!8504 BitStream!7684) (_2!8504 BitStream!7684)) )
))
(declare-fun lt!279553 () tuple2!15718)

(declare-datatypes ((tuple2!15720 0))(
  ( (tuple2!15721 (_1!8505 BitStream!7684) (_2!8505 (_ BitVec 64))) )
))
(declare-fun lt!279559 () tuple2!15720)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15720)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182070 (= lt!279559 (readNBitsLSBFirstsLoopPure!0 (_1!8504 lt!279553) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279544 () (_ BitVec 64))

(assert (=> b!182070 (validate_offset_bits!1 ((_ sign_extend 32) (size!4288 (buf!4737 (_2!8503 lt!279546)))) ((_ sign_extend 32) (currentByte!8959 thiss!1204)) ((_ sign_extend 32) (currentBit!8954 thiss!1204)) lt!279544)))

(declare-fun lt!279557 () Unit!13073)

(assert (=> b!182070 (= lt!279557 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4737 (_2!8503 lt!279546)) lt!279544))))

(declare-fun lt!279550 () Bool)

(declare-datatypes ((tuple2!15722 0))(
  ( (tuple2!15723 (_1!8506 BitStream!7684) (_2!8506 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7684) tuple2!15722)

(assert (=> b!182070 (= (_2!8506 (readBitPure!0 (_1!8504 lt!279553))) lt!279550)))

(declare-fun lt!279551 () tuple2!15718)

(declare-fun reader!0 (BitStream!7684 BitStream!7684) tuple2!15718)

(assert (=> b!182070 (= lt!279551 (reader!0 (_2!8503 lt!279558) (_2!8503 lt!279546)))))

(assert (=> b!182070 (= lt!279553 (reader!0 thiss!1204 (_2!8503 lt!279546)))))

(declare-fun e!126393 () Bool)

(assert (=> b!182070 e!126393))

(declare-fun res!151289 () Bool)

(assert (=> b!182070 (=> (not res!151289) (not e!126393))))

(declare-fun lt!279555 () tuple2!15722)

(declare-fun lt!279560 () tuple2!15722)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182070 (= res!151289 (= (bitIndex!0 (size!4288 (buf!4737 (_1!8506 lt!279555))) (currentByte!8959 (_1!8506 lt!279555)) (currentBit!8954 (_1!8506 lt!279555))) (bitIndex!0 (size!4288 (buf!4737 (_1!8506 lt!279560))) (currentByte!8959 (_1!8506 lt!279560)) (currentBit!8954 (_1!8506 lt!279560)))))))

(declare-fun lt!279540 () Unit!13073)

(declare-fun lt!279543 () BitStream!7684)

(declare-fun readBitPrefixLemma!0 (BitStream!7684 BitStream!7684) Unit!13073)

(assert (=> b!182070 (= lt!279540 (readBitPrefixLemma!0 lt!279543 (_2!8503 lt!279546)))))

(assert (=> b!182070 (= lt!279560 (readBitPure!0 (BitStream!7685 (buf!4737 (_2!8503 lt!279546)) (currentByte!8959 thiss!1204) (currentBit!8954 thiss!1204))))))

(assert (=> b!182070 (= lt!279555 (readBitPure!0 lt!279543))))

(declare-fun e!126387 () Bool)

(assert (=> b!182070 e!126387))

(declare-fun res!151284 () Bool)

(assert (=> b!182070 (=> (not res!151284) (not e!126387))))

(assert (=> b!182070 (= res!151284 (invariant!0 (currentBit!8954 thiss!1204) (currentByte!8959 thiss!1204) (size!4288 (buf!4737 (_2!8503 lt!279558)))))))

(assert (=> b!182070 (= lt!279543 (BitStream!7685 (buf!4737 (_2!8503 lt!279558)) (currentByte!8959 thiss!1204) (currentBit!8954 thiss!1204)))))

(declare-fun b!182072 () Bool)

(declare-fun e!126384 () Bool)

(assert (=> b!182072 (= e!126384 e!126385)))

(declare-fun res!151291 () Bool)

(assert (=> b!182072 (=> (not res!151291) (not e!126385))))

(assert (=> b!182072 (= res!151291 (validate_offset_bits!1 ((_ sign_extend 32) (size!4288 (buf!4737 thiss!1204))) ((_ sign_extend 32) (currentByte!8959 thiss!1204)) ((_ sign_extend 32) (currentBit!8954 thiss!1204)) lt!279544))))

(assert (=> b!182072 (= lt!279544 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!182073 () Bool)

(assert (=> b!182073 (= e!126387 (invariant!0 (currentBit!8954 thiss!1204) (currentByte!8959 thiss!1204) (size!4288 (buf!4737 (_2!8503 lt!279546)))))))

(declare-fun b!182074 () Bool)

(declare-fun e!126390 () Bool)

(assert (=> b!182074 (= e!126385 (not e!126390))))

(declare-fun res!151283 () Bool)

(assert (=> b!182074 (=> res!151283 e!126390)))

(declare-fun lt!279554 () (_ BitVec 64))

(declare-fun lt!279547 () (_ BitVec 64))

(assert (=> b!182074 (= res!151283 (not (= lt!279554 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279547))))))

(assert (=> b!182074 (= lt!279554 (bitIndex!0 (size!4288 (buf!4737 (_2!8503 lt!279558))) (currentByte!8959 (_2!8503 lt!279558)) (currentBit!8954 (_2!8503 lt!279558))))))

(assert (=> b!182074 (= lt!279547 (bitIndex!0 (size!4288 (buf!4737 thiss!1204)) (currentByte!8959 thiss!1204) (currentBit!8954 thiss!1204)))))

(declare-fun e!126394 () Bool)

(assert (=> b!182074 e!126394))

(declare-fun res!151296 () Bool)

(assert (=> b!182074 (=> (not res!151296) (not e!126394))))

(assert (=> b!182074 (= res!151296 (= (size!4288 (buf!4737 thiss!1204)) (size!4288 (buf!4737 (_2!8503 lt!279558)))))))

(declare-fun appendBit!0 (BitStream!7684 Bool) tuple2!15716)

(assert (=> b!182074 (= lt!279558 (appendBit!0 thiss!1204 lt!279550))))

(assert (=> b!182074 (= lt!279550 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182075 () Bool)

(declare-fun res!151294 () Bool)

(assert (=> b!182075 (=> res!151294 e!126389)))

(declare-fun isPrefixOf!0 (BitStream!7684 BitStream!7684) Bool)

(assert (=> b!182075 (= res!151294 (not (isPrefixOf!0 thiss!1204 (_2!8503 lt!279558))))))

(declare-fun b!182076 () Bool)

(declare-fun e!126386 () Bool)

(declare-fun e!126391 () Bool)

(assert (=> b!182076 (= e!126386 e!126391)))

(declare-fun res!151286 () Bool)

(assert (=> b!182076 (=> (not res!151286) (not e!126391))))

(declare-fun lt!279541 () tuple2!15722)

(assert (=> b!182076 (= res!151286 (and (= (_2!8506 lt!279541) lt!279550) (= (_1!8506 lt!279541) (_2!8503 lt!279558))))))

(declare-fun readerFrom!0 (BitStream!7684 (_ BitVec 32) (_ BitVec 32)) BitStream!7684)

(assert (=> b!182076 (= lt!279541 (readBitPure!0 (readerFrom!0 (_2!8503 lt!279558) (currentBit!8954 thiss!1204) (currentByte!8959 thiss!1204))))))

(declare-fun b!182077 () Bool)

(declare-fun res!151281 () Bool)

(assert (=> b!182077 (=> (not res!151281) (not e!126386))))

(assert (=> b!182077 (= res!151281 (isPrefixOf!0 thiss!1204 (_2!8503 lt!279558)))))

(declare-fun b!182078 () Bool)

(declare-fun res!151295 () Bool)

(assert (=> b!182078 (=> res!151295 e!126389)))

(assert (=> b!182078 (= res!151295 (not (invariant!0 (currentBit!8954 (_2!8503 lt!279546)) (currentByte!8959 (_2!8503 lt!279546)) (size!4288 (buf!4737 (_2!8503 lt!279546))))))))

(declare-fun b!182079 () Bool)

(declare-fun res!151288 () Bool)

(assert (=> b!182079 (=> res!151288 e!126389)))

(declare-fun lt!279548 () (_ BitVec 64))

(assert (=> b!182079 (= res!151288 (or (not (= (size!4288 (buf!4737 (_2!8503 lt!279546))) (size!4288 (buf!4737 thiss!1204)))) (not (= lt!279548 (bvsub (bvadd lt!279547 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!182080 () Bool)

(declare-fun e!126388 () Bool)

(declare-fun array_inv!4029 (array!9722) Bool)

(assert (=> b!182080 (= e!126388 (array_inv!4029 (buf!4737 thiss!1204)))))

(declare-fun b!182081 () Bool)

(declare-fun res!151285 () Bool)

(assert (=> b!182081 (=> (not res!151285) (not e!126385))))

(assert (=> b!182081 (= res!151285 (not (= i!590 nBits!348)))))

(declare-fun res!151282 () Bool)

(assert (=> start!39962 (=> (not res!151282) (not e!126384))))

(assert (=> start!39962 (= res!151282 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39962 e!126384))

(assert (=> start!39962 true))

(declare-fun inv!12 (BitStream!7684) Bool)

(assert (=> start!39962 (and (inv!12 thiss!1204) e!126388)))

(declare-fun b!182071 () Bool)

(assert (=> b!182071 (= e!126394 e!126386)))

(declare-fun res!151287 () Bool)

(assert (=> b!182071 (=> (not res!151287) (not e!126386))))

(declare-fun lt!279556 () (_ BitVec 64))

(declare-fun lt!279549 () (_ BitVec 64))

(assert (=> b!182071 (= res!151287 (= lt!279556 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279549)))))

(assert (=> b!182071 (= lt!279556 (bitIndex!0 (size!4288 (buf!4737 (_2!8503 lt!279558))) (currentByte!8959 (_2!8503 lt!279558)) (currentBit!8954 (_2!8503 lt!279558))))))

(assert (=> b!182071 (= lt!279549 (bitIndex!0 (size!4288 (buf!4737 thiss!1204)) (currentByte!8959 thiss!1204) (currentBit!8954 thiss!1204)))))

(declare-fun b!182082 () Bool)

(declare-fun res!151293 () Bool)

(assert (=> b!182082 (=> res!151293 e!126389)))

(assert (=> b!182082 (= res!151293 (not (isPrefixOf!0 (_2!8503 lt!279558) (_2!8503 lt!279546))))))

(declare-fun b!182083 () Bool)

(assert (=> b!182083 (= e!126391 (= (bitIndex!0 (size!4288 (buf!4737 (_1!8506 lt!279541))) (currentByte!8959 (_1!8506 lt!279541)) (currentBit!8954 (_1!8506 lt!279541))) lt!279556))))

(declare-fun b!182084 () Bool)

(assert (=> b!182084 (= e!126390 e!126389)))

(declare-fun res!151292 () Bool)

(assert (=> b!182084 (=> res!151292 e!126389)))

(assert (=> b!182084 (= res!151292 (not (= lt!279548 (bvsub (bvsub (bvadd lt!279554 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!182084 (= lt!279548 (bitIndex!0 (size!4288 (buf!4737 (_2!8503 lt!279546))) (currentByte!8959 (_2!8503 lt!279546)) (currentBit!8954 (_2!8503 lt!279546))))))

(assert (=> b!182084 (isPrefixOf!0 thiss!1204 (_2!8503 lt!279546))))

(declare-fun lt!279545 () Unit!13073)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7684 BitStream!7684 BitStream!7684) Unit!13073)

(assert (=> b!182084 (= lt!279545 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8503 lt!279558) (_2!8503 lt!279546)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7684 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15716)

(assert (=> b!182084 (= lt!279546 (appendBitsLSBFirstLoopTR!0 (_2!8503 lt!279558) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!182085 () Bool)

(assert (=> b!182085 (= e!126393 (= (_2!8506 lt!279555) (_2!8506 lt!279560)))))

(assert (= (and start!39962 res!151282) b!182072))

(assert (= (and b!182072 res!151291) b!182069))

(assert (= (and b!182069 res!151290) b!182081))

(assert (= (and b!182081 res!151285) b!182074))

(assert (= (and b!182074 res!151296) b!182071))

(assert (= (and b!182071 res!151287) b!182077))

(assert (= (and b!182077 res!151281) b!182076))

(assert (= (and b!182076 res!151286) b!182083))

(assert (= (and b!182074 (not res!151283)) b!182084))

(assert (= (and b!182084 (not res!151292)) b!182078))

(assert (= (and b!182078 (not res!151295)) b!182079))

(assert (= (and b!182079 (not res!151288)) b!182082))

(assert (= (and b!182082 (not res!151293)) b!182075))

(assert (= (and b!182075 (not res!151294)) b!182070))

(assert (= (and b!182070 res!151284) b!182073))

(assert (= (and b!182070 res!151289) b!182085))

(assert (= start!39962 b!182080))

(declare-fun m!283231 () Bool)

(assert (=> b!182071 m!283231))

(declare-fun m!283233 () Bool)

(assert (=> b!182071 m!283233))

(declare-fun m!283235 () Bool)

(assert (=> b!182070 m!283235))

(declare-fun m!283237 () Bool)

(assert (=> b!182070 m!283237))

(declare-fun m!283239 () Bool)

(assert (=> b!182070 m!283239))

(declare-fun m!283241 () Bool)

(assert (=> b!182070 m!283241))

(declare-fun m!283243 () Bool)

(assert (=> b!182070 m!283243))

(declare-fun m!283245 () Bool)

(assert (=> b!182070 m!283245))

(declare-fun m!283247 () Bool)

(assert (=> b!182070 m!283247))

(declare-fun m!283249 () Bool)

(assert (=> b!182070 m!283249))

(declare-fun m!283251 () Bool)

(assert (=> b!182070 m!283251))

(declare-fun m!283253 () Bool)

(assert (=> b!182070 m!283253))

(declare-fun m!283255 () Bool)

(assert (=> b!182070 m!283255))

(declare-fun m!283257 () Bool)

(assert (=> b!182070 m!283257))

(declare-fun m!283259 () Bool)

(assert (=> b!182070 m!283259))

(declare-fun m!283261 () Bool)

(assert (=> b!182070 m!283261))

(declare-fun m!283263 () Bool)

(assert (=> b!182070 m!283263))

(declare-fun m!283265 () Bool)

(assert (=> b!182080 m!283265))

(declare-fun m!283267 () Bool)

(assert (=> b!182078 m!283267))

(declare-fun m!283269 () Bool)

(assert (=> b!182083 m!283269))

(declare-fun m!283271 () Bool)

(assert (=> b!182077 m!283271))

(assert (=> b!182075 m!283271))

(declare-fun m!283273 () Bool)

(assert (=> b!182073 m!283273))

(declare-fun m!283275 () Bool)

(assert (=> b!182072 m!283275))

(declare-fun m!283277 () Bool)

(assert (=> b!182082 m!283277))

(declare-fun m!283279 () Bool)

(assert (=> b!182069 m!283279))

(declare-fun m!283281 () Bool)

(assert (=> b!182076 m!283281))

(assert (=> b!182076 m!283281))

(declare-fun m!283283 () Bool)

(assert (=> b!182076 m!283283))

(declare-fun m!283285 () Bool)

(assert (=> b!182084 m!283285))

(declare-fun m!283287 () Bool)

(assert (=> b!182084 m!283287))

(declare-fun m!283289 () Bool)

(assert (=> b!182084 m!283289))

(declare-fun m!283291 () Bool)

(assert (=> b!182084 m!283291))

(declare-fun m!283293 () Bool)

(assert (=> start!39962 m!283293))

(assert (=> b!182074 m!283231))

(assert (=> b!182074 m!283233))

(declare-fun m!283295 () Bool)

(assert (=> b!182074 m!283295))

(push 1)

(assert (not b!182076))

(assert (not b!182084))

(assert (not b!182082))

(assert (not b!182077))

(assert (not b!182075))

(assert (not b!182073))

(assert (not b!182078))

(assert (not start!39962))

(assert (not b!182072))

(assert (not b!182071))

(assert (not b!182069))

(assert (not b!182083))

(assert (not b!182074))

(assert (not b!182080))

(assert (not b!182070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

