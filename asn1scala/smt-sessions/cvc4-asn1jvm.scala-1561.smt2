; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43762 () Bool)

(assert start!43762)

(declare-fun b!208359 () Bool)

(declare-fun e!142359 () Bool)

(declare-fun e!142357 () Bool)

(assert (=> b!208359 (= e!142359 (not e!142357))))

(declare-fun res!174880 () Bool)

(assert (=> b!208359 (=> res!174880 e!142357)))

(declare-fun lt!325440 () (_ BitVec 64))

(declare-fun lt!325450 () (_ BitVec 64))

(assert (=> b!208359 (= res!174880 (not (= lt!325440 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325450))))))

(declare-datatypes ((array!10452 0))(
  ( (array!10453 (arr!5526 (Array (_ BitVec 32) (_ BitVec 8))) (size!4596 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8300 0))(
  ( (BitStream!8301 (buf!5104 array!10452) (currentByte!9628 (_ BitVec 32)) (currentBit!9623 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14825 0))(
  ( (Unit!14826) )
))
(declare-datatypes ((tuple2!17886 0))(
  ( (tuple2!17887 (_1!9598 Unit!14825) (_2!9598 BitStream!8300)) )
))
(declare-fun lt!325448 () tuple2!17886)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208359 (= lt!325440 (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))))))

(declare-fun thiss!1204 () BitStream!8300)

(assert (=> b!208359 (= lt!325450 (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)))))

(declare-fun e!142365 () Bool)

(assert (=> b!208359 e!142365))

(declare-fun res!174875 () Bool)

(assert (=> b!208359 (=> (not res!174875) (not e!142365))))

(assert (=> b!208359 (= res!174875 (= (size!4596 (buf!5104 thiss!1204)) (size!4596 (buf!5104 (_2!9598 lt!325448)))))))

(declare-fun lt!325456 () Bool)

(declare-fun appendBit!0 (BitStream!8300 Bool) tuple2!17886)

(assert (=> b!208359 (= lt!325448 (appendBit!0 thiss!1204 lt!325456))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!325455 () (_ BitVec 64))

(assert (=> b!208359 (= lt!325456 (not (= (bvand v!189 lt!325455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!208359 (= lt!325455 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!208360 () Bool)

(declare-fun res!174867 () Bool)

(declare-fun e!142367 () Bool)

(assert (=> b!208360 (=> (not res!174867) (not e!142367))))

(declare-fun isPrefixOf!0 (BitStream!8300 BitStream!8300) Bool)

(assert (=> b!208360 (= res!174867 (isPrefixOf!0 thiss!1204 (_2!9598 lt!325448)))))

(declare-fun b!208361 () Bool)

(declare-fun e!142368 () Bool)

(assert (=> b!208361 (= e!142357 e!142368)))

(declare-fun res!174874 () Bool)

(assert (=> b!208361 (=> res!174874 e!142368)))

(declare-fun lt!325460 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!208361 (= res!174874 (not (= lt!325460 (bvsub (bvsub (bvadd lt!325440 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!325445 () tuple2!17886)

(assert (=> b!208361 (= lt!325460 (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325445))) (currentByte!9628 (_2!9598 lt!325445)) (currentBit!9623 (_2!9598 lt!325445))))))

(assert (=> b!208361 (isPrefixOf!0 thiss!1204 (_2!9598 lt!325445))))

(declare-fun lt!325439 () Unit!14825)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8300 BitStream!8300 BitStream!8300) Unit!14825)

(assert (=> b!208361 (= lt!325439 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9598 lt!325448) (_2!9598 lt!325445)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8300 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17886)

(assert (=> b!208361 (= lt!325445 (appendBitsLSBFirstLoopTR!0 (_2!9598 lt!325448) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!208362 () Bool)

(declare-fun e!142364 () Bool)

(assert (=> b!208362 (= e!142368 e!142364)))

(declare-fun res!174878 () Bool)

(assert (=> b!208362 (=> res!174878 e!142364)))

(declare-datatypes ((tuple2!17888 0))(
  ( (tuple2!17889 (_1!9599 BitStream!8300) (_2!9599 BitStream!8300)) )
))
(declare-fun lt!325441 () tuple2!17888)

(declare-datatypes ((tuple2!17890 0))(
  ( (tuple2!17891 (_1!9600 BitStream!8300) (_2!9600 Bool)) )
))
(declare-fun lt!325459 () tuple2!17890)

(declare-fun lt!325443 () (_ BitVec 64))

(declare-datatypes ((tuple2!17892 0))(
  ( (tuple2!17893 (_1!9601 BitStream!8300) (_2!9601 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17892)

(assert (=> b!208362 (= res!174878 (not (= (_1!9601 (readNBitsLSBFirstsLoopPure!0 (_1!9599 lt!325441) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325443 (ite (_2!9600 lt!325459) lt!325455 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9599 lt!325441))))))

(declare-fun lt!325454 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208362 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448))) lt!325454)))

(declare-fun lt!325458 () Unit!14825)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8300 array!10452 (_ BitVec 64)) Unit!14825)

(assert (=> b!208362 (= lt!325458 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9598 lt!325448) (buf!5104 (_2!9598 lt!325445)) lt!325454))))

(assert (=> b!208362 (= lt!325454 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!325444 () tuple2!17892)

(declare-fun lt!325452 () tuple2!17888)

(assert (=> b!208362 (= lt!325444 (readNBitsLSBFirstsLoopPure!0 (_1!9599 lt!325452) nBits!348 i!590 lt!325443))))

(declare-fun lt!325447 () (_ BitVec 64))

(assert (=> b!208362 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))) ((_ sign_extend 32) (currentByte!9628 thiss!1204)) ((_ sign_extend 32) (currentBit!9623 thiss!1204)) lt!325447)))

(declare-fun lt!325438 () Unit!14825)

(assert (=> b!208362 (= lt!325438 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5104 (_2!9598 lt!325445)) lt!325447))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208362 (= lt!325443 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!208362 (= (_2!9600 lt!325459) lt!325456)))

(declare-fun readBitPure!0 (BitStream!8300) tuple2!17890)

(assert (=> b!208362 (= lt!325459 (readBitPure!0 (_1!9599 lt!325452)))))

(declare-fun reader!0 (BitStream!8300 BitStream!8300) tuple2!17888)

(assert (=> b!208362 (= lt!325441 (reader!0 (_2!9598 lt!325448) (_2!9598 lt!325445)))))

(assert (=> b!208362 (= lt!325452 (reader!0 thiss!1204 (_2!9598 lt!325445)))))

(declare-fun e!142358 () Bool)

(assert (=> b!208362 e!142358))

(declare-fun res!174879 () Bool)

(assert (=> b!208362 (=> (not res!174879) (not e!142358))))

(declare-fun lt!325451 () tuple2!17890)

(declare-fun lt!325442 () tuple2!17890)

(assert (=> b!208362 (= res!174879 (= (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!325451))) (currentByte!9628 (_1!9600 lt!325451)) (currentBit!9623 (_1!9600 lt!325451))) (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!325442))) (currentByte!9628 (_1!9600 lt!325442)) (currentBit!9623 (_1!9600 lt!325442)))))))

(declare-fun lt!325457 () Unit!14825)

(declare-fun lt!325446 () BitStream!8300)

(declare-fun readBitPrefixLemma!0 (BitStream!8300 BitStream!8300) Unit!14825)

(assert (=> b!208362 (= lt!325457 (readBitPrefixLemma!0 lt!325446 (_2!9598 lt!325445)))))

(assert (=> b!208362 (= lt!325442 (readBitPure!0 (BitStream!8301 (buf!5104 (_2!9598 lt!325445)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204))))))

(assert (=> b!208362 (= lt!325451 (readBitPure!0 lt!325446))))

(declare-fun e!142360 () Bool)

(assert (=> b!208362 e!142360))

(declare-fun res!174868 () Bool)

(assert (=> b!208362 (=> (not res!174868) (not e!142360))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208362 (= res!174868 (invariant!0 (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204) (size!4596 (buf!5104 (_2!9598 lt!325448)))))))

(assert (=> b!208362 (= lt!325446 (BitStream!8301 (buf!5104 (_2!9598 lt!325448)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)))))

(declare-fun b!208363 () Bool)

(declare-fun res!174884 () Bool)

(assert (=> b!208363 (=> (not res!174884) (not e!142359))))

(assert (=> b!208363 (= res!174884 (invariant!0 (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204) (size!4596 (buf!5104 thiss!1204))))))

(declare-fun b!208364 () Bool)

(declare-fun res!174883 () Bool)

(assert (=> b!208364 (=> res!174883 e!142364)))

(assert (=> b!208364 (= res!174883 (bvsge i!590 nBits!348))))

(declare-fun b!208365 () Bool)

(declare-fun e!142363 () Bool)

(assert (=> b!208365 (= e!142363 e!142359)))

(declare-fun res!174870 () Bool)

(assert (=> b!208365 (=> (not res!174870) (not e!142359))))

(assert (=> b!208365 (= res!174870 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 thiss!1204))) ((_ sign_extend 32) (currentByte!9628 thiss!1204)) ((_ sign_extend 32) (currentBit!9623 thiss!1204)) lt!325447))))

(assert (=> b!208365 (= lt!325447 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208366 () Bool)

(declare-fun res!174869 () Bool)

(assert (=> b!208366 (=> res!174869 e!142368)))

(assert (=> b!208366 (= res!174869 (or (not (= (size!4596 (buf!5104 (_2!9598 lt!325445))) (size!4596 (buf!5104 thiss!1204)))) (not (= lt!325460 (bvsub (bvadd lt!325450 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!208367 () Bool)

(declare-fun res!174873 () Bool)

(assert (=> b!208367 (=> (not res!174873) (not e!142359))))

(assert (=> b!208367 (= res!174873 (not (= i!590 nBits!348)))))

(declare-fun b!208368 () Bool)

(declare-fun res!174881 () Bool)

(assert (=> b!208368 (=> res!174881 e!142368)))

(assert (=> b!208368 (= res!174881 (not (isPrefixOf!0 (_2!9598 lt!325448) (_2!9598 lt!325445))))))

(declare-fun b!208369 () Bool)

(assert (=> b!208369 (= e!142358 (= (_2!9600 lt!325451) (_2!9600 lt!325442)))))

(declare-fun b!208370 () Bool)

(declare-fun e!142362 () Bool)

(declare-fun array_inv!4337 (array!10452) Bool)

(assert (=> b!208370 (= e!142362 (array_inv!4337 (buf!5104 thiss!1204)))))

(declare-fun b!208371 () Bool)

(declare-fun res!174872 () Bool)

(assert (=> b!208371 (=> res!174872 e!142368)))

(assert (=> b!208371 (= res!174872 (not (invariant!0 (currentBit!9623 (_2!9598 lt!325445)) (currentByte!9628 (_2!9598 lt!325445)) (size!4596 (buf!5104 (_2!9598 lt!325445))))))))

(declare-fun b!208372 () Bool)

(declare-fun e!142361 () Bool)

(assert (=> b!208372 (= e!142367 e!142361)))

(declare-fun res!174876 () Bool)

(assert (=> b!208372 (=> (not res!174876) (not e!142361))))

(declare-fun lt!325437 () tuple2!17890)

(assert (=> b!208372 (= res!174876 (and (= (_2!9600 lt!325437) lt!325456) (= (_1!9600 lt!325437) (_2!9598 lt!325448))))))

(declare-fun readerFrom!0 (BitStream!8300 (_ BitVec 32) (_ BitVec 32)) BitStream!8300)

(assert (=> b!208372 (= lt!325437 (readBitPure!0 (readerFrom!0 (_2!9598 lt!325448) (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204))))))

(declare-fun res!174882 () Bool)

(assert (=> start!43762 (=> (not res!174882) (not e!142363))))

(assert (=> start!43762 (= res!174882 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43762 e!142363))

(assert (=> start!43762 true))

(declare-fun inv!12 (BitStream!8300) Bool)

(assert (=> start!43762 (and (inv!12 thiss!1204) e!142362)))

(declare-fun b!208373 () Bool)

(declare-fun lt!325453 () (_ BitVec 64))

(assert (=> b!208373 (= e!142361 (= (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!325437))) (currentByte!9628 (_1!9600 lt!325437)) (currentBit!9623 (_1!9600 lt!325437))) lt!325453))))

(declare-fun b!208374 () Bool)

(assert (=> b!208374 (= e!142364 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9599 lt!325452)))) ((_ sign_extend 32) (currentByte!9628 (_1!9599 lt!325452))) ((_ sign_extend 32) (currentBit!9623 (_1!9599 lt!325452))) lt!325447))))

(declare-fun b!208375 () Bool)

(assert (=> b!208375 (= e!142360 (invariant!0 (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204) (size!4596 (buf!5104 (_2!9598 lt!325445)))))))

(declare-fun b!208376 () Bool)

(assert (=> b!208376 (= e!142365 e!142367)))

(declare-fun res!174871 () Bool)

(assert (=> b!208376 (=> (not res!174871) (not e!142367))))

(declare-fun lt!325449 () (_ BitVec 64))

(assert (=> b!208376 (= res!174871 (= lt!325453 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325449)))))

(assert (=> b!208376 (= lt!325453 (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))))))

