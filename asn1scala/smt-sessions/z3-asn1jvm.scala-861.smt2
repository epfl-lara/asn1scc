; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24956 () Bool)

(assert start!24956)

(declare-fun b!126288 () Bool)

(declare-fun res!104644 () Bool)

(declare-fun e!83192 () Bool)

(assert (=> b!126288 (=> (not res!104644) (not e!83192))))

(declare-datatypes ((array!5707 0))(
  ( (array!5708 (arr!3187 (Array (_ BitVec 32) (_ BitVec 8))) (size!2582 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4488 0))(
  ( (BitStream!4489 (buf!2964 array!5707) (currentByte!5697 (_ BitVec 32)) (currentBit!5692 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4488)

(declare-datatypes ((Unit!7767 0))(
  ( (Unit!7768) )
))
(declare-datatypes ((tuple2!10558 0))(
  ( (tuple2!10559 (_1!5561 Unit!7767) (_2!5561 BitStream!4488)) )
))
(declare-fun lt!197471 () tuple2!10558)

(declare-fun isPrefixOf!0 (BitStream!4488 BitStream!4488) Bool)

(assert (=> b!126288 (= res!104644 (isPrefixOf!0 thiss!1614 (_2!5561 lt!197471)))))

(declare-fun b!126289 () Bool)

(declare-fun e!83194 () Bool)

(assert (=> b!126289 (= e!83192 (not e!83194))))

(declare-fun res!104640 () Bool)

(assert (=> b!126289 (=> res!104640 e!83194)))

(declare-datatypes ((tuple2!10560 0))(
  ( (tuple2!10561 (_1!5562 BitStream!4488) (_2!5562 BitStream!4488)) )
))
(declare-fun lt!197469 () tuple2!10560)

(declare-datatypes ((tuple2!10562 0))(
  ( (tuple2!10563 (_1!5563 BitStream!4488) (_2!5563 array!5707)) )
))
(declare-fun lt!197473 () tuple2!10562)

(declare-fun arr!227 () array!5707)

(assert (=> b!126289 (= res!104640 (or (not (= (size!2582 (_2!5563 lt!197473)) (size!2582 arr!227))) (not (= (_1!5563 lt!197473) (_2!5562 lt!197469)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4488 array!5707 (_ BitVec 32) (_ BitVec 32)) tuple2!10562)

(assert (=> b!126289 (= lt!197473 (readByteArrayLoopPure!0 (_1!5562 lt!197469) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197470 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126289 (validate_offset_bits!1 ((_ sign_extend 32) (size!2582 (buf!2964 (_2!5561 lt!197471)))) ((_ sign_extend 32) (currentByte!5697 thiss!1614)) ((_ sign_extend 32) (currentBit!5692 thiss!1614)) lt!197470)))

(declare-fun lt!197474 () Unit!7767)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4488 array!5707 (_ BitVec 64)) Unit!7767)

(assert (=> b!126289 (= lt!197474 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2964 (_2!5561 lt!197471)) lt!197470))))

(declare-fun reader!0 (BitStream!4488 BitStream!4488) tuple2!10560)

(assert (=> b!126289 (= lt!197469 (reader!0 thiss!1614 (_2!5561 lt!197471)))))

(declare-fun b!126290 () Bool)

(declare-fun res!104638 () Bool)

(declare-fun e!83196 () Bool)

(assert (=> b!126290 (=> res!104638 e!83196)))

(assert (=> b!126290 (= res!104638 (not (isPrefixOf!0 thiss!1614 (_2!5561 lt!197471))))))

(declare-fun b!126291 () Bool)

(declare-fun res!104639 () Bool)

(declare-fun e!83198 () Bool)

(assert (=> b!126291 (=> (not res!104639) (not e!83198))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126291 (= res!104639 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2582 (buf!2964 thiss!1614))) ((_ sign_extend 32) (currentByte!5697 thiss!1614)) ((_ sign_extend 32) (currentBit!5692 thiss!1614)) noOfBytes!1))))

(declare-fun res!104642 () Bool)

(assert (=> start!24956 (=> (not res!104642) (not e!83198))))

(assert (=> start!24956 (= res!104642 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2582 arr!227))))))

(assert (=> start!24956 e!83198))

(assert (=> start!24956 true))

(declare-fun array_inv!2371 (array!5707) Bool)

(assert (=> start!24956 (array_inv!2371 arr!227)))

(declare-fun e!83193 () Bool)

(declare-fun inv!12 (BitStream!4488) Bool)

(assert (=> start!24956 (and (inv!12 thiss!1614) e!83193)))

(declare-fun b!126292 () Bool)

(assert (=> b!126292 (= e!83198 (not e!83196))))

(declare-fun res!104643 () Bool)

(assert (=> b!126292 (=> res!104643 e!83196)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126292 (= res!104643 (not (= (bitIndex!0 (size!2582 (buf!2964 (_2!5561 lt!197471))) (currentByte!5697 (_2!5561 lt!197471)) (currentBit!5692 (_2!5561 lt!197471))) (bvadd (bitIndex!0 (size!2582 (buf!2964 thiss!1614)) (currentByte!5697 thiss!1614) (currentBit!5692 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83197 () Bool)

(assert (=> b!126292 e!83197))

(declare-fun res!104637 () Bool)

(assert (=> b!126292 (=> (not res!104637) (not e!83197))))

(assert (=> b!126292 (= res!104637 (= (size!2582 (buf!2964 thiss!1614)) (size!2582 (buf!2964 (_2!5561 lt!197471)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4488 array!5707 (_ BitVec 32) (_ BitVec 32)) tuple2!10558)

(assert (=> b!126292 (= lt!197471 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126293 () Bool)

(declare-fun arrayRangesEq!69 (array!5707 array!5707 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126293 (= e!83194 (not (arrayRangesEq!69 arr!227 (_2!5563 lt!197473) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126294 () Bool)

(assert (=> b!126294 (= e!83197 e!83192)))

(declare-fun res!104641 () Bool)

(assert (=> b!126294 (=> (not res!104641) (not e!83192))))

(assert (=> b!126294 (= res!104641 (= (bitIndex!0 (size!2582 (buf!2964 (_2!5561 lt!197471))) (currentByte!5697 (_2!5561 lt!197471)) (currentBit!5692 (_2!5561 lt!197471))) (bvadd (bitIndex!0 (size!2582 (buf!2964 thiss!1614)) (currentByte!5697 thiss!1614) (currentBit!5692 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197470))))))

(assert (=> b!126294 (= lt!197470 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126295 () Bool)

(assert (=> b!126295 (= e!83193 (array_inv!2371 (buf!2964 thiss!1614)))))

(declare-fun b!126296 () Bool)

(assert (=> b!126296 (= e!83196 true)))

(declare-fun lt!197472 () tuple2!10560)

(assert (=> b!126296 (= lt!197472 (reader!0 thiss!1614 (_2!5561 lt!197471)))))

(assert (= (and start!24956 res!104642) b!126291))

(assert (= (and b!126291 res!104639) b!126292))

(assert (= (and b!126292 res!104637) b!126294))

(assert (= (and b!126294 res!104641) b!126288))

(assert (= (and b!126288 res!104644) b!126289))

(assert (= (and b!126289 (not res!104640)) b!126293))

(assert (= (and b!126292 (not res!104643)) b!126290))

(assert (= (and b!126290 (not res!104638)) b!126296))

(assert (= start!24956 b!126295))

(declare-fun m!191783 () Bool)

(assert (=> b!126291 m!191783))

(declare-fun m!191785 () Bool)

(assert (=> b!126293 m!191785))

(declare-fun m!191787 () Bool)

(assert (=> b!126289 m!191787))

(declare-fun m!191789 () Bool)

(assert (=> b!126289 m!191789))

(declare-fun m!191791 () Bool)

(assert (=> b!126289 m!191791))

(declare-fun m!191793 () Bool)

(assert (=> b!126289 m!191793))

(assert (=> b!126296 m!191793))

(declare-fun m!191795 () Bool)

(assert (=> b!126288 m!191795))

(declare-fun m!191797 () Bool)

(assert (=> start!24956 m!191797))

(declare-fun m!191799 () Bool)

(assert (=> start!24956 m!191799))

(declare-fun m!191801 () Bool)

(assert (=> b!126294 m!191801))

(declare-fun m!191803 () Bool)

(assert (=> b!126294 m!191803))

(declare-fun m!191805 () Bool)

(assert (=> b!126295 m!191805))

(assert (=> b!126292 m!191801))

(assert (=> b!126292 m!191803))

(declare-fun m!191807 () Bool)

(assert (=> b!126292 m!191807))

(assert (=> b!126290 m!191795))

(check-sat (not b!126291) (not b!126295) (not b!126296) (not b!126289) (not b!126293) (not start!24956) (not b!126294) (not b!126292) (not b!126288) (not b!126290))
