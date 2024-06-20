; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17842 () Bool)

(assert start!17842)

(declare-fun b!86991 () Bool)

(declare-fun e!57736 () Bool)

(declare-datatypes ((array!4110 0))(
  ( (array!4111 (arr!2493 (Array (_ BitVec 32) (_ BitVec 8))) (size!1856 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3274 0))(
  ( (BitStream!3275 (buf!2246 array!4110) (currentByte!4461 (_ BitVec 32)) (currentBit!4456 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3274)

(declare-fun array_inv!1702 (array!4110) Bool)

(assert (=> b!86991 (= e!57736 (array_inv!1702 (buf!2246 thiss!1152)))))

(declare-fun b!86992 () Bool)

(declare-fun res!71523 () Bool)

(declare-fun e!57733 () Bool)

(assert (=> b!86992 (=> (not res!71523) (not e!57733))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!86992 (= res!71523 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86993 () Bool)

(declare-fun e!57729 () Bool)

(declare-fun e!57735 () Bool)

(assert (=> b!86993 (= e!57729 e!57735)))

(declare-fun res!71512 () Bool)

(assert (=> b!86993 (=> (not res!71512) (not e!57735))))

(declare-fun lt!135476 () (_ BitVec 64))

(declare-fun lt!135475 () (_ BitVec 64))

(assert (=> b!86993 (= res!71512 (= lt!135476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135475)))))

(declare-datatypes ((Unit!5731 0))(
  ( (Unit!5732) )
))
(declare-datatypes ((tuple2!7360 0))(
  ( (tuple2!7361 (_1!3910 Unit!5731) (_2!3910 BitStream!3274)) )
))
(declare-fun lt!135473 () tuple2!7360)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86993 (= lt!135476 (bitIndex!0 (size!1856 (buf!2246 (_2!3910 lt!135473))) (currentByte!4461 (_2!3910 lt!135473)) (currentBit!4456 (_2!3910 lt!135473))))))

(declare-fun b!86994 () Bool)

(declare-fun res!71513 () Bool)

(assert (=> b!86994 (=> (not res!71513) (not e!57735))))

(declare-fun isPrefixOf!0 (BitStream!3274 BitStream!3274) Bool)

(assert (=> b!86994 (= res!71513 (isPrefixOf!0 thiss!1152 (_2!3910 lt!135473)))))

(declare-fun b!86995 () Bool)

(declare-fun res!71515 () Bool)

(declare-fun e!57738 () Bool)

(assert (=> b!86995 (=> res!71515 e!57738)))

(declare-datatypes ((tuple3!412 0))(
  ( (tuple3!413 (_1!3911 Unit!5731) (_2!3911 BitStream!3274) (_3!230 (_ BitVec 32))) )
))
(declare-fun lt!135477 () tuple3!412)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86995 (= res!71515 (not (invariant!0 (currentBit!4456 (_2!3911 lt!135477)) (currentByte!4461 (_2!3911 lt!135477)) (size!1856 (buf!2246 (_2!3911 lt!135477))))))))

(declare-fun b!86996 () Bool)

(declare-fun res!71521 () Bool)

(declare-fun e!57728 () Bool)

(assert (=> b!86996 (=> (not res!71521) (not e!57728))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86996 (= res!71521 (validate_offset_bits!1 ((_ sign_extend 32) (size!1856 (buf!2246 thiss!1152))) ((_ sign_extend 32) (currentByte!4461 thiss!1152)) ((_ sign_extend 32) (currentBit!4456 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86997 () Bool)

(declare-fun e!57731 () Bool)

(assert (=> b!86997 (= e!57728 (not e!57731))))

(declare-fun res!71519 () Bool)

(assert (=> b!86997 (=> res!71519 e!57731)))

(assert (=> b!86997 (= res!71519 (not (invariant!0 (currentBit!4456 (_2!3910 lt!135473)) (currentByte!4461 (_2!3910 lt!135473)) (size!1856 (buf!2246 (_2!3910 lt!135473))))))))

(assert (=> b!86997 e!57729))

(declare-fun res!71525 () Bool)

(assert (=> b!86997 (=> (not res!71525) (not e!57729))))

(assert (=> b!86997 (= res!71525 (= (size!1856 (buf!2246 thiss!1152)) (size!1856 (buf!2246 (_2!3910 lt!135473)))))))

(declare-fun lt!135471 () Bool)

(declare-fun appendBit!0 (BitStream!3274 Bool) tuple2!7360)

(assert (=> b!86997 (= lt!135473 (appendBit!0 thiss!1152 lt!135471))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!86997 (= lt!135471 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86998 () Bool)

(declare-fun res!71518 () Bool)

(assert (=> b!86998 (=> res!71518 e!57731)))

(assert (=> b!86998 (= res!71518 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86999 () Bool)

(declare-fun res!71510 () Bool)

(assert (=> b!86999 (=> (not res!71510) (not e!57733))))

(declare-fun thiss!1151 () BitStream!3274)

(assert (=> b!86999 (= res!71510 (and (bvsle i!576 nBits!336) (= (size!1856 (buf!2246 thiss!1152)) (size!1856 (buf!2246 thiss!1151)))))))

(declare-fun b!87000 () Bool)

(declare-fun res!71529 () Bool)

(assert (=> b!87000 (=> res!71529 e!57738)))

(declare-fun lt!135474 () (_ BitVec 64))

(assert (=> b!87000 (= res!71529 (not (= (bitIndex!0 (size!1856 (buf!2246 (_2!3911 lt!135477))) (currentByte!4461 (_2!3911 lt!135477)) (currentBit!4456 (_2!3911 lt!135477))) (bvadd lt!135474 ((_ sign_extend 32) (_3!230 lt!135477))))))))

(declare-fun b!87001 () Bool)

(assert (=> b!87001 (= e!57738 (bvsge ((_ sign_extend 32) (bvsub nBits!336 (_3!230 lt!135477))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87002 () Bool)

(declare-fun res!71530 () Bool)

(assert (=> b!87002 (=> (not res!71530) (not e!57733))))

(assert (=> b!87002 (= res!71530 (invariant!0 (currentBit!4456 thiss!1151) (currentByte!4461 thiss!1151) (size!1856 (buf!2246 thiss!1151))))))

(declare-fun b!87003 () Bool)

(declare-fun res!71524 () Bool)

(assert (=> b!87003 (=> (not res!71524) (not e!57733))))

(assert (=> b!87003 (= res!71524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1856 (buf!2246 thiss!1151))) ((_ sign_extend 32) (currentByte!4461 thiss!1151)) ((_ sign_extend 32) (currentBit!4456 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87004 () Bool)

(declare-fun res!71528 () Bool)

(assert (=> b!87004 (=> res!71528 e!57738)))

(assert (=> b!87004 (= res!71528 (or (bvsgt ((_ sign_extend 32) (size!1856 (buf!2246 (_2!3911 lt!135477)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4461 (_2!3911 lt!135477))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4456 (_2!3911 lt!135477))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1856 (buf!2246 (_2!3911 lt!135477)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4461 (_2!3911 lt!135477))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4456 (_2!3911 lt!135477))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87005 () Bool)

(declare-fun res!71511 () Bool)

(assert (=> b!87005 (=> (not res!71511) (not e!57728))))

(assert (=> b!87005 (= res!71511 (bvslt i!576 nBits!336))))

(declare-fun res!71517 () Bool)

(assert (=> start!17842 (=> (not res!71517) (not e!57733))))

(assert (=> start!17842 (= res!71517 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17842 e!57733))

(declare-fun inv!12 (BitStream!3274) Bool)

(assert (=> start!17842 (and (inv!12 thiss!1152) e!57736)))

(declare-fun e!57730 () Bool)

(assert (=> start!17842 (and (inv!12 thiss!1151) e!57730)))

(assert (=> start!17842 true))

(declare-fun b!87006 () Bool)

(declare-fun res!71522 () Bool)

(assert (=> b!87006 (=> res!71522 e!57738)))

(assert (=> b!87006 (= res!71522 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4456 (_2!3911 lt!135477)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4461 (_2!3911 lt!135477)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1856 (buf!2246 (_2!3911 lt!135477))))))))))

(declare-fun b!87007 () Bool)

(declare-fun res!71526 () Bool)

(assert (=> b!87007 (=> (not res!71526) (not e!57733))))

(assert (=> b!87007 (= res!71526 (invariant!0 (currentBit!4456 thiss!1152) (currentByte!4461 thiss!1152) (size!1856 (buf!2246 thiss!1152))))))

(declare-fun b!87008 () Bool)

(declare-fun e!57732 () Bool)

(assert (=> b!87008 (= e!57735 e!57732)))

(declare-fun res!71520 () Bool)

(assert (=> b!87008 (=> (not res!71520) (not e!57732))))

(declare-datatypes ((tuple2!7362 0))(
  ( (tuple2!7363 (_1!3912 BitStream!3274) (_2!3912 Bool)) )
))
(declare-fun lt!135472 () tuple2!7362)

(assert (=> b!87008 (= res!71520 (and (= (_2!3912 lt!135472) lt!135471) (= (_1!3912 lt!135472) (_2!3910 lt!135473))))))

(declare-fun readBitPure!0 (BitStream!3274) tuple2!7362)

(declare-fun readerFrom!0 (BitStream!3274 (_ BitVec 32) (_ BitVec 32)) BitStream!3274)

(assert (=> b!87008 (= lt!135472 (readBitPure!0 (readerFrom!0 (_2!3910 lt!135473) (currentBit!4456 thiss!1152) (currentByte!4461 thiss!1152))))))

(declare-fun b!87009 () Bool)

(declare-fun res!71527 () Bool)

(assert (=> b!87009 (=> res!71527 e!57738)))

(assert (=> b!87009 (= res!71527 (or (bvsgt (_3!230 lt!135477) nBits!336) (not (= (size!1856 (buf!2246 (_2!3911 lt!135477))) (size!1856 (buf!2246 thiss!1151))))))))

(declare-fun b!87010 () Bool)

(assert (=> b!87010 (= e!57733 e!57728)))

(declare-fun res!71516 () Bool)

(assert (=> b!87010 (=> (not res!71516) (not e!57728))))

(assert (=> b!87010 (= res!71516 (= lt!135475 (bvadd lt!135474 ((_ sign_extend 32) i!576))))))

(assert (=> b!87010 (= lt!135475 (bitIndex!0 (size!1856 (buf!2246 thiss!1152)) (currentByte!4461 thiss!1152) (currentBit!4456 thiss!1152)))))

(assert (=> b!87010 (= lt!135474 (bitIndex!0 (size!1856 (buf!2246 thiss!1151)) (currentByte!4461 thiss!1151) (currentBit!4456 thiss!1151)))))

(declare-fun b!87011 () Bool)

(assert (=> b!87011 (= e!57730 (array_inv!1702 (buf!2246 thiss!1151)))))

(declare-fun b!87012 () Bool)

(assert (=> b!87012 (= e!57732 (= (bitIndex!0 (size!1856 (buf!2246 (_1!3912 lt!135472))) (currentByte!4461 (_1!3912 lt!135472)) (currentBit!4456 (_1!3912 lt!135472))) lt!135476))))

(declare-fun b!87013 () Bool)

(assert (=> b!87013 (= e!57731 e!57738)))

(declare-fun res!71514 () Bool)

(assert (=> b!87013 (=> res!71514 e!57738)))

(assert (=> b!87013 (= res!71514 (bvslt (_3!230 lt!135477) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3274 (_ BitVec 64) BitStream!3274 (_ BitVec 32)) tuple3!412)

(assert (=> b!87013 (= lt!135477 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3910 lt!135473) (bvadd #b00000000000000000000000000000001 i!576)))))

(assert (= (and start!17842 res!71517) b!87003))

(assert (= (and b!87003 res!71524) b!87002))

(assert (= (and b!87002 res!71530) b!86992))

(assert (= (and b!86992 res!71523) b!87007))

(assert (= (and b!87007 res!71526) b!86999))

(assert (= (and b!86999 res!71510) b!87010))

(assert (= (and b!87010 res!71516) b!86996))

(assert (= (and b!86996 res!71521) b!87005))

(assert (= (and b!87005 res!71511) b!86997))

(assert (= (and b!86997 res!71525) b!86993))

(assert (= (and b!86993 res!71512) b!86994))

(assert (= (and b!86994 res!71513) b!87008))

(assert (= (and b!87008 res!71520) b!87012))

(assert (= (and b!86997 (not res!71519)) b!86998))

(assert (= (and b!86998 (not res!71518)) b!87013))

(assert (= (and b!87013 (not res!71514)) b!86995))

(assert (= (and b!86995 (not res!71515)) b!87009))

(assert (= (and b!87009 (not res!71527)) b!87000))

(assert (= (and b!87000 (not res!71529)) b!87004))

(assert (= (and b!87004 (not res!71528)) b!87006))

(assert (= (and b!87006 (not res!71522)) b!87001))

(assert (= start!17842 b!86991))

(assert (= start!17842 b!87011))

(declare-fun m!132617 () Bool)

(assert (=> b!87003 m!132617))

(declare-fun m!132619 () Bool)

(assert (=> start!17842 m!132619))

(declare-fun m!132621 () Bool)

(assert (=> start!17842 m!132621))

(declare-fun m!132623 () Bool)

(assert (=> b!87013 m!132623))

(declare-fun m!132625 () Bool)

(assert (=> b!86995 m!132625))

(declare-fun m!132627 () Bool)

(assert (=> b!87012 m!132627))

(declare-fun m!132629 () Bool)

(assert (=> b!87000 m!132629))

(declare-fun m!132631 () Bool)

(assert (=> b!86997 m!132631))

(declare-fun m!132633 () Bool)

(assert (=> b!86997 m!132633))

(declare-fun m!132635 () Bool)

(assert (=> b!87007 m!132635))

(declare-fun m!132637 () Bool)

(assert (=> b!86991 m!132637))

(declare-fun m!132639 () Bool)

(assert (=> b!87010 m!132639))

(declare-fun m!132641 () Bool)

(assert (=> b!87010 m!132641))

(declare-fun m!132643 () Bool)

(assert (=> b!86993 m!132643))

(declare-fun m!132645 () Bool)

(assert (=> b!87006 m!132645))

(declare-fun m!132647 () Bool)

(assert (=> b!86996 m!132647))

(declare-fun m!132649 () Bool)

(assert (=> b!87008 m!132649))

(assert (=> b!87008 m!132649))

(declare-fun m!132651 () Bool)

(assert (=> b!87008 m!132651))

(declare-fun m!132653 () Bool)

(assert (=> b!86994 m!132653))

(declare-fun m!132655 () Bool)

(assert (=> b!87002 m!132655))

(declare-fun m!132657 () Bool)

(assert (=> b!87011 m!132657))

(push 1)

(assert (not b!87000))

(assert (not b!87013))

(assert (not b!87006))

(assert (not b!86996))

(assert (not b!86991))

(assert (not b!87002))

(assert (not b!87007))

(assert (not b!86997))

(assert (not b!87010))

(assert (not b!87008))

(assert (not b!87012))

(assert (not b!86994))

(assert (not b!86995))

(assert (not b!87011))

(assert (not b!86993))

(assert (not start!17842))

(assert (not b!87003))

(check-sat)

(pop 1)

(push 1)

(check-sat)