(assert (=> b!208376 (= lt!325449 (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)))))

(declare-fun b!208377 () Bool)

(declare-fun res!174877 () Bool)

(assert (=> b!208377 (=> res!174877 e!142368)))

(assert (=> b!208377 (= res!174877 (not (isPrefixOf!0 thiss!1204 (_2!9598 lt!325448))))))

(assert (= (and start!43762 res!174882) b!208365))

(assert (= (and b!208365 res!174870) b!208363))

(assert (= (and b!208363 res!174884) b!208367))

(assert (= (and b!208367 res!174873) b!208359))

(assert (= (and b!208359 res!174875) b!208376))

(assert (= (and b!208376 res!174871) b!208360))

(assert (= (and b!208360 res!174867) b!208372))

(assert (= (and b!208372 res!174876) b!208373))

(assert (= (and b!208359 (not res!174880)) b!208361))

(assert (= (and b!208361 (not res!174874)) b!208371))

(assert (= (and b!208371 (not res!174872)) b!208366))

(assert (= (and b!208366 (not res!174869)) b!208368))

(assert (= (and b!208368 (not res!174881)) b!208377))

(assert (= (and b!208377 (not res!174877)) b!208362))

(assert (= (and b!208362 res!174868) b!208375))

(assert (= (and b!208362 res!174879) b!208369))

(assert (= (and b!208362 (not res!174878)) b!208364))

(assert (= (and b!208364 (not res!174883)) b!208374))

(assert (= start!43762 b!208370))

(declare-fun m!320525 () Bool)

(assert (=> b!208376 m!320525))

(declare-fun m!320527 () Bool)

(assert (=> b!208376 m!320527))

(declare-fun m!320529 () Bool)

(assert (=> b!208363 m!320529))

(declare-fun m!320531 () Bool)

(assert (=> b!208374 m!320531))

(declare-fun m!320533 () Bool)

(assert (=> b!208360 m!320533))

(declare-fun m!320535 () Bool)

(assert (=> b!208368 m!320535))

(declare-fun m!320537 () Bool)

(assert (=> start!43762 m!320537))

(declare-fun m!320539 () Bool)

(assert (=> b!208371 m!320539))

(declare-fun m!320541 () Bool)

(assert (=> b!208362 m!320541))

(declare-fun m!320543 () Bool)

(assert (=> b!208362 m!320543))

(declare-fun m!320545 () Bool)

(assert (=> b!208362 m!320545))

(declare-fun m!320547 () Bool)

(assert (=> b!208362 m!320547))

(declare-fun m!320549 () Bool)

(assert (=> b!208362 m!320549))

(declare-fun m!320551 () Bool)

(assert (=> b!208362 m!320551))

(declare-fun m!320553 () Bool)

(assert (=> b!208362 m!320553))

(declare-fun m!320555 () Bool)

(assert (=> b!208362 m!320555))

(declare-fun m!320557 () Bool)

(assert (=> b!208362 m!320557))

(declare-fun m!320559 () Bool)

(assert (=> b!208362 m!320559))

(declare-fun m!320561 () Bool)

(assert (=> b!208362 m!320561))

(declare-fun m!320563 () Bool)

(assert (=> b!208362 m!320563))

(declare-fun m!320565 () Bool)

(assert (=> b!208362 m!320565))

(declare-fun m!320567 () Bool)

(assert (=> b!208362 m!320567))

(declare-fun m!320569 () Bool)

(assert (=> b!208362 m!320569))

(declare-fun m!320571 () Bool)

(assert (=> b!208362 m!320571))

(declare-fun m!320573 () Bool)

(assert (=> b!208372 m!320573))

(assert (=> b!208372 m!320573))

(declare-fun m!320575 () Bool)

(assert (=> b!208372 m!320575))

(declare-fun m!320577 () Bool)

(assert (=> b!208361 m!320577))

(declare-fun m!320579 () Bool)

(assert (=> b!208361 m!320579))

(declare-fun m!320581 () Bool)

(assert (=> b!208361 m!320581))

(declare-fun m!320583 () Bool)

(assert (=> b!208361 m!320583))

(declare-fun m!320585 () Bool)

(assert (=> b!208375 m!320585))

(declare-fun m!320587 () Bool)

(assert (=> b!208370 m!320587))

(declare-fun m!320589 () Bool)

(assert (=> b!208373 m!320589))

(assert (=> b!208359 m!320525))

(assert (=> b!208359 m!320527))

(declare-fun m!320591 () Bool)

(assert (=> b!208359 m!320591))

(declare-fun m!320593 () Bool)

(assert (=> b!208365 m!320593))

(assert (=> b!208377 m!320533))

(push 1)

(assert (not b!208359))

(assert (not b!208368))

(assert (not b!208362))

(assert (not b!208375))

(assert (not b!208365))

(assert (not b!208361))

(assert (not b!208372))

(assert (not b!208374))

(assert (not b!208377))

(assert (not b!208376))

(assert (not b!208371))

(assert (not start!43762))

(assert (not b!208373))

(assert (not b!208370))

(assert (not b!208360))

(assert (not b!208363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70415 () Bool)

(declare-fun res!174930 () Bool)

(declare-fun e!142399 () Bool)

(assert (=> d!70415 (=> (not res!174930) (not e!142399))))

(assert (=> d!70415 (= res!174930 (= (size!4596 (buf!5104 thiss!1204)) (size!4596 (buf!5104 (_2!9598 lt!325448)))))))

(assert (=> d!70415 (= (isPrefixOf!0 thiss!1204 (_2!9598 lt!325448)) e!142399)))

(declare-fun b!208431 () Bool)

(declare-fun res!174931 () Bool)

(assert (=> b!208431 (=> (not res!174931) (not e!142399))))

(assert (=> b!208431 (= res!174931 (bvsle (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)) (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448)))))))

(declare-fun b!208432 () Bool)

(declare-fun e!142398 () Bool)

(assert (=> b!208432 (= e!142399 e!142398)))

(declare-fun res!174932 () Bool)

(assert (=> b!208432 (=> res!174932 e!142398)))

(assert (=> b!208432 (= res!174932 (= (size!4596 (buf!5104 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!208433 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10452 array!10452 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208433 (= e!142398 (arrayBitRangesEq!0 (buf!5104 thiss!1204) (buf!5104 (_2!9598 lt!325448)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204))))))

(assert (= (and d!70415 res!174930) b!208431))

(assert (= (and b!208431 res!174931) b!208432))

(assert (= (and b!208432 (not res!174932)) b!208433))

(assert (=> b!208431 m!320527))

(assert (=> b!208431 m!320525))

(assert (=> b!208433 m!320527))

(assert (=> b!208433 m!320527))

(declare-fun m!320699 () Bool)

(assert (=> b!208433 m!320699))

(assert (=> b!208360 d!70415))

(declare-fun d!70417 () Bool)

(declare-fun e!142402 () Bool)

(assert (=> d!70417 e!142402))

(declare-fun res!174937 () Bool)

(assert (=> d!70417 (=> (not res!174937) (not e!142402))))

(declare-fun lt!325617 () (_ BitVec 64))

(declare-fun lt!325618 () (_ BitVec 64))

(declare-fun lt!325621 () (_ BitVec 64))

(assert (=> d!70417 (= res!174937 (= lt!325617 (bvsub lt!325621 lt!325618)))))

(assert (=> d!70417 (or (= (bvand lt!325621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325621 lt!325618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70417 (= lt!325618 (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325448)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448)))))))

(declare-fun lt!325620 () (_ BitVec 64))

(declare-fun lt!325622 () (_ BitVec 64))

(assert (=> d!70417 (= lt!325621 (bvmul lt!325620 lt!325622))))

(assert (=> d!70417 (or (= lt!325620 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325622 (bvsdiv (bvmul lt!325620 lt!325622) lt!325620)))))

(assert (=> d!70417 (= lt!325622 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70417 (= lt!325620 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325448)))))))

(assert (=> d!70417 (= lt!325617 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448)))))))

(assert (=> d!70417 (invariant!0 (currentBit!9623 (_2!9598 lt!325448)) (currentByte!9628 (_2!9598 lt!325448)) (size!4596 (buf!5104 (_2!9598 lt!325448))))))

(assert (=> d!70417 (= (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))) lt!325617)))

(declare-fun b!208438 () Bool)

(declare-fun res!174938 () Bool)

(assert (=> b!208438 (=> (not res!174938) (not e!142402))))

(assert (=> b!208438 (= res!174938 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325617))))

(declare-fun b!208439 () Bool)

(declare-fun lt!325619 () (_ BitVec 64))

(assert (=> b!208439 (= e!142402 (bvsle lt!325617 (bvmul lt!325619 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208439 (or (= lt!325619 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325619 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325619)))))

(assert (=> b!208439 (= lt!325619 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325448)))))))

(assert (= (and d!70417 res!174937) b!208438))

(assert (= (and b!208438 res!174938) b!208439))

(declare-fun m!320701 () Bool)

(assert (=> d!70417 m!320701))

(declare-fun m!320703 () Bool)

(assert (=> d!70417 m!320703))

(assert (=> b!208359 d!70417))

(declare-fun d!70419 () Bool)

(declare-fun e!142403 () Bool)

(assert (=> d!70419 e!142403))

(declare-fun res!174939 () Bool)

(assert (=> d!70419 (=> (not res!174939) (not e!142403))))

(declare-fun lt!325624 () (_ BitVec 64))

(declare-fun lt!325627 () (_ BitVec 64))

(declare-fun lt!325623 () (_ BitVec 64))

(assert (=> d!70419 (= res!174939 (= lt!325623 (bvsub lt!325627 lt!325624)))))

(assert (=> d!70419 (or (= (bvand lt!325627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325624 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325627 lt!325624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70419 (= lt!325624 (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 thiss!1204))) ((_ sign_extend 32) (currentByte!9628 thiss!1204)) ((_ sign_extend 32) (currentBit!9623 thiss!1204))))))

(declare-fun lt!325626 () (_ BitVec 64))

(declare-fun lt!325628 () (_ BitVec 64))

(assert (=> d!70419 (= lt!325627 (bvmul lt!325626 lt!325628))))

(assert (=> d!70419 (or (= lt!325626 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325628 (bvsdiv (bvmul lt!325626 lt!325628) lt!325626)))))

(assert (=> d!70419 (= lt!325628 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70419 (= lt!325626 ((_ sign_extend 32) (size!4596 (buf!5104 thiss!1204))))))

(assert (=> d!70419 (= lt!325623 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9628 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9623 thiss!1204))))))

(assert (=> d!70419 (invariant!0 (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204) (size!4596 (buf!5104 thiss!1204)))))

(assert (=> d!70419 (= (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)) lt!325623)))

(declare-fun b!208440 () Bool)

(declare-fun res!174940 () Bool)

(assert (=> b!208440 (=> (not res!174940) (not e!142403))))

(assert (=> b!208440 (= res!174940 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325623))))

(declare-fun b!208441 () Bool)

(declare-fun lt!325625 () (_ BitVec 64))

(assert (=> b!208441 (= e!142403 (bvsle lt!325623 (bvmul lt!325625 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208441 (or (= lt!325625 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325625 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325625)))))

(assert (=> b!208441 (= lt!325625 ((_ sign_extend 32) (size!4596 (buf!5104 thiss!1204))))))

(assert (= (and d!70419 res!174939) b!208440))

(assert (= (and b!208440 res!174940) b!208441))

(declare-fun m!320705 () Bool)

(assert (=> d!70419 m!320705))

(assert (=> d!70419 m!320529))

(assert (=> b!208359 d!70419))

(declare-fun b!208454 () Bool)

(declare-fun e!142408 () Bool)

(declare-fun lt!325640 () tuple2!17890)

(declare-fun lt!325637 () tuple2!17886)

(assert (=> b!208454 (= e!142408 (= (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!325640))) (currentByte!9628 (_1!9600 lt!325640)) (currentBit!9623 (_1!9600 lt!325640))) (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325637))) (currentByte!9628 (_2!9598 lt!325637)) (currentBit!9623 (_2!9598 lt!325637)))))))

(declare-fun b!208453 () Bool)

(declare-fun e!142409 () Bool)

(assert (=> b!208453 (= e!142409 e!142408)))

(declare-fun res!174951 () Bool)

(assert (=> b!208453 (=> (not res!174951) (not e!142408))))

(assert (=> b!208453 (= res!174951 (and (= (_2!9600 lt!325640) lt!325456) (= (_1!9600 lt!325640) (_2!9598 lt!325637))))))

(assert (=> b!208453 (= lt!325640 (readBitPure!0 (readerFrom!0 (_2!9598 lt!325637) (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204))))))

(declare-fun b!208451 () Bool)

(declare-fun res!174952 () Bool)

(assert (=> b!208451 (=> (not res!174952) (not e!142409))))

(declare-fun lt!325639 () (_ BitVec 64))

(declare-fun lt!325638 () (_ BitVec 64))

(assert (=> b!208451 (= res!174952 (= (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325637))) (currentByte!9628 (_2!9598 lt!325637)) (currentBit!9623 (_2!9598 lt!325637))) (bvadd lt!325639 lt!325638)))))

(assert (=> b!208451 (or (not (= (bvand lt!325639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325638 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!325639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!325639 lt!325638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208451 (= lt!325638 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!208451 (= lt!325639 (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)))))

(declare-fun b!208452 () Bool)

(declare-fun res!174950 () Bool)

(assert (=> b!208452 (=> (not res!174950) (not e!142409))))

(assert (=> b!208452 (= res!174950 (isPrefixOf!0 thiss!1204 (_2!9598 lt!325637)))))

(declare-fun d!70421 () Bool)

(assert (=> d!70421 e!142409))

(declare-fun res!174949 () Bool)

(assert (=> d!70421 (=> (not res!174949) (not e!142409))))

(assert (=> d!70421 (= res!174949 (= (size!4596 (buf!5104 thiss!1204)) (size!4596 (buf!5104 (_2!9598 lt!325637)))))))

(declare-fun choose!16 (BitStream!8300 Bool) tuple2!17886)

(assert (=> d!70421 (= lt!325637 (choose!16 thiss!1204 lt!325456))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70421 (validate_offset_bit!0 ((_ sign_extend 32) (size!4596 (buf!5104 thiss!1204))) ((_ sign_extend 32) (currentByte!9628 thiss!1204)) ((_ sign_extend 32) (currentBit!9623 thiss!1204)))))

(assert (=> d!70421 (= (appendBit!0 thiss!1204 lt!325456) lt!325637)))

(assert (= (and d!70421 res!174949) b!208451))

(assert (= (and b!208451 res!174952) b!208452))

(assert (= (and b!208452 res!174950) b!208453))

(assert (= (and b!208453 res!174951) b!208454))

(declare-fun m!320707 () Bool)

(assert (=> b!208451 m!320707))

(assert (=> b!208451 m!320527))

(declare-fun m!320709 () Bool)

(assert (=> b!208453 m!320709))

(assert (=> b!208453 m!320709))

(declare-fun m!320711 () Bool)

(assert (=> b!208453 m!320711))

(declare-fun m!320713 () Bool)

(assert (=> d!70421 m!320713))

(declare-fun m!320715 () Bool)

(assert (=> d!70421 m!320715))

(declare-fun m!320717 () Bool)

(assert (=> b!208454 m!320717))

(assert (=> b!208454 m!320707))

(declare-fun m!320719 () Bool)

(assert (=> b!208452 m!320719))

(assert (=> b!208359 d!70421))

(declare-fun d!70423 () Bool)

(assert (=> d!70423 (= (array_inv!4337 (buf!5104 thiss!1204)) (bvsge (size!4596 (buf!5104 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!208370 d!70423))

(declare-fun d!70425 () Bool)

(declare-fun e!142410 () Bool)

(assert (=> d!70425 e!142410))

(declare-fun res!174953 () Bool)

(assert (=> d!70425 (=> (not res!174953) (not e!142410))))

(declare-fun lt!325641 () (_ BitVec 64))

(declare-fun lt!325645 () (_ BitVec 64))

(declare-fun lt!325642 () (_ BitVec 64))

(assert (=> d!70425 (= res!174953 (= lt!325641 (bvsub lt!325645 lt!325642)))))

(assert (=> d!70425 (or (= (bvand lt!325645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325642 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325645 lt!325642) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70425 (= lt!325642 (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325445))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325445)))))))

(declare-fun lt!325644 () (_ BitVec 64))

(declare-fun lt!325646 () (_ BitVec 64))

(assert (=> d!70425 (= lt!325645 (bvmul lt!325644 lt!325646))))

(assert (=> d!70425 (or (= lt!325644 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325646 (bvsdiv (bvmul lt!325644 lt!325646) lt!325644)))))

(assert (=> d!70425 (= lt!325646 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70425 (= lt!325644 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))))))

(assert (=> d!70425 (= lt!325641 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325445))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325445)))))))

(assert (=> d!70425 (invariant!0 (currentBit!9623 (_2!9598 lt!325445)) (currentByte!9628 (_2!9598 lt!325445)) (size!4596 (buf!5104 (_2!9598 lt!325445))))))

(assert (=> d!70425 (= (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325445))) (currentByte!9628 (_2!9598 lt!325445)) (currentBit!9623 (_2!9598 lt!325445))) lt!325641)))

(declare-fun b!208455 () Bool)

(declare-fun res!174954 () Bool)

(assert (=> b!208455 (=> (not res!174954) (not e!142410))))

(assert (=> b!208455 (= res!174954 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325641))))

(declare-fun b!208456 () Bool)

(declare-fun lt!325643 () (_ BitVec 64))

(assert (=> b!208456 (= e!142410 (bvsle lt!325641 (bvmul lt!325643 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208456 (or (= lt!325643 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325643 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325643)))))

(assert (=> b!208456 (= lt!325643 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))))))

(assert (= (and d!70425 res!174953) b!208455))

(assert (= (and b!208455 res!174954) b!208456))

(declare-fun m!320721 () Bool)

(assert (=> d!70425 m!320721))

(assert (=> d!70425 m!320539))

(assert (=> b!208361 d!70425))

(declare-fun d!70427 () Bool)

(declare-fun res!174955 () Bool)

(declare-fun e!142412 () Bool)

(assert (=> d!70427 (=> (not res!174955) (not e!142412))))

(assert (=> d!70427 (= res!174955 (= (size!4596 (buf!5104 thiss!1204)) (size!4596 (buf!5104 (_2!9598 lt!325445)))))))

(assert (=> d!70427 (= (isPrefixOf!0 thiss!1204 (_2!9598 lt!325445)) e!142412)))

(declare-fun b!208457 () Bool)

(declare-fun res!174956 () Bool)

(assert (=> b!208457 (=> (not res!174956) (not e!142412))))

(assert (=> b!208457 (= res!174956 (bvsle (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)) (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325445))) (currentByte!9628 (_2!9598 lt!325445)) (currentBit!9623 (_2!9598 lt!325445)))))))

(declare-fun b!208458 () Bool)

(declare-fun e!142411 () Bool)

(assert (=> b!208458 (= e!142412 e!142411)))

(declare-fun res!174957 () Bool)

(assert (=> b!208458 (=> res!174957 e!142411)))

(assert (=> b!208458 (= res!174957 (= (size!4596 (buf!5104 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!208459 () Bool)

(assert (=> b!208459 (= e!142411 (arrayBitRangesEq!0 (buf!5104 thiss!1204) (buf!5104 (_2!9598 lt!325445)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204))))))

(assert (= (and d!70427 res!174955) b!208457))

(assert (= (and b!208457 res!174956) b!208458))

(assert (= (and b!208458 (not res!174957)) b!208459))

(assert (=> b!208457 m!320527))

(assert (=> b!208457 m!320577))

(assert (=> b!208459 m!320527))

(assert (=> b!208459 m!320527))

(declare-fun m!320723 () Bool)

(assert (=> b!208459 m!320723))

(assert (=> b!208361 d!70427))

(declare-fun d!70429 () Bool)

(assert (=> d!70429 (isPrefixOf!0 thiss!1204 (_2!9598 lt!325445))))

(declare-fun lt!325649 () Unit!14825)

(declare-fun choose!30 (BitStream!8300 BitStream!8300 BitStream!8300) Unit!14825)

(assert (=> d!70429 (= lt!325649 (choose!30 thiss!1204 (_2!9598 lt!325448) (_2!9598 lt!325445)))))

(assert (=> d!70429 (isPrefixOf!0 thiss!1204 (_2!9598 lt!325448))))

(assert (=> d!70429 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9598 lt!325448) (_2!9598 lt!325445)) lt!325649)))

(declare-fun bs!17314 () Bool)

(assert (= bs!17314 d!70429))

(assert (=> bs!17314 m!320579))

(declare-fun m!320725 () Bool)

(assert (=> bs!17314 m!320725))

(assert (=> bs!17314 m!320533))

(assert (=> b!208361 d!70429))

(declare-fun b!208629 () Bool)

(declare-fun e!142510 () Bool)

(declare-fun lt!326156 () tuple2!17892)

(declare-fun lt!326145 () tuple2!17888)

(assert (=> b!208629 (= e!142510 (= (_1!9601 lt!326156) (_2!9599 lt!326145)))))

(declare-fun d!70431 () Bool)

(declare-fun e!142513 () Bool)

(assert (=> d!70431 e!142513))

(declare-fun res!175106 () Bool)

(assert (=> d!70431 (=> (not res!175106) (not e!142513))))

(declare-fun lt!326190 () tuple2!17886)

(assert (=> d!70431 (= res!175106 (invariant!0 (currentBit!9623 (_2!9598 lt!326190)) (currentByte!9628 (_2!9598 lt!326190)) (size!4596 (buf!5104 (_2!9598 lt!326190)))))))

(declare-fun e!142512 () tuple2!17886)

(assert (=> d!70431 (= lt!326190 e!142512)))

(declare-fun c!10260 () Bool)

(assert (=> d!70431 (= c!10260 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70431 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70431 (= (appendBitsLSBFirstLoopTR!0 (_2!9598 lt!325448) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!326190)))

(declare-fun b!208630 () Bool)

(declare-fun Unit!14850 () Unit!14825)

(assert (=> b!208630 (= e!142512 (tuple2!17887 Unit!14850 (_2!9598 lt!325448)))))

(declare-fun lt!326186 () Unit!14825)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8300) Unit!14825)

(assert (=> b!208630 (= lt!326186 (lemmaIsPrefixRefl!0 (_2!9598 lt!325448)))))

(declare-fun call!3288 () Bool)

(assert (=> b!208630 call!3288))

(declare-fun lt!326170 () Unit!14825)

(assert (=> b!208630 (= lt!326170 lt!326186)))

(declare-fun b!208631 () Bool)

(declare-fun e!142516 () Bool)

(declare-fun lt!326184 () tuple2!17890)

(declare-fun lt!326189 () tuple2!17890)

(assert (=> b!208631 (= e!142516 (= (_2!9600 lt!326184) (_2!9600 lt!326189)))))

(declare-fun b!208632 () Bool)

(declare-fun res!175101 () Bool)

(assert (=> b!208632 (= res!175101 call!3288)))

(declare-fun e!142517 () Bool)

(assert (=> b!208632 (=> (not res!175101) (not e!142517))))

(declare-fun b!208633 () Bool)

(declare-fun e!142511 () Bool)

(declare-fun lt!326185 () tuple2!17890)

(declare-fun lt!326192 () tuple2!17886)

(assert (=> b!208633 (= e!142511 (= (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!326185))) (currentByte!9628 (_1!9600 lt!326185)) (currentBit!9623 (_1!9600 lt!326185))) (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!326192))) (currentByte!9628 (_2!9598 lt!326192)) (currentBit!9623 (_2!9598 lt!326192)))))))

(declare-fun bm!3285 () Bool)

(assert (=> bm!3285 (= call!3288 (isPrefixOf!0 (_2!9598 lt!325448) (ite c!10260 (_2!9598 lt!325448) (_2!9598 lt!326192))))))

(declare-fun b!208634 () Bool)

(declare-fun res!175096 () Bool)

(assert (=> b!208634 (=> (not res!175096) (not e!142513))))

(assert (=> b!208634 (= res!175096 (isPrefixOf!0 (_2!9598 lt!325448) (_2!9598 lt!326190)))))

(declare-fun b!208635 () Bool)

(declare-fun res!175098 () Bool)

(assert (=> b!208635 (= res!175098 (= (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!326192))) (currentByte!9628 (_2!9598 lt!326192)) (currentBit!9623 (_2!9598 lt!326192))) (bvadd (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!208635 (=> (not res!175098) (not e!142517))))

(declare-fun b!208636 () Bool)

(assert (=> b!208636 (= lt!326185 (readBitPure!0 (readerFrom!0 (_2!9598 lt!326192) (currentBit!9623 (_2!9598 lt!325448)) (currentByte!9628 (_2!9598 lt!325448)))))))

(declare-fun lt!326159 () Bool)

(declare-fun res!175104 () Bool)

(assert (=> b!208636 (= res!175104 (and (= (_2!9600 lt!326185) lt!326159) (= (_1!9600 lt!326185) (_2!9598 lt!326192))))))

(assert (=> b!208636 (=> (not res!175104) (not e!142511))))

(assert (=> b!208636 (= e!142517 e!142511)))

(declare-fun b!208637 () Bool)

(declare-fun lt!326166 () tuple2!17886)

(assert (=> b!208637 (= e!142512 (tuple2!17887 (_1!9598 lt!326166) (_2!9598 lt!326166)))))

(assert (=> b!208637 (= lt!326159 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208637 (= lt!326192 (appendBit!0 (_2!9598 lt!325448) lt!326159))))

(declare-fun res!175099 () Bool)

(assert (=> b!208637 (= res!175099 (= (size!4596 (buf!5104 (_2!9598 lt!325448))) (size!4596 (buf!5104 (_2!9598 lt!326192)))))))

(assert (=> b!208637 (=> (not res!175099) (not e!142517))))

(assert (=> b!208637 e!142517))

(declare-fun lt!326180 () tuple2!17886)

(assert (=> b!208637 (= lt!326180 lt!326192)))

(assert (=> b!208637 (= lt!326166 (appendBitsLSBFirstLoopTR!0 (_2!9598 lt!326180) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!326196 () Unit!14825)

(assert (=> b!208637 (= lt!326196 (lemmaIsPrefixTransitive!0 (_2!9598 lt!325448) (_2!9598 lt!326180) (_2!9598 lt!326166)))))

(assert (=> b!208637 (isPrefixOf!0 (_2!9598 lt!325448) (_2!9598 lt!326166))))

(declare-fun lt!326157 () Unit!14825)

(assert (=> b!208637 (= lt!326157 lt!326196)))

(assert (=> b!208637 (invariant!0 (currentBit!9623 (_2!9598 lt!325448)) (currentByte!9628 (_2!9598 lt!325448)) (size!4596 (buf!5104 (_2!9598 lt!326180))))))

(declare-fun lt!326151 () BitStream!8300)

(assert (=> b!208637 (= lt!326151 (BitStream!8301 (buf!5104 (_2!9598 lt!326180)) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))))))

(assert (=> b!208637 (invariant!0 (currentBit!9623 lt!326151) (currentByte!9628 lt!326151) (size!4596 (buf!5104 (_2!9598 lt!326166))))))

(declare-fun lt!326160 () BitStream!8300)

(assert (=> b!208637 (= lt!326160 (BitStream!8301 (buf!5104 (_2!9598 lt!326166)) (currentByte!9628 lt!326151) (currentBit!9623 lt!326151)))))

(assert (=> b!208637 (= lt!326184 (readBitPure!0 lt!326151))))

(assert (=> b!208637 (= lt!326189 (readBitPure!0 lt!326160))))

(declare-fun lt!326169 () Unit!14825)

(assert (=> b!208637 (= lt!326169 (readBitPrefixLemma!0 lt!326151 (_2!9598 lt!326166)))))

(declare-fun res!175105 () Bool)

(assert (=> b!208637 (= res!175105 (= (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!326184))) (currentByte!9628 (_1!9600 lt!326184)) (currentBit!9623 (_1!9600 lt!326184))) (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!326189))) (currentByte!9628 (_1!9600 lt!326189)) (currentBit!9623 (_1!9600 lt!326189)))))))

(assert (=> b!208637 (=> (not res!175105) (not e!142516))))

(assert (=> b!208637 e!142516))

(declare-fun lt!326164 () Unit!14825)

(assert (=> b!208637 (= lt!326164 lt!326169)))

(declare-fun lt!326150 () tuple2!17888)

(assert (=> b!208637 (= lt!326150 (reader!0 (_2!9598 lt!325448) (_2!9598 lt!326166)))))

(declare-fun lt!326144 () tuple2!17888)

(assert (=> b!208637 (= lt!326144 (reader!0 (_2!9598 lt!326180) (_2!9598 lt!326166)))))

(declare-fun lt!326168 () tuple2!17890)

(assert (=> b!208637 (= lt!326168 (readBitPure!0 (_1!9599 lt!326150)))))

(assert (=> b!208637 (= (_2!9600 lt!326168) lt!326159)))

(declare-fun lt!326183 () Unit!14825)

(declare-fun Unit!14852 () Unit!14825)

(assert (=> b!208637 (= lt!326183 Unit!14852)))

(declare-fun lt!326194 () (_ BitVec 64))

(assert (=> b!208637 (= lt!326194 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!326193 () (_ BitVec 64))

(assert (=> b!208637 (= lt!326193 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!326173 () Unit!14825)

(assert (=> b!208637 (= lt!326173 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9598 lt!325448) (buf!5104 (_2!9598 lt!326166)) lt!326193))))

(assert (=> b!208637 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!326166)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448))) lt!326193)))

(declare-fun lt!326146 () Unit!14825)

(assert (=> b!208637 (= lt!326146 lt!326173)))

(declare-fun lt!326165 () tuple2!17892)

(assert (=> b!208637 (= lt!326165 (readNBitsLSBFirstsLoopPure!0 (_1!9599 lt!326150) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!326194))))

(declare-fun lt!326182 () (_ BitVec 64))

(assert (=> b!208637 (= lt!326182 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!326179 () Unit!14825)

(assert (=> b!208637 (= lt!326179 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9598 lt!326180) (buf!5104 (_2!9598 lt!326166)) lt!326182))))

(assert (=> b!208637 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!326166)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!326180))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!326180))) lt!326182)))

(declare-fun lt!326188 () Unit!14825)

(assert (=> b!208637 (= lt!326188 lt!326179)))

(declare-fun lt!326187 () tuple2!17892)

(assert (=> b!208637 (= lt!326187 (readNBitsLSBFirstsLoopPure!0 (_1!9599 lt!326144) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!326194 (ite (_2!9600 lt!326168) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!326172 () tuple2!17892)

(assert (=> b!208637 (= lt!326172 (readNBitsLSBFirstsLoopPure!0 (_1!9599 lt!326150) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!326194))))

(declare-fun c!10259 () Bool)

(assert (=> b!208637 (= c!10259 (_2!9600 (readBitPure!0 (_1!9599 lt!326150))))))

(declare-fun lt!326152 () tuple2!17892)

(declare-fun e!142515 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8300 (_ BitVec 64)) BitStream!8300)

(assert (=> b!208637 (= lt!326152 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9599 lt!326150) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!326194 e!142515)))))

(declare-fun lt!326198 () Unit!14825)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14825)

(assert (=> b!208637 (= lt!326198 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9599 lt!326150) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!326194))))

(assert (=> b!208637 (and (= (_2!9601 lt!326172) (_2!9601 lt!326152)) (= (_1!9601 lt!326172) (_1!9601 lt!326152)))))

(declare-fun lt!326199 () Unit!14825)

(assert (=> b!208637 (= lt!326199 lt!326198)))

(assert (=> b!208637 (= (_1!9599 lt!326150) (withMovedBitIndex!0 (_2!9599 lt!326150) (bvsub (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))) (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!326166))) (currentByte!9628 (_2!9598 lt!326166)) (currentBit!9623 (_2!9598 lt!326166))))))))

(declare-fun lt!326163 () Unit!14825)

(declare-fun Unit!14853 () Unit!14825)

(assert (=> b!208637 (= lt!326163 Unit!14853)))

(assert (=> b!208637 (= (_1!9599 lt!326144) (withMovedBitIndex!0 (_2!9599 lt!326144) (bvsub (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!326180))) (currentByte!9628 (_2!9598 lt!326180)) (currentBit!9623 (_2!9598 lt!326180))) (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!326166))) (currentByte!9628 (_2!9598 lt!326166)) (currentBit!9623 (_2!9598 lt!326166))))))))

(declare-fun lt!326158 () Unit!14825)

(declare-fun Unit!14854 () Unit!14825)

(assert (=> b!208637 (= lt!326158 Unit!14854)))

(assert (=> b!208637 (= (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))) (bvsub (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!326180))) (currentByte!9628 (_2!9598 lt!326180)) (currentBit!9623 (_2!9598 lt!326180))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!326197 () Unit!14825)

(declare-fun Unit!14855 () Unit!14825)

(assert (=> b!208637 (= lt!326197 Unit!14855)))

(assert (=> b!208637 (= (_2!9601 lt!326165) (_2!9601 lt!326187))))

(declare-fun lt!326195 () Unit!14825)

(declare-fun Unit!14856 () Unit!14825)

(assert (=> b!208637 (= lt!326195 Unit!14856)))

(assert (=> b!208637 (invariant!0 (currentBit!9623 (_2!9598 lt!326166)) (currentByte!9628 (_2!9598 lt!326166)) (size!4596 (buf!5104 (_2!9598 lt!326166))))))

(declare-fun lt!326171 () Unit!14825)

(declare-fun Unit!14857 () Unit!14825)

(assert (=> b!208637 (= lt!326171 Unit!14857)))

(assert (=> b!208637 (= (size!4596 (buf!5104 (_2!9598 lt!325448))) (size!4596 (buf!5104 (_2!9598 lt!326166))))))

(declare-fun lt!326177 () Unit!14825)

(declare-fun Unit!14858 () Unit!14825)

(assert (=> b!208637 (= lt!326177 Unit!14858)))

(assert (=> b!208637 (= (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!326166))) (currentByte!9628 (_2!9598 lt!326166)) (currentBit!9623 (_2!9598 lt!326166))) (bvsub (bvadd (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!326149 () Unit!14825)

(declare-fun Unit!14859 () Unit!14825)

(assert (=> b!208637 (= lt!326149 Unit!14859)))

(declare-fun lt!326167 () Unit!14825)

(declare-fun Unit!14860 () Unit!14825)

(assert (=> b!208637 (= lt!326167 Unit!14860)))

(assert (=> b!208637 (= lt!326145 (reader!0 (_2!9598 lt!325448) (_2!9598 lt!326166)))))

(declare-fun lt!326147 () (_ BitVec 64))

(assert (=> b!208637 (= lt!326147 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!326181 () Unit!14825)

(assert (=> b!208637 (= lt!326181 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9598 lt!325448) (buf!5104 (_2!9598 lt!326166)) lt!326147))))

(assert (=> b!208637 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!326166)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448))) lt!326147)))

(declare-fun lt!326175 () Unit!14825)

(assert (=> b!208637 (= lt!326175 lt!326181)))

(assert (=> b!208637 (= lt!326156 (readNBitsLSBFirstsLoopPure!0 (_1!9599 lt!326145) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!175095 () Bool)

(assert (=> b!208637 (= res!175095 (= (_2!9601 lt!326156) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!208637 (=> (not res!175095) (not e!142510))))

(assert (=> b!208637 e!142510))

(declare-fun lt!326153 () Unit!14825)

(declare-fun Unit!14861 () Unit!14825)

(assert (=> b!208637 (= lt!326153 Unit!14861)))

(declare-fun b!208638 () Bool)

(declare-fun e!142514 () Bool)

(declare-fun lt!326161 () (_ BitVec 64))

(assert (=> b!208638 (= e!142514 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325448)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448))) lt!326161))))

(declare-fun b!208639 () Bool)

(declare-fun res!175103 () Bool)

(assert (=> b!208639 (=> (not res!175103) (not e!142513))))

(assert (=> b!208639 (= res!175103 (= (size!4596 (buf!5104 (_2!9598 lt!325448))) (size!4596 (buf!5104 (_2!9598 lt!326190)))))))

(declare-fun b!208640 () Bool)

(declare-fun e!142509 () Bool)

(declare-fun lt!326174 () tuple2!17892)

(declare-fun lt!326176 () tuple2!17888)

(assert (=> b!208640 (= e!142509 (= (_1!9601 lt!326174) (_2!9599 lt!326176)))))

(declare-fun b!208641 () Bool)

(assert (=> b!208641 (= e!142513 e!142509)))

(declare-fun res!175100 () Bool)

(assert (=> b!208641 (=> (not res!175100) (not e!142509))))

(assert (=> b!208641 (= res!175100 (= (_2!9601 lt!326174) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!208641 (= lt!326174 (readNBitsLSBFirstsLoopPure!0 (_1!9599 lt!326176) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!326154 () Unit!14825)

(declare-fun lt!326148 () Unit!14825)

(assert (=> b!208641 (= lt!326154 lt!326148)))

(assert (=> b!208641 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!326190)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448))) lt!326161)))

(assert (=> b!208641 (= lt!326148 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9598 lt!325448) (buf!5104 (_2!9598 lt!326190)) lt!326161))))

(assert (=> b!208641 e!142514))

(declare-fun res!175102 () Bool)

(assert (=> b!208641 (=> (not res!175102) (not e!142514))))

(assert (=> b!208641 (= res!175102 (and (= (size!4596 (buf!5104 (_2!9598 lt!325448))) (size!4596 (buf!5104 (_2!9598 lt!326190)))) (bvsge lt!326161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208641 (= lt!326161 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!208641 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!208641 (= lt!326176 (reader!0 (_2!9598 lt!325448) (_2!9598 lt!326190)))))

(declare-fun b!208642 () Bool)

(declare-fun res!175097 () Bool)

(assert (=> b!208642 (=> (not res!175097) (not e!142513))))

(declare-fun lt!326191 () (_ BitVec 64))

(declare-fun lt!326162 () (_ BitVec 64))

(assert (=> b!208642 (= res!175097 (= (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!326190))) (currentByte!9628 (_2!9598 lt!326190)) (currentBit!9623 (_2!9598 lt!326190))) (bvsub lt!326162 lt!326191)))))

(assert (=> b!208642 (or (= (bvand lt!326162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326191 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326162 lt!326191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208642 (= lt!326191 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!326178 () (_ BitVec 64))

(declare-fun lt!326155 () (_ BitVec 64))

(assert (=> b!208642 (= lt!326162 (bvadd lt!326178 lt!326155))))

(assert (=> b!208642 (or (not (= (bvand lt!326178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326155 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!326178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!326178 lt!326155) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208642 (= lt!326155 ((_ sign_extend 32) nBits!348))))

(assert (=> b!208642 (= lt!326178 (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))))))

(declare-fun b!208643 () Bool)

(assert (=> b!208643 (= e!142515 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!208644 () Bool)

(assert (=> b!208644 (= e!142515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!70431 c!10260) b!208630))

(assert (= (and d!70431 (not c!10260)) b!208637))

(assert (= (and b!208637 res!175099) b!208635))

(assert (= (and b!208635 res!175098) b!208632))

(assert (= (and b!208632 res!175101) b!208636))

(assert (= (and b!208636 res!175104) b!208633))

(assert (= (and b!208637 res!175105) b!208631))

(assert (= (and b!208637 c!10259) b!208643))

(assert (= (and b!208637 (not c!10259)) b!208644))

(assert (= (and b!208637 res!175095) b!208629))

(assert (= (or b!208630 b!208632) bm!3285))

(assert (= (and d!70431 res!175106) b!208639))

(assert (= (and b!208639 res!175103) b!208642))

(assert (= (and b!208642 res!175097) b!208634))

(assert (= (and b!208634 res!175096) b!208641))

(assert (= (and b!208641 res!175102) b!208638))

(assert (= (and b!208641 res!175100) b!208640))

(declare-fun m!320955 () Bool)

(assert (=> b!208636 m!320955))

(assert (=> b!208636 m!320955))

(declare-fun m!320957 () Bool)

(assert (=> b!208636 m!320957))

(declare-fun m!320959 () Bool)

(assert (=> b!208641 m!320959))

(declare-fun m!320961 () Bool)

(assert (=> b!208641 m!320961))

(declare-fun m!320963 () Bool)

(assert (=> b!208641 m!320963))

(declare-fun m!320965 () Bool)

(assert (=> b!208641 m!320965))

(declare-fun m!320967 () Bool)

(assert (=> b!208641 m!320967))

(declare-fun m!320969 () Bool)

(assert (=> b!208641 m!320969))

(declare-fun m!320971 () Bool)

(assert (=> b!208630 m!320971))

(declare-fun m!320973 () Bool)

(assert (=> bm!3285 m!320973))

(declare-fun m!320975 () Bool)

(assert (=> d!70431 m!320975))

(declare-fun m!320977 () Bool)

(assert (=> b!208638 m!320977))

(declare-fun m!320979 () Bool)

(assert (=> b!208633 m!320979))

(declare-fun m!320981 () Bool)

(assert (=> b!208633 m!320981))

(declare-fun m!320983 () Bool)

(assert (=> b!208642 m!320983))

(assert (=> b!208642 m!320525))

(assert (=> b!208635 m!320981))

(assert (=> b!208635 m!320525))

(declare-fun m!320985 () Bool)

(assert (=> b!208634 m!320985))

(declare-fun m!320987 () Bool)

(assert (=> b!208637 m!320987))

(declare-fun m!320989 () Bool)

(assert (=> b!208637 m!320989))

(declare-fun m!320991 () Bool)

(assert (=> b!208637 m!320991))

(declare-fun m!320993 () Bool)

(assert (=> b!208637 m!320993))

(declare-fun m!320995 () Bool)

(assert (=> b!208637 m!320995))

(declare-fun m!320997 () Bool)

(assert (=> b!208637 m!320997))

(declare-fun m!320999 () Bool)

(assert (=> b!208637 m!320999))

(declare-fun m!321001 () Bool)

(assert (=> b!208637 m!321001))

(declare-fun m!321003 () Bool)

(assert (=> b!208637 m!321003))

(declare-fun m!321005 () Bool)

(assert (=> b!208637 m!321005))

(assert (=> b!208637 m!320959))

(declare-fun m!321007 () Bool)

(assert (=> b!208637 m!321007))

(declare-fun m!321009 () Bool)

(assert (=> b!208637 m!321009))

(declare-fun m!321011 () Bool)

(assert (=> b!208637 m!321011))

(declare-fun m!321013 () Bool)

(assert (=> b!208637 m!321013))

(declare-fun m!321015 () Bool)

(assert (=> b!208637 m!321015))

(declare-fun m!321017 () Bool)

(assert (=> b!208637 m!321017))

(declare-fun m!321019 () Bool)

(assert (=> b!208637 m!321019))

(declare-fun m!321021 () Bool)

(assert (=> b!208637 m!321021))

(declare-fun m!321023 () Bool)

(assert (=> b!208637 m!321023))

(declare-fun m!321025 () Bool)

(assert (=> b!208637 m!321025))

(declare-fun m!321027 () Bool)

(assert (=> b!208637 m!321027))

(declare-fun m!321029 () Bool)

(assert (=> b!208637 m!321029))

(declare-fun m!321031 () Bool)

(assert (=> b!208637 m!321031))

(declare-fun m!321033 () Bool)

(assert (=> b!208637 m!321033))

(declare-fun m!321035 () Bool)

(assert (=> b!208637 m!321035))

(assert (=> b!208637 m!321013))

(declare-fun m!321037 () Bool)

(assert (=> b!208637 m!321037))

(declare-fun m!321039 () Bool)

(assert (=> b!208637 m!321039))

(assert (=> b!208637 m!320969))

(assert (=> b!208637 m!320525))

(declare-fun m!321041 () Bool)

(assert (=> b!208637 m!321041))

(declare-fun m!321043 () Bool)

(assert (=> b!208637 m!321043))

(declare-fun m!321045 () Bool)

(assert (=> b!208637 m!321045))

(declare-fun m!321047 () Bool)

(assert (=> b!208637 m!321047))

(assert (=> b!208361 d!70431))

(declare-fun d!70487 () Bool)

(declare-datatypes ((tuple2!17902 0))(
  ( (tuple2!17903 (_1!9606 Bool) (_2!9606 BitStream!8300)) )
))
(declare-fun lt!326223 () tuple2!17902)

(declare-fun readBit!0 (BitStream!8300) tuple2!17902)

(assert (=> d!70487 (= lt!326223 (readBit!0 (readerFrom!0 (_2!9598 lt!325448) (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204))))))

(assert (=> d!70487 (= (readBitPure!0 (readerFrom!0 (_2!9598 lt!325448) (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204))) (tuple2!17891 (_2!9606 lt!326223) (_1!9606 lt!326223)))))

(declare-fun bs!17324 () Bool)

(assert (= bs!17324 d!70487))

(assert (=> bs!17324 m!320573))

(declare-fun m!321057 () Bool)

(assert (=> bs!17324 m!321057))

(assert (=> b!208372 d!70487))

(declare-fun d!70497 () Bool)

(declare-fun e!142528 () Bool)

(assert (=> d!70497 e!142528))

(declare-fun res!175123 () Bool)

(assert (=> d!70497 (=> (not res!175123) (not e!142528))))

(assert (=> d!70497 (= res!175123 (invariant!0 (currentBit!9623 (_2!9598 lt!325448)) (currentByte!9628 (_2!9598 lt!325448)) (size!4596 (buf!5104 (_2!9598 lt!325448)))))))

(assert (=> d!70497 (= (readerFrom!0 (_2!9598 lt!325448) (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204)) (BitStream!8301 (buf!5104 (_2!9598 lt!325448)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)))))

(declare-fun b!208659 () Bool)

(assert (=> b!208659 (= e!142528 (invariant!0 (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204) (size!4596 (buf!5104 (_2!9598 lt!325448)))))))

(assert (= (and d!70497 res!175123) b!208659))

(assert (=> d!70497 m!320703))

(assert (=> b!208659 m!320565))

(assert (=> b!208372 d!70497))

(declare-fun d!70499 () Bool)

(assert (=> d!70499 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204) (size!4596 (buf!5104 thiss!1204))))))

(declare-fun bs!17325 () Bool)

(assert (= bs!17325 d!70499))

(assert (=> bs!17325 m!320529))

(assert (=> start!43762 d!70499))

(declare-fun d!70501 () Bool)

(assert (=> d!70501 (= (invariant!0 (currentBit!9623 (_2!9598 lt!325445)) (currentByte!9628 (_2!9598 lt!325445)) (size!4596 (buf!5104 (_2!9598 lt!325445)))) (and (bvsge (currentBit!9623 (_2!9598 lt!325445)) #b00000000000000000000000000000000) (bvslt (currentBit!9623 (_2!9598 lt!325445)) #b00000000000000000000000000001000) (bvsge (currentByte!9628 (_2!9598 lt!325445)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9628 (_2!9598 lt!325445)) (size!4596 (buf!5104 (_2!9598 lt!325445)))) (and (= (currentBit!9623 (_2!9598 lt!325445)) #b00000000000000000000000000000000) (= (currentByte!9628 (_2!9598 lt!325445)) (size!4596 (buf!5104 (_2!9598 lt!325445))))))))))

(assert (=> b!208371 d!70501))

(declare-fun d!70503 () Bool)

(declare-fun e!142529 () Bool)

(assert (=> d!70503 e!142529))

(declare-fun res!175124 () Bool)

(assert (=> d!70503 (=> (not res!175124) (not e!142529))))

(declare-fun lt!326225 () (_ BitVec 64))

(declare-fun lt!326228 () (_ BitVec 64))

(declare-fun lt!326224 () (_ BitVec 64))

(assert (=> d!70503 (= res!175124 (= lt!326224 (bvsub lt!326228 lt!326225)))))

(assert (=> d!70503 (or (= (bvand lt!326228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326228 lt!326225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70503 (= lt!326225 (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9600 lt!325437)))) ((_ sign_extend 32) (currentByte!9628 (_1!9600 lt!325437))) ((_ sign_extend 32) (currentBit!9623 (_1!9600 lt!325437)))))))

(declare-fun lt!326227 () (_ BitVec 64))

(declare-fun lt!326229 () (_ BitVec 64))

(assert (=> d!70503 (= lt!326228 (bvmul lt!326227 lt!326229))))

(assert (=> d!70503 (or (= lt!326227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326229 (bvsdiv (bvmul lt!326227 lt!326229) lt!326227)))))

(assert (=> d!70503 (= lt!326229 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70503 (= lt!326227 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9600 lt!325437)))))))

(assert (=> d!70503 (= lt!326224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9628 (_1!9600 lt!325437))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9623 (_1!9600 lt!325437)))))))

(assert (=> d!70503 (invariant!0 (currentBit!9623 (_1!9600 lt!325437)) (currentByte!9628 (_1!9600 lt!325437)) (size!4596 (buf!5104 (_1!9600 lt!325437))))))

(assert (=> d!70503 (= (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!325437))) (currentByte!9628 (_1!9600 lt!325437)) (currentBit!9623 (_1!9600 lt!325437))) lt!326224)))

(declare-fun b!208660 () Bool)

(declare-fun res!175125 () Bool)

(assert (=> b!208660 (=> (not res!175125) (not e!142529))))

(assert (=> b!208660 (= res!175125 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326224))))

(declare-fun b!208661 () Bool)

(declare-fun lt!326226 () (_ BitVec 64))

(assert (=> b!208661 (= e!142529 (bvsle lt!326224 (bvmul lt!326226 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208661 (or (= lt!326226 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326226 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326226)))))

(assert (=> b!208661 (= lt!326226 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9600 lt!325437)))))))

(assert (= (and d!70503 res!175124) b!208660))

(assert (= (and b!208660 res!175125) b!208661))

(declare-fun m!321059 () Bool)

(assert (=> d!70503 m!321059))

(declare-fun m!321061 () Bool)

(assert (=> d!70503 m!321061))

(assert (=> b!208373 d!70503))

(declare-fun d!70505 () Bool)

(declare-fun lt!326230 () tuple2!17902)

(assert (=> d!70505 (= lt!326230 (readBit!0 (_1!9599 lt!325452)))))

(assert (=> d!70505 (= (readBitPure!0 (_1!9599 lt!325452)) (tuple2!17891 (_2!9606 lt!326230) (_1!9606 lt!326230)))))

(declare-fun bs!17326 () Bool)

(assert (= bs!17326 d!70505))

(declare-fun m!321063 () Bool)

(assert (=> bs!17326 m!321063))

(assert (=> b!208362 d!70505))

(declare-fun d!70507 () Bool)

(assert (=> d!70507 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448))) lt!325454)))

(declare-fun lt!326233 () Unit!14825)

(declare-fun choose!9 (BitStream!8300 array!10452 (_ BitVec 64) BitStream!8300) Unit!14825)

(assert (=> d!70507 (= lt!326233 (choose!9 (_2!9598 lt!325448) (buf!5104 (_2!9598 lt!325445)) lt!325454 (BitStream!8301 (buf!5104 (_2!9598 lt!325445)) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448)))))))

(assert (=> d!70507 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9598 lt!325448) (buf!5104 (_2!9598 lt!325445)) lt!325454) lt!326233)))

(declare-fun bs!17327 () Bool)

(assert (= bs!17327 d!70507))

(assert (=> bs!17327 m!320555))

(declare-fun m!321065 () Bool)

(assert (=> bs!17327 m!321065))

(assert (=> b!208362 d!70507))

(declare-fun d!70509 () Bool)

(assert (=> d!70509 (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))) ((_ sign_extend 32) (currentByte!9628 thiss!1204)) ((_ sign_extend 32) (currentBit!9623 thiss!1204)) lt!325447)))

(declare-fun lt!326234 () Unit!14825)

(assert (=> d!70509 (= lt!326234 (choose!9 thiss!1204 (buf!5104 (_2!9598 lt!325445)) lt!325447 (BitStream!8301 (buf!5104 (_2!9598 lt!325445)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204))))))

(assert (=> d!70509 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5104 (_2!9598 lt!325445)) lt!325447) lt!326234)))

(declare-fun bs!17328 () Bool)

(assert (= bs!17328 d!70509))

(assert (=> bs!17328 m!320567))

(declare-fun m!321067 () Bool)

(assert (=> bs!17328 m!321067))

(assert (=> b!208362 d!70509))

(declare-fun d!70511 () Bool)

(assert (=> d!70511 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))) ((_ sign_extend 32) (currentByte!9628 thiss!1204)) ((_ sign_extend 32) (currentBit!9623 thiss!1204)) lt!325447) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))) ((_ sign_extend 32) (currentByte!9628 thiss!1204)) ((_ sign_extend 32) (currentBit!9623 thiss!1204))) lt!325447))))

(declare-fun bs!17329 () Bool)

(assert (= bs!17329 d!70511))

(declare-fun m!321069 () Bool)

(assert (=> bs!17329 m!321069))

(assert (=> b!208362 d!70511))

(declare-fun d!70513 () Bool)

(declare-fun lt!326235 () tuple2!17902)

(assert (=> d!70513 (= lt!326235 (readBit!0 lt!325446))))

(assert (=> d!70513 (= (readBitPure!0 lt!325446) (tuple2!17891 (_2!9606 lt!326235) (_1!9606 lt!326235)))))

(declare-fun bs!17330 () Bool)

(assert (= bs!17330 d!70513))

(declare-fun m!321071 () Bool)

(assert (=> bs!17330 m!321071))

(assert (=> b!208362 d!70513))

(declare-fun d!70515 () Bool)

(declare-fun lt!326236 () tuple2!17902)

(assert (=> d!70515 (= lt!326236 (readBit!0 (BitStream!8301 (buf!5104 (_2!9598 lt!325445)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204))))))

(assert (=> d!70515 (= (readBitPure!0 (BitStream!8301 (buf!5104 (_2!9598 lt!325445)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204))) (tuple2!17891 (_2!9606 lt!326236) (_1!9606 lt!326236)))))

(declare-fun bs!17331 () Bool)

(assert (= bs!17331 d!70515))

(declare-fun m!321073 () Bool)

(assert (=> bs!17331 m!321073))

(assert (=> b!208362 d!70515))

(declare-fun d!70517 () Bool)

(declare-datatypes ((tuple2!17904 0))(
  ( (tuple2!17905 (_1!9607 (_ BitVec 64)) (_2!9607 BitStream!8300)) )
))
(declare-fun lt!326239 () tuple2!17904)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17904)

(assert (=> d!70517 (= lt!326239 (readNBitsLSBFirstsLoop!0 (_1!9599 lt!325452) nBits!348 i!590 lt!325443))))

(assert (=> d!70517 (= (readNBitsLSBFirstsLoopPure!0 (_1!9599 lt!325452) nBits!348 i!590 lt!325443) (tuple2!17893 (_2!9607 lt!326239) (_1!9607 lt!326239)))))

(declare-fun bs!17332 () Bool)

(assert (= bs!17332 d!70517))

(declare-fun m!321075 () Bool)

(assert (=> bs!17332 m!321075))

(assert (=> b!208362 d!70517))

(declare-fun d!70519 () Bool)

(declare-fun e!142539 () Bool)

(assert (=> d!70519 e!142539))

(declare-fun res!175142 () Bool)

(assert (=> d!70519 (=> (not res!175142) (not e!142539))))

(declare-fun lt!326271 () tuple2!17890)

(declare-fun lt!326272 () tuple2!17890)

(assert (=> d!70519 (= res!175142 (= (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!326271))) (currentByte!9628 (_1!9600 lt!326271)) (currentBit!9623 (_1!9600 lt!326271))) (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!326272))) (currentByte!9628 (_1!9600 lt!326272)) (currentBit!9623 (_1!9600 lt!326272)))))))

(declare-fun lt!326273 () BitStream!8300)

(declare-fun lt!326274 () Unit!14825)

(declare-fun choose!50 (BitStream!8300 BitStream!8300 BitStream!8300 tuple2!17890 tuple2!17890 BitStream!8300 Bool tuple2!17890 tuple2!17890 BitStream!8300 Bool) Unit!14825)

(assert (=> d!70519 (= lt!326274 (choose!50 lt!325446 (_2!9598 lt!325445) lt!326273 lt!326271 (tuple2!17891 (_1!9600 lt!326271) (_2!9600 lt!326271)) (_1!9600 lt!326271) (_2!9600 lt!326271) lt!326272 (tuple2!17891 (_1!9600 lt!326272) (_2!9600 lt!326272)) (_1!9600 lt!326272) (_2!9600 lt!326272)))))

(assert (=> d!70519 (= lt!326272 (readBitPure!0 lt!326273))))

(assert (=> d!70519 (= lt!326271 (readBitPure!0 lt!325446))))

(assert (=> d!70519 (= lt!326273 (BitStream!8301 (buf!5104 (_2!9598 lt!325445)) (currentByte!9628 lt!325446) (currentBit!9623 lt!325446)))))

(assert (=> d!70519 (invariant!0 (currentBit!9623 lt!325446) (currentByte!9628 lt!325446) (size!4596 (buf!5104 (_2!9598 lt!325445))))))

(assert (=> d!70519 (= (readBitPrefixLemma!0 lt!325446 (_2!9598 lt!325445)) lt!326274)))

(declare-fun b!208679 () Bool)

(assert (=> b!208679 (= e!142539 (= (_2!9600 lt!326271) (_2!9600 lt!326272)))))

(assert (= (and d!70519 res!175142) b!208679))

(declare-fun m!321103 () Bool)

(assert (=> d!70519 m!321103))

(declare-fun m!321105 () Bool)

(assert (=> d!70519 m!321105))

(declare-fun m!321107 () Bool)

(assert (=> d!70519 m!321107))

(declare-fun m!321109 () Bool)

(assert (=> d!70519 m!321109))

(declare-fun m!321111 () Bool)

(assert (=> d!70519 m!321111))

(assert (=> d!70519 m!320543))

(assert (=> b!208362 d!70519))

(declare-fun d!70537 () Bool)

(declare-fun e!142540 () Bool)

(assert (=> d!70537 e!142540))

(declare-fun res!175143 () Bool)

(assert (=> d!70537 (=> (not res!175143) (not e!142540))))

(declare-fun lt!326275 () (_ BitVec 64))

(declare-fun lt!326276 () (_ BitVec 64))

(declare-fun lt!326279 () (_ BitVec 64))

(assert (=> d!70537 (= res!175143 (= lt!326275 (bvsub lt!326279 lt!326276)))))

(assert (=> d!70537 (or (= (bvand lt!326279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326276 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326279 lt!326276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70537 (= lt!326276 (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9600 lt!325451)))) ((_ sign_extend 32) (currentByte!9628 (_1!9600 lt!325451))) ((_ sign_extend 32) (currentBit!9623 (_1!9600 lt!325451)))))))

(declare-fun lt!326278 () (_ BitVec 64))

(declare-fun lt!326280 () (_ BitVec 64))

(assert (=> d!70537 (= lt!326279 (bvmul lt!326278 lt!326280))))

(assert (=> d!70537 (or (= lt!326278 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326280 (bvsdiv (bvmul lt!326278 lt!326280) lt!326278)))))

(assert (=> d!70537 (= lt!326280 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70537 (= lt!326278 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9600 lt!325451)))))))

(assert (=> d!70537 (= lt!326275 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9628 (_1!9600 lt!325451))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9623 (_1!9600 lt!325451)))))))

(assert (=> d!70537 (invariant!0 (currentBit!9623 (_1!9600 lt!325451)) (currentByte!9628 (_1!9600 lt!325451)) (size!4596 (buf!5104 (_1!9600 lt!325451))))))

(assert (=> d!70537 (= (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!325451))) (currentByte!9628 (_1!9600 lt!325451)) (currentBit!9623 (_1!9600 lt!325451))) lt!326275)))

(declare-fun b!208680 () Bool)

(declare-fun res!175144 () Bool)

(assert (=> b!208680 (=> (not res!175144) (not e!142540))))

(assert (=> b!208680 (= res!175144 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326275))))

(declare-fun b!208681 () Bool)

(declare-fun lt!326277 () (_ BitVec 64))

(assert (=> b!208681 (= e!142540 (bvsle lt!326275 (bvmul lt!326277 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208681 (or (= lt!326277 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326277 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326277)))))

(assert (=> b!208681 (= lt!326277 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9600 lt!325451)))))))

(assert (= (and d!70537 res!175143) b!208680))

(assert (= (and b!208680 res!175144) b!208681))

(declare-fun m!321113 () Bool)

(assert (=> d!70537 m!321113))

(declare-fun m!321115 () Bool)

(assert (=> d!70537 m!321115))

(assert (=> b!208362 d!70537))

(declare-fun b!208695 () Bool)

(declare-fun e!142548 () Unit!14825)

(declare-fun Unit!14864 () Unit!14825)

(assert (=> b!208695 (= e!142548 Unit!14864)))

(declare-fun d!70539 () Bool)

(declare-fun e!142549 () Bool)

(assert (=> d!70539 e!142549))

(declare-fun res!175154 () Bool)

(assert (=> d!70539 (=> (not res!175154) (not e!142549))))

(declare-fun lt!326347 () tuple2!17888)

(assert (=> d!70539 (= res!175154 (isPrefixOf!0 (_1!9599 lt!326347) (_2!9599 lt!326347)))))

(declare-fun lt!326342 () BitStream!8300)

(assert (=> d!70539 (= lt!326347 (tuple2!17889 lt!326342 (_2!9598 lt!325445)))))

(declare-fun lt!326345 () Unit!14825)

(declare-fun lt!326354 () Unit!14825)

(assert (=> d!70539 (= lt!326345 lt!326354)))

(assert (=> d!70539 (isPrefixOf!0 lt!326342 (_2!9598 lt!325445))))

(assert (=> d!70539 (= lt!326354 (lemmaIsPrefixTransitive!0 lt!326342 (_2!9598 lt!325445) (_2!9598 lt!325445)))))

(declare-fun lt!326339 () Unit!14825)

(declare-fun lt!326336 () Unit!14825)

(assert (=> d!70539 (= lt!326339 lt!326336)))

(assert (=> d!70539 (isPrefixOf!0 lt!326342 (_2!9598 lt!325445))))

(assert (=> d!70539 (= lt!326336 (lemmaIsPrefixTransitive!0 lt!326342 thiss!1204 (_2!9598 lt!325445)))))

(declare-fun lt!326337 () Unit!14825)

(assert (=> d!70539 (= lt!326337 e!142548)))

(declare-fun c!10263 () Bool)

(assert (=> d!70539 (= c!10263 (not (= (size!4596 (buf!5104 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!326344 () Unit!14825)

(declare-fun lt!326349 () Unit!14825)

(assert (=> d!70539 (= lt!326344 lt!326349)))

(assert (=> d!70539 (isPrefixOf!0 (_2!9598 lt!325445) (_2!9598 lt!325445))))

(assert (=> d!70539 (= lt!326349 (lemmaIsPrefixRefl!0 (_2!9598 lt!325445)))))

(declare-fun lt!326340 () Unit!14825)

(declare-fun lt!326338 () Unit!14825)

(assert (=> d!70539 (= lt!326340 lt!326338)))

(assert (=> d!70539 (= lt!326338 (lemmaIsPrefixRefl!0 (_2!9598 lt!325445)))))

(declare-fun lt!326348 () Unit!14825)

(declare-fun lt!326346 () Unit!14825)

(assert (=> d!70539 (= lt!326348 lt!326346)))

(assert (=> d!70539 (isPrefixOf!0 lt!326342 lt!326342)))

(assert (=> d!70539 (= lt!326346 (lemmaIsPrefixRefl!0 lt!326342))))

(declare-fun lt!326351 () Unit!14825)

(declare-fun lt!326352 () Unit!14825)

(assert (=> d!70539 (= lt!326351 lt!326352)))

(assert (=> d!70539 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70539 (= lt!326352 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70539 (= lt!326342 (BitStream!8301 (buf!5104 (_2!9598 lt!325445)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)))))

(assert (=> d!70539 (isPrefixOf!0 thiss!1204 (_2!9598 lt!325445))))

(assert (=> d!70539 (= (reader!0 thiss!1204 (_2!9598 lt!325445)) lt!326347)))

(declare-fun b!208696 () Bool)

(declare-fun lt!326353 () Unit!14825)

(assert (=> b!208696 (= e!142548 lt!326353)))

(declare-fun lt!326350 () (_ BitVec 64))

(assert (=> b!208696 (= lt!326350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!326343 () (_ BitVec 64))

(assert (=> b!208696 (= lt!326343 (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10452 array!10452 (_ BitVec 64) (_ BitVec 64)) Unit!14825)

(assert (=> b!208696 (= lt!326353 (arrayBitRangesEqSymmetric!0 (buf!5104 thiss!1204) (buf!5104 (_2!9598 lt!325445)) lt!326350 lt!326343))))

(assert (=> b!208696 (arrayBitRangesEq!0 (buf!5104 (_2!9598 lt!325445)) (buf!5104 thiss!1204) lt!326350 lt!326343)))

(declare-fun b!208697 () Bool)

(declare-fun res!175155 () Bool)

(assert (=> b!208697 (=> (not res!175155) (not e!142549))))

(assert (=> b!208697 (= res!175155 (isPrefixOf!0 (_1!9599 lt!326347) thiss!1204))))

(declare-fun lt!326341 () (_ BitVec 64))

(declare-fun b!208698 () Bool)

(declare-fun lt!326355 () (_ BitVec 64))

(assert (=> b!208698 (= e!142549 (= (_1!9599 lt!326347) (withMovedBitIndex!0 (_2!9599 lt!326347) (bvsub lt!326341 lt!326355))))))

(assert (=> b!208698 (or (= (bvand lt!326341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326341 lt!326355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208698 (= lt!326355 (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325445))) (currentByte!9628 (_2!9598 lt!325445)) (currentBit!9623 (_2!9598 lt!325445))))))

(assert (=> b!208698 (= lt!326341 (bitIndex!0 (size!4596 (buf!5104 thiss!1204)) (currentByte!9628 thiss!1204) (currentBit!9623 thiss!1204)))))

(declare-fun b!208699 () Bool)

(declare-fun res!175156 () Bool)

(assert (=> b!208699 (=> (not res!175156) (not e!142549))))

(assert (=> b!208699 (= res!175156 (isPrefixOf!0 (_2!9599 lt!326347) (_2!9598 lt!325445)))))

(assert (= (and d!70539 c!10263) b!208696))

(assert (= (and d!70539 (not c!10263)) b!208695))

(assert (= (and d!70539 res!175154) b!208697))

(assert (= (and b!208697 res!175155) b!208699))

(assert (= (and b!208699 res!175156) b!208698))

(declare-fun m!321129 () Bool)

(assert (=> b!208698 m!321129))

(assert (=> b!208698 m!320577))

(assert (=> b!208698 m!320527))

(declare-fun m!321131 () Bool)

(assert (=> d!70539 m!321131))

(declare-fun m!321133 () Bool)

(assert (=> d!70539 m!321133))

(declare-fun m!321135 () Bool)

(assert (=> d!70539 m!321135))

(declare-fun m!321137 () Bool)

(assert (=> d!70539 m!321137))

(declare-fun m!321139 () Bool)

(assert (=> d!70539 m!321139))

(declare-fun m!321141 () Bool)

(assert (=> d!70539 m!321141))

(assert (=> d!70539 m!320579))

(declare-fun m!321143 () Bool)

(assert (=> d!70539 m!321143))

(declare-fun m!321145 () Bool)

(assert (=> d!70539 m!321145))

(declare-fun m!321147 () Bool)

(assert (=> d!70539 m!321147))

(declare-fun m!321149 () Bool)

(assert (=> d!70539 m!321149))

(declare-fun m!321151 () Bool)

(assert (=> b!208699 m!321151))

(assert (=> b!208696 m!320527))

(declare-fun m!321153 () Bool)

(assert (=> b!208696 m!321153))

(declare-fun m!321155 () Bool)

(assert (=> b!208696 m!321155))

(declare-fun m!321157 () Bool)

(assert (=> b!208697 m!321157))

(assert (=> b!208362 d!70539))

(declare-fun d!70545 () Bool)

(assert (=> d!70545 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448))) lt!325454) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 (_2!9598 lt!325445)))) ((_ sign_extend 32) (currentByte!9628 (_2!9598 lt!325448))) ((_ sign_extend 32) (currentBit!9623 (_2!9598 lt!325448)))) lt!325454))))

(declare-fun bs!17338 () Bool)

(assert (= bs!17338 d!70545))

(declare-fun m!321159 () Bool)

(assert (=> bs!17338 m!321159))

(assert (=> b!208362 d!70545))

(declare-fun d!70547 () Bool)

(assert (=> d!70547 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!208362 d!70547))

(declare-fun lt!326356 () tuple2!17904)

(declare-fun d!70549 () Bool)

(assert (=> d!70549 (= lt!326356 (readNBitsLSBFirstsLoop!0 (_1!9599 lt!325441) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325443 (ite (_2!9600 lt!325459) lt!325455 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!70549 (= (readNBitsLSBFirstsLoopPure!0 (_1!9599 lt!325441) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325443 (ite (_2!9600 lt!325459) lt!325455 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17893 (_2!9607 lt!326356) (_1!9607 lt!326356)))))

(declare-fun bs!17339 () Bool)

(assert (= bs!17339 d!70549))

(declare-fun m!321161 () Bool)

(assert (=> bs!17339 m!321161))

(assert (=> b!208362 d!70549))

(declare-fun b!208700 () Bool)

(declare-fun e!142550 () Unit!14825)

(declare-fun Unit!14865 () Unit!14825)

(assert (=> b!208700 (= e!142550 Unit!14865)))

(declare-fun d!70551 () Bool)

(declare-fun e!142551 () Bool)

(assert (=> d!70551 e!142551))

(declare-fun res!175157 () Bool)

(assert (=> d!70551 (=> (not res!175157) (not e!142551))))

(declare-fun lt!326368 () tuple2!17888)

(assert (=> d!70551 (= res!175157 (isPrefixOf!0 (_1!9599 lt!326368) (_2!9599 lt!326368)))))

(declare-fun lt!326363 () BitStream!8300)

(assert (=> d!70551 (= lt!326368 (tuple2!17889 lt!326363 (_2!9598 lt!325445)))))

(declare-fun lt!326366 () Unit!14825)

(declare-fun lt!326375 () Unit!14825)

(assert (=> d!70551 (= lt!326366 lt!326375)))

(assert (=> d!70551 (isPrefixOf!0 lt!326363 (_2!9598 lt!325445))))

(assert (=> d!70551 (= lt!326375 (lemmaIsPrefixTransitive!0 lt!326363 (_2!9598 lt!325445) (_2!9598 lt!325445)))))

(declare-fun lt!326360 () Unit!14825)

(declare-fun lt!326357 () Unit!14825)

(assert (=> d!70551 (= lt!326360 lt!326357)))

(assert (=> d!70551 (isPrefixOf!0 lt!326363 (_2!9598 lt!325445))))

(assert (=> d!70551 (= lt!326357 (lemmaIsPrefixTransitive!0 lt!326363 (_2!9598 lt!325448) (_2!9598 lt!325445)))))

(declare-fun lt!326358 () Unit!14825)

(assert (=> d!70551 (= lt!326358 e!142550)))

(declare-fun c!10264 () Bool)

(assert (=> d!70551 (= c!10264 (not (= (size!4596 (buf!5104 (_2!9598 lt!325448))) #b00000000000000000000000000000000)))))

(declare-fun lt!326365 () Unit!14825)

(declare-fun lt!326370 () Unit!14825)

(assert (=> d!70551 (= lt!326365 lt!326370)))

(assert (=> d!70551 (isPrefixOf!0 (_2!9598 lt!325445) (_2!9598 lt!325445))))

(assert (=> d!70551 (= lt!326370 (lemmaIsPrefixRefl!0 (_2!9598 lt!325445)))))

(declare-fun lt!326361 () Unit!14825)

(declare-fun lt!326359 () Unit!14825)

(assert (=> d!70551 (= lt!326361 lt!326359)))

(assert (=> d!70551 (= lt!326359 (lemmaIsPrefixRefl!0 (_2!9598 lt!325445)))))

(declare-fun lt!326369 () Unit!14825)

(declare-fun lt!326367 () Unit!14825)

(assert (=> d!70551 (= lt!326369 lt!326367)))

(assert (=> d!70551 (isPrefixOf!0 lt!326363 lt!326363)))

(assert (=> d!70551 (= lt!326367 (lemmaIsPrefixRefl!0 lt!326363))))

(declare-fun lt!326372 () Unit!14825)

(declare-fun lt!326373 () Unit!14825)

(assert (=> d!70551 (= lt!326372 lt!326373)))

(assert (=> d!70551 (isPrefixOf!0 (_2!9598 lt!325448) (_2!9598 lt!325448))))

(assert (=> d!70551 (= lt!326373 (lemmaIsPrefixRefl!0 (_2!9598 lt!325448)))))

(assert (=> d!70551 (= lt!326363 (BitStream!8301 (buf!5104 (_2!9598 lt!325445)) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))))))

(assert (=> d!70551 (isPrefixOf!0 (_2!9598 lt!325448) (_2!9598 lt!325445))))

(assert (=> d!70551 (= (reader!0 (_2!9598 lt!325448) (_2!9598 lt!325445)) lt!326368)))

(declare-fun b!208701 () Bool)

(declare-fun lt!326374 () Unit!14825)

(assert (=> b!208701 (= e!142550 lt!326374)))

(declare-fun lt!326371 () (_ BitVec 64))

(assert (=> b!208701 (= lt!326371 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!326364 () (_ BitVec 64))

(assert (=> b!208701 (= lt!326364 (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))))))

(assert (=> b!208701 (= lt!326374 (arrayBitRangesEqSymmetric!0 (buf!5104 (_2!9598 lt!325448)) (buf!5104 (_2!9598 lt!325445)) lt!326371 lt!326364))))

(assert (=> b!208701 (arrayBitRangesEq!0 (buf!5104 (_2!9598 lt!325445)) (buf!5104 (_2!9598 lt!325448)) lt!326371 lt!326364)))

(declare-fun b!208702 () Bool)

(declare-fun res!175158 () Bool)

(assert (=> b!208702 (=> (not res!175158) (not e!142551))))

(assert (=> b!208702 (= res!175158 (isPrefixOf!0 (_1!9599 lt!326368) (_2!9598 lt!325448)))))

(declare-fun lt!326362 () (_ BitVec 64))

(declare-fun lt!326376 () (_ BitVec 64))

(declare-fun b!208703 () Bool)

(assert (=> b!208703 (= e!142551 (= (_1!9599 lt!326368) (withMovedBitIndex!0 (_2!9599 lt!326368) (bvsub lt!326362 lt!326376))))))

(assert (=> b!208703 (or (= (bvand lt!326362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326376 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326362 lt!326376) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208703 (= lt!326376 (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325445))) (currentByte!9628 (_2!9598 lt!325445)) (currentBit!9623 (_2!9598 lt!325445))))))

(assert (=> b!208703 (= lt!326362 (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))))))

(declare-fun b!208704 () Bool)

(declare-fun res!175159 () Bool)

(assert (=> b!208704 (=> (not res!175159) (not e!142551))))

(assert (=> b!208704 (= res!175159 (isPrefixOf!0 (_2!9599 lt!326368) (_2!9598 lt!325445)))))

(assert (= (and d!70551 c!10264) b!208701))

(assert (= (and d!70551 (not c!10264)) b!208700))

(assert (= (and d!70551 res!175157) b!208702))

(assert (= (and b!208702 res!175158) b!208704))

(assert (= (and b!208704 res!175159) b!208703))

(declare-fun m!321163 () Bool)

(assert (=> b!208703 m!321163))

(assert (=> b!208703 m!320577))

(assert (=> b!208703 m!320525))

(declare-fun m!321165 () Bool)

(assert (=> d!70551 m!321165))

(declare-fun m!321167 () Bool)

(assert (=> d!70551 m!321167))

(declare-fun m!321169 () Bool)

(assert (=> d!70551 m!321169))

(declare-fun m!321171 () Bool)

(assert (=> d!70551 m!321171))

(assert (=> d!70551 m!320971))

(assert (=> d!70551 m!321141))

(assert (=> d!70551 m!320535))

(declare-fun m!321173 () Bool)

(assert (=> d!70551 m!321173))

(declare-fun m!321175 () Bool)

(assert (=> d!70551 m!321175))

(declare-fun m!321177 () Bool)

(assert (=> d!70551 m!321177))

(assert (=> d!70551 m!321149))

(declare-fun m!321179 () Bool)

(assert (=> b!208704 m!321179))

(assert (=> b!208701 m!320525))

(declare-fun m!321181 () Bool)

(assert (=> b!208701 m!321181))

(declare-fun m!321183 () Bool)

(assert (=> b!208701 m!321183))

(declare-fun m!321185 () Bool)

(assert (=> b!208702 m!321185))

(assert (=> b!208362 d!70551))

(declare-fun d!70553 () Bool)

(assert (=> d!70553 (= (invariant!0 (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204) (size!4596 (buf!5104 (_2!9598 lt!325448)))) (and (bvsge (currentBit!9623 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9623 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9628 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9628 thiss!1204) (size!4596 (buf!5104 (_2!9598 lt!325448)))) (and (= (currentBit!9623 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9628 thiss!1204) (size!4596 (buf!5104 (_2!9598 lt!325448))))))))))

(assert (=> b!208362 d!70553))

(declare-fun d!70555 () Bool)

(declare-fun e!142554 () Bool)

(assert (=> d!70555 e!142554))

(declare-fun res!175160 () Bool)

(assert (=> d!70555 (=> (not res!175160) (not e!142554))))

(declare-fun lt!326406 () (_ BitVec 64))

(declare-fun lt!326405 () (_ BitVec 64))

(declare-fun lt!326409 () (_ BitVec 64))

(assert (=> d!70555 (= res!175160 (= lt!326405 (bvsub lt!326409 lt!326406)))))

(assert (=> d!70555 (or (= (bvand lt!326409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326406 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326409 lt!326406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70555 (= lt!326406 (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9600 lt!325442)))) ((_ sign_extend 32) (currentByte!9628 (_1!9600 lt!325442))) ((_ sign_extend 32) (currentBit!9623 (_1!9600 lt!325442)))))))

(declare-fun lt!326408 () (_ BitVec 64))

(declare-fun lt!326410 () (_ BitVec 64))

(assert (=> d!70555 (= lt!326409 (bvmul lt!326408 lt!326410))))

(assert (=> d!70555 (or (= lt!326408 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326410 (bvsdiv (bvmul lt!326408 lt!326410) lt!326408)))))

(assert (=> d!70555 (= lt!326410 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70555 (= lt!326408 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9600 lt!325442)))))))

(assert (=> d!70555 (= lt!326405 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9628 (_1!9600 lt!325442))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9623 (_1!9600 lt!325442)))))))

(assert (=> d!70555 (invariant!0 (currentBit!9623 (_1!9600 lt!325442)) (currentByte!9628 (_1!9600 lt!325442)) (size!4596 (buf!5104 (_1!9600 lt!325442))))))

(assert (=> d!70555 (= (bitIndex!0 (size!4596 (buf!5104 (_1!9600 lt!325442))) (currentByte!9628 (_1!9600 lt!325442)) (currentBit!9623 (_1!9600 lt!325442))) lt!326405)))

(declare-fun b!208709 () Bool)

(declare-fun res!175161 () Bool)

(assert (=> b!208709 (=> (not res!175161) (not e!142554))))

(assert (=> b!208709 (= res!175161 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326405))))

(declare-fun b!208710 () Bool)

(declare-fun lt!326407 () (_ BitVec 64))

(assert (=> b!208710 (= e!142554 (bvsle lt!326405 (bvmul lt!326407 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208710 (or (= lt!326407 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326407 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326407)))))

(assert (=> b!208710 (= lt!326407 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9600 lt!325442)))))))

(assert (= (and d!70555 res!175160) b!208709))

(assert (= (and b!208709 res!175161) b!208710))

(declare-fun m!321187 () Bool)

(assert (=> d!70555 m!321187))

(declare-fun m!321189 () Bool)

(assert (=> d!70555 m!321189))

(assert (=> b!208362 d!70555))

(declare-fun d!70557 () Bool)

(assert (=> d!70557 (= (invariant!0 (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204) (size!4596 (buf!5104 thiss!1204))) (and (bvsge (currentBit!9623 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9623 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9628 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9628 thiss!1204) (size!4596 (buf!5104 thiss!1204))) (and (= (currentBit!9623 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9628 thiss!1204) (size!4596 (buf!5104 thiss!1204)))))))))

(assert (=> b!208363 d!70557))

(declare-fun d!70559 () Bool)

(assert (=> d!70559 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9599 lt!325452)))) ((_ sign_extend 32) (currentByte!9628 (_1!9599 lt!325452))) ((_ sign_extend 32) (currentBit!9623 (_1!9599 lt!325452))) lt!325447) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 (_1!9599 lt!325452)))) ((_ sign_extend 32) (currentByte!9628 (_1!9599 lt!325452))) ((_ sign_extend 32) (currentBit!9623 (_1!9599 lt!325452)))) lt!325447))))

(declare-fun bs!17340 () Bool)

(assert (= bs!17340 d!70559))

(declare-fun m!321191 () Bool)

(assert (=> bs!17340 m!321191))

(assert (=> b!208374 d!70559))

(declare-fun d!70561 () Bool)

(assert (=> d!70561 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4596 (buf!5104 thiss!1204))) ((_ sign_extend 32) (currentByte!9628 thiss!1204)) ((_ sign_extend 32) (currentBit!9623 thiss!1204)) lt!325447) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4596 (buf!5104 thiss!1204))) ((_ sign_extend 32) (currentByte!9628 thiss!1204)) ((_ sign_extend 32) (currentBit!9623 thiss!1204))) lt!325447))))

(declare-fun bs!17341 () Bool)

(assert (= bs!17341 d!70561))

(assert (=> bs!17341 m!320705))

(assert (=> b!208365 d!70561))

(assert (=> b!208376 d!70417))

(assert (=> b!208376 d!70419))

(declare-fun d!70563 () Bool)

(assert (=> d!70563 (= (invariant!0 (currentBit!9623 thiss!1204) (currentByte!9628 thiss!1204) (size!4596 (buf!5104 (_2!9598 lt!325445)))) (and (bvsge (currentBit!9623 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9623 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9628 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9628 thiss!1204) (size!4596 (buf!5104 (_2!9598 lt!325445)))) (and (= (currentBit!9623 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9628 thiss!1204) (size!4596 (buf!5104 (_2!9598 lt!325445))))))))))

(assert (=> b!208375 d!70563))

(assert (=> b!208377 d!70415))

(declare-fun d!70565 () Bool)

(declare-fun res!175168 () Bool)

(declare-fun e!142558 () Bool)

(assert (=> d!70565 (=> (not res!175168) (not e!142558))))

(assert (=> d!70565 (= res!175168 (= (size!4596 (buf!5104 (_2!9598 lt!325448))) (size!4596 (buf!5104 (_2!9598 lt!325445)))))))

(assert (=> d!70565 (= (isPrefixOf!0 (_2!9598 lt!325448) (_2!9598 lt!325445)) e!142558)))

(declare-fun b!208717 () Bool)

(declare-fun res!175169 () Bool)

(assert (=> b!208717 (=> (not res!175169) (not e!142558))))

(assert (=> b!208717 (= res!175169 (bvsle (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448))) (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325445))) (currentByte!9628 (_2!9598 lt!325445)) (currentBit!9623 (_2!9598 lt!325445)))))))

(declare-fun b!208718 () Bool)

(declare-fun e!142557 () Bool)

(assert (=> b!208718 (= e!142558 e!142557)))

(declare-fun res!175170 () Bool)

(assert (=> b!208718 (=> res!175170 e!142557)))

(assert (=> b!208718 (= res!175170 (= (size!4596 (buf!5104 (_2!9598 lt!325448))) #b00000000000000000000000000000000))))

(declare-fun b!208719 () Bool)

(assert (=> b!208719 (= e!142557 (arrayBitRangesEq!0 (buf!5104 (_2!9598 lt!325448)) (buf!5104 (_2!9598 lt!325445)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4596 (buf!5104 (_2!9598 lt!325448))) (currentByte!9628 (_2!9598 lt!325448)) (currentBit!9623 (_2!9598 lt!325448)))))))

(assert (= (and d!70565 res!175168) b!208717))

(assert (= (and b!208717 res!175169) b!208718))

(assert (= (and b!208718 (not res!175170)) b!208719))

(assert (=> b!208717 m!320525))

(assert (=> b!208717 m!320577))

(assert (=> b!208719 m!320525))

(assert (=> b!208719 m!320525))

(declare-fun m!321193 () Bool)

(assert (=> b!208719 m!321193))

(assert (=> b!208368 d!70565))

(push 1)

(assert (not b!208704))

(assert (not d!70513))

(assert (not b!208630))

(assert (not b!208703))

(assert (not d!70487))

(assert (not d!70509))

(assert (not b!208701))

(assert (not d!70419))

(assert (not d!70511))

(assert (not d!70559))

(assert (not b!208717))

(assert (not d!70417))

(assert (not b!208659))

(assert (not b!208636))

(assert (not d!70545))

(assert (not b!208641))

(assert (not d!70549))

(assert (not d!70425))

(assert (not b!208702))

(assert (not b!208457))

(assert (not d!70517))

(assert (not d!70505))

(assert (not b!208637))

(assert (not b!208635))

(assert (not b!208634))

(assert (not d!70429))

(assert (not d!70551))

(assert (not b!208452))

(assert (not b!208699))

(assert (not d!70519))

(assert (not b!208451))

(assert (not b!208642))

(assert (not b!208633))

(assert (not d!70537))

(assert (not b!208433))

(assert (not d!70539))

(assert (not b!208697))

(assert (not b!208431))

(assert (not b!208454))

(assert (not d!70507))

(assert (not d!70515))

(assert (not d!70421))

(assert (not d!70555))

(assert (not b!208696))

(assert (not b!208453))

(assert (not b!208698))

(assert (not b!208719))

(assert (not b!208638))

(assert (not b!208459))

(assert (not d!70497))

(assert (not d!70499))

(assert (not d!70503))

(assert (not d!70431))

(assert (not d!70561))

(assert (not bm!3285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

