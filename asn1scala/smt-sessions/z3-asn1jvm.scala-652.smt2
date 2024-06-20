; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18252 () Bool)

(assert start!18252)

(declare-fun b!90438 () Bool)

(declare-fun e!59577 () Bool)

(declare-datatypes ((array!4244 0))(
  ( (array!4245 (arr!2551 (Array (_ BitVec 32) (_ BitVec 8))) (size!1914 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3390 0))(
  ( (BitStream!3391 (buf!2304 array!4244) (currentByte!4576 (_ BitVec 32)) (currentBit!4571 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3390)

(declare-fun array_inv!1760 (array!4244) Bool)

(assert (=> b!90438 (= e!59577 (array_inv!1760 (buf!2304 thiss!1152)))))

(declare-fun b!90439 () Bool)

(declare-fun e!59574 () Bool)

(declare-fun e!59573 () Bool)

(assert (=> b!90439 (= e!59574 (not e!59573))))

(declare-fun res!74585 () Bool)

(assert (=> b!90439 (=> res!74585 e!59573)))

(declare-datatypes ((Unit!5817 0))(
  ( (Unit!5818) )
))
(declare-datatypes ((tuple2!7544 0))(
  ( (tuple2!7545 (_1!4015 Unit!5817) (_2!4015 BitStream!3390)) )
))
(declare-fun lt!137155 () tuple2!7544)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!90439 (= res!74585 (not (invariant!0 (currentBit!4571 (_2!4015 lt!137155)) (currentByte!4576 (_2!4015 lt!137155)) (size!1914 (buf!2304 (_2!4015 lt!137155))))))))

(declare-fun e!59578 () Bool)

(assert (=> b!90439 e!59578))

(declare-fun res!74575 () Bool)

(assert (=> b!90439 (=> (not res!74575) (not e!59578))))

(assert (=> b!90439 (= res!74575 (= (size!1914 (buf!2304 thiss!1152)) (size!1914 (buf!2304 (_2!4015 lt!137155)))))))

(declare-fun lt!137156 () Bool)

(declare-fun appendBit!0 (BitStream!3390 Bool) tuple2!7544)

(assert (=> b!90439 (= lt!137155 (appendBit!0 thiss!1152 lt!137156))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!90439 (= lt!137156 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90440 () Bool)

(declare-fun e!59572 () Bool)

(declare-fun e!59579 () Bool)

(assert (=> b!90440 (= e!59572 e!59579)))

(declare-fun res!74581 () Bool)

(assert (=> b!90440 (=> (not res!74581) (not e!59579))))

(declare-datatypes ((tuple2!7546 0))(
  ( (tuple2!7547 (_1!4016 BitStream!3390) (_2!4016 Bool)) )
))
(declare-fun lt!137153 () tuple2!7546)

(assert (=> b!90440 (= res!74581 (and (= (_2!4016 lt!137153) lt!137156) (= (_1!4016 lt!137153) (_2!4015 lt!137155))))))

(declare-fun readBitPure!0 (BitStream!3390) tuple2!7546)

(declare-fun readerFrom!0 (BitStream!3390 (_ BitVec 32) (_ BitVec 32)) BitStream!3390)

(assert (=> b!90440 (= lt!137153 (readBitPure!0 (readerFrom!0 (_2!4015 lt!137155) (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152))))))

(declare-fun b!90441 () Bool)

(declare-fun lt!137154 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!90441 (= e!59579 (= (bitIndex!0 (size!1914 (buf!2304 (_1!4016 lt!137153))) (currentByte!4576 (_1!4016 lt!137153)) (currentBit!4571 (_1!4016 lt!137153))) lt!137154))))

(declare-fun b!90442 () Bool)

(declare-fun res!74573 () Bool)

(assert (=> b!90442 (=> (not res!74573) (not e!59572))))

(declare-fun isPrefixOf!0 (BitStream!3390 BitStream!3390) Bool)

(assert (=> b!90442 (= res!74573 (isPrefixOf!0 thiss!1152 (_2!4015 lt!137155)))))

(declare-fun b!90443 () Bool)

(declare-fun e!59580 () Bool)

(declare-fun thiss!1151 () BitStream!3390)

(assert (=> b!90443 (= e!59580 (array_inv!1760 (buf!2304 thiss!1151)))))

(declare-fun b!90444 () Bool)

(declare-fun e!59576 () Bool)

(assert (=> b!90444 (= e!59576 e!59574)))

(declare-fun res!74579 () Bool)

(assert (=> b!90444 (=> (not res!74579) (not e!59574))))

(declare-fun lt!137152 () (_ BitVec 64))

(declare-fun lt!137157 () (_ BitVec 64))

(assert (=> b!90444 (= res!74579 (= lt!137157 (bvadd lt!137152 ((_ sign_extend 32) i!576))))))

(assert (=> b!90444 (= lt!137157 (bitIndex!0 (size!1914 (buf!2304 thiss!1152)) (currentByte!4576 thiss!1152) (currentBit!4571 thiss!1152)))))

(assert (=> b!90444 (= lt!137152 (bitIndex!0 (size!1914 (buf!2304 thiss!1151)) (currentByte!4576 thiss!1151) (currentBit!4571 thiss!1151)))))

(declare-fun b!90445 () Bool)

(assert (=> b!90445 (= e!59578 e!59572)))

(declare-fun res!74580 () Bool)

(assert (=> b!90445 (=> (not res!74580) (not e!59572))))

(assert (=> b!90445 (= res!74580 (= lt!137154 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137157)))))

(assert (=> b!90445 (= lt!137154 (bitIndex!0 (size!1914 (buf!2304 (_2!4015 lt!137155))) (currentByte!4576 (_2!4015 lt!137155)) (currentBit!4571 (_2!4015 lt!137155))))))

(declare-fun b!90447 () Bool)

(declare-fun res!74583 () Bool)

(assert (=> b!90447 (=> (not res!74583) (not e!59576))))

(assert (=> b!90447 (= res!74583 (invariant!0 (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152) (size!1914 (buf!2304 thiss!1152))))))

(declare-fun b!90448 () Bool)

(declare-fun res!74587 () Bool)

(assert (=> b!90448 (=> (not res!74587) (not e!59576))))

(assert (=> b!90448 (= res!74587 (invariant!0 (currentBit!4571 thiss!1151) (currentByte!4576 thiss!1151) (size!1914 (buf!2304 thiss!1151))))))

(declare-fun b!90449 () Bool)

(declare-fun res!74578 () Bool)

(assert (=> b!90449 (=> (not res!74578) (not e!59576))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90449 (= res!74578 (validate_offset_bits!1 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1151))) ((_ sign_extend 32) (currentByte!4576 thiss!1151)) ((_ sign_extend 32) (currentBit!4571 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!90450 () Bool)

(declare-fun res!74586 () Bool)

(assert (=> b!90450 (=> res!74586 e!59573)))

(assert (=> b!90450 (= res!74586 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!90451 () Bool)

(declare-fun res!74577 () Bool)

(assert (=> b!90451 (=> (not res!74577) (not e!59574))))

(assert (=> b!90451 (= res!74577 (validate_offset_bits!1 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1152))) ((_ sign_extend 32) (currentByte!4576 thiss!1152)) ((_ sign_extend 32) (currentBit!4571 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!90452 () Bool)

(declare-datatypes ((tuple3!438 0))(
  ( (tuple3!439 (_1!4017 Unit!5817) (_2!4017 BitStream!3390) (_3!243 (_ BitVec 32))) )
))
(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3390 (_ BitVec 64) BitStream!3390 (_ BitVec 32)) tuple3!438)

(assert (=> b!90452 (= e!59573 (bvsge (_3!243 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4015 lt!137155) (bvadd #b00000000000000000000000000000001 i!576))) nBits!336))))

(declare-fun b!90446 () Bool)

(declare-fun res!74584 () Bool)

(assert (=> b!90446 (=> (not res!74584) (not e!59576))))

(assert (=> b!90446 (= res!74584 (and (bvsle i!576 nBits!336) (= (size!1914 (buf!2304 thiss!1152)) (size!1914 (buf!2304 thiss!1151)))))))

(declare-fun res!74582 () Bool)

(assert (=> start!18252 (=> (not res!74582) (not e!59576))))

(assert (=> start!18252 (= res!74582 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18252 e!59576))

(declare-fun inv!12 (BitStream!3390) Bool)

(assert (=> start!18252 (and (inv!12 thiss!1152) e!59577)))

(assert (=> start!18252 (and (inv!12 thiss!1151) e!59580)))

(assert (=> start!18252 true))

(declare-fun b!90453 () Bool)

(declare-fun res!74576 () Bool)

(assert (=> b!90453 (=> (not res!74576) (not e!59574))))

(assert (=> b!90453 (= res!74576 (bvslt i!576 nBits!336))))

(declare-fun b!90454 () Bool)

(declare-fun res!74574 () Bool)

(assert (=> b!90454 (=> (not res!74574) (not e!59576))))

(assert (=> b!90454 (= res!74574 (bvsge i!576 #b00000000000000000000000000000000))))

(assert (= (and start!18252 res!74582) b!90449))

(assert (= (and b!90449 res!74578) b!90448))

(assert (= (and b!90448 res!74587) b!90454))

(assert (= (and b!90454 res!74574) b!90447))

(assert (= (and b!90447 res!74583) b!90446))

(assert (= (and b!90446 res!74584) b!90444))

(assert (= (and b!90444 res!74579) b!90451))

(assert (= (and b!90451 res!74577) b!90453))

(assert (= (and b!90453 res!74576) b!90439))

(assert (= (and b!90439 res!74575) b!90445))

(assert (= (and b!90445 res!74580) b!90442))

(assert (= (and b!90442 res!74573) b!90440))

(assert (= (and b!90440 res!74581) b!90441))

(assert (= (and b!90439 (not res!74585)) b!90450))

(assert (= (and b!90450 (not res!74586)) b!90452))

(assert (= start!18252 b!90438))

(assert (= start!18252 b!90443))

(declare-fun m!134909 () Bool)

(assert (=> b!90438 m!134909))

(declare-fun m!134911 () Bool)

(assert (=> b!90439 m!134911))

(declare-fun m!134913 () Bool)

(assert (=> b!90439 m!134913))

(declare-fun m!134915 () Bool)

(assert (=> b!90440 m!134915))

(assert (=> b!90440 m!134915))

(declare-fun m!134917 () Bool)

(assert (=> b!90440 m!134917))

(declare-fun m!134919 () Bool)

(assert (=> b!90445 m!134919))

(declare-fun m!134921 () Bool)

(assert (=> b!90441 m!134921))

(declare-fun m!134923 () Bool)

(assert (=> b!90448 m!134923))

(declare-fun m!134925 () Bool)

(assert (=> b!90444 m!134925))

(declare-fun m!134927 () Bool)

(assert (=> b!90444 m!134927))

(declare-fun m!134929 () Bool)

(assert (=> b!90452 m!134929))

(declare-fun m!134931 () Bool)

(assert (=> b!90447 m!134931))

(declare-fun m!134933 () Bool)

(assert (=> b!90443 m!134933))

(declare-fun m!134935 () Bool)

(assert (=> b!90449 m!134935))

(declare-fun m!134937 () Bool)

(assert (=> b!90451 m!134937))

(declare-fun m!134939 () Bool)

(assert (=> start!18252 m!134939))

(declare-fun m!134941 () Bool)

(assert (=> start!18252 m!134941))

(declare-fun m!134943 () Bool)

(assert (=> b!90442 m!134943))

(check-sat (not b!90451) (not b!90439) (not b!90452) (not b!90443) (not b!90440) (not b!90438) (not start!18252) (not b!90447) (not b!90444) (not b!90442) (not b!90448) (not b!90449) (not b!90445) (not b!90441))
(check-sat)
(get-model)

(declare-fun d!28154 () Bool)

(declare-fun e!59613 () Bool)

(assert (=> d!28154 e!59613))

(declare-fun res!74637 () Bool)

(assert (=> d!28154 (=> (not res!74637) (not e!59613))))

(declare-fun lt!137193 () (_ BitVec 64))

(declare-fun lt!137188 () (_ BitVec 64))

(declare-fun lt!137189 () (_ BitVec 64))

(assert (=> d!28154 (= res!74637 (= lt!137189 (bvsub lt!137193 lt!137188)))))

(assert (=> d!28154 (or (= (bvand lt!137193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137193 lt!137188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28154 (= lt!137188 (remainingBits!0 ((_ sign_extend 32) (size!1914 (buf!2304 (_1!4016 lt!137153)))) ((_ sign_extend 32) (currentByte!4576 (_1!4016 lt!137153))) ((_ sign_extend 32) (currentBit!4571 (_1!4016 lt!137153)))))))

(declare-fun lt!137190 () (_ BitVec 64))

(declare-fun lt!137191 () (_ BitVec 64))

(assert (=> d!28154 (= lt!137193 (bvmul lt!137190 lt!137191))))

(assert (=> d!28154 (or (= lt!137190 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137191 (bvsdiv (bvmul lt!137190 lt!137191) lt!137190)))))

(assert (=> d!28154 (= lt!137191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28154 (= lt!137190 ((_ sign_extend 32) (size!1914 (buf!2304 (_1!4016 lt!137153)))))))

(assert (=> d!28154 (= lt!137189 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4576 (_1!4016 lt!137153))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4571 (_1!4016 lt!137153)))))))

(assert (=> d!28154 (invariant!0 (currentBit!4571 (_1!4016 lt!137153)) (currentByte!4576 (_1!4016 lt!137153)) (size!1914 (buf!2304 (_1!4016 lt!137153))))))

(assert (=> d!28154 (= (bitIndex!0 (size!1914 (buf!2304 (_1!4016 lt!137153))) (currentByte!4576 (_1!4016 lt!137153)) (currentBit!4571 (_1!4016 lt!137153))) lt!137189)))

(declare-fun b!90510 () Bool)

(declare-fun res!74638 () Bool)

(assert (=> b!90510 (=> (not res!74638) (not e!59613))))

(assert (=> b!90510 (= res!74638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137189))))

(declare-fun b!90511 () Bool)

(declare-fun lt!137192 () (_ BitVec 64))

(assert (=> b!90511 (= e!59613 (bvsle lt!137189 (bvmul lt!137192 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90511 (or (= lt!137192 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137192 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137192)))))

(assert (=> b!90511 (= lt!137192 ((_ sign_extend 32) (size!1914 (buf!2304 (_1!4016 lt!137153)))))))

(assert (= (and d!28154 res!74637) b!90510))

(assert (= (and b!90510 res!74638) b!90511))

(declare-fun m!134981 () Bool)

(assert (=> d!28154 m!134981))

(declare-fun m!134983 () Bool)

(assert (=> d!28154 m!134983))

(assert (=> b!90441 d!28154))

(declare-fun b!90544 () Bool)

(declare-fun res!74679 () Bool)

(declare-fun e!59627 () Bool)

(assert (=> b!90544 (=> (not res!74679) (not e!59627))))

(declare-fun lt!137212 () tuple2!7544)

(assert (=> b!90544 (= res!74679 (isPrefixOf!0 (_2!4015 lt!137155) (_2!4015 lt!137212)))))

(declare-fun b!90545 () Bool)

(declare-fun res!74678 () Bool)

(declare-fun e!59624 () Bool)

(assert (=> b!90545 (=> (not res!74678) (not e!59624))))

(declare-fun lt!137213 () tuple3!438)

(assert (=> b!90545 (= res!74678 (and (bvsle (_3!243 lt!137213) nBits!336) (= (size!1914 (buf!2304 (_2!4017 lt!137213))) (size!1914 (buf!2304 thiss!1151)))))))

(declare-fun b!90546 () Bool)

(assert (=> b!90546 (= e!59624 (bvsge (_3!243 lt!137213) nBits!336))))

(declare-fun b!90547 () Bool)

(declare-fun lt!137214 () (_ BitVec 32))

(declare-fun e!59628 () tuple3!438)

(declare-fun lt!137217 () tuple2!7544)

(assert (=> b!90547 (= e!59628 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4015 lt!137217) lt!137214))))

(declare-fun b!90549 () Bool)

(declare-fun res!74674 () Bool)

(declare-fun e!59625 () Bool)

(assert (=> b!90549 (=> (not res!74674) (not e!59625))))

(assert (=> b!90549 (= res!74674 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1914 (buf!2304 (_2!4015 lt!137155))) (size!1914 (buf!2304 thiss!1151)))))))

(declare-fun b!90550 () Bool)

(declare-fun res!74672 () Bool)

(assert (=> b!90550 (=> (not res!74672) (not e!59624))))

(assert (=> b!90550 (= res!74672 (validate_offset_bits!1 ((_ sign_extend 32) (size!1914 (buf!2304 (_2!4017 lt!137213)))) ((_ sign_extend 32) (currentByte!4576 (_2!4017 lt!137213))) ((_ sign_extend 32) (currentBit!4571 (_2!4017 lt!137213))) ((_ sign_extend 32) (bvsub nBits!336 (_3!243 lt!137213)))))))

(assert (=> b!90550 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!243 lt!137213) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!243 lt!137213)) #b10000000000000000000000000000000)))))

(declare-fun b!90551 () Bool)

(declare-fun res!74676 () Bool)

(assert (=> b!90551 (=> (not res!74676) (not e!59627))))

(assert (=> b!90551 (= res!74676 (= (bitIndex!0 (size!1914 (buf!2304 (_2!4015 lt!137212))) (currentByte!4576 (_2!4015 lt!137212)) (currentBit!4571 (_2!4015 lt!137212))) (bvadd (bitIndex!0 (size!1914 (buf!2304 (_2!4015 lt!137155))) (currentByte!4576 (_2!4015 lt!137155)) (currentBit!4571 (_2!4015 lt!137155))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!90552 () Bool)

(declare-fun res!74670 () Bool)

(assert (=> b!90552 (=> (not res!74670) (not e!59624))))

(declare-fun lt!137215 () (_ BitVec 64))

(declare-fun lt!137211 () (_ BitVec 64))

(assert (=> b!90552 (= res!74670 (= (bitIndex!0 (size!1914 (buf!2304 (_2!4017 lt!137213))) (currentByte!4576 (_2!4017 lt!137213)) (currentBit!4571 (_2!4017 lt!137213))) (bvadd lt!137215 lt!137211)))))

(assert (=> b!90552 (or (not (= (bvand lt!137215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137211 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137215 lt!137211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90552 (= lt!137211 ((_ sign_extend 32) (_3!243 lt!137213)))))

(assert (=> b!90552 (= lt!137215 (bitIndex!0 (size!1914 (buf!2304 thiss!1151)) (currentByte!4576 thiss!1151) (currentBit!4571 thiss!1151)))))

(declare-fun b!90553 () Bool)

(declare-fun res!74668 () Bool)

(assert (=> b!90553 (=> (not res!74668) (not e!59625))))

(assert (=> b!90553 (= res!74668 (invariant!0 (currentBit!4571 (_2!4015 lt!137155)) (currentByte!4576 (_2!4015 lt!137155)) (size!1914 (buf!2304 (_2!4015 lt!137155)))))))

(declare-fun b!90554 () Bool)

(declare-fun e!59626 () Bool)

(declare-fun lt!137210 () tuple2!7546)

(assert (=> b!90554 (= e!59626 (= (bitIndex!0 (size!1914 (buf!2304 (_1!4016 lt!137210))) (currentByte!4576 (_1!4016 lt!137210)) (currentBit!4571 (_1!4016 lt!137210))) (bitIndex!0 (size!1914 (buf!2304 (_2!4015 lt!137212))) (currentByte!4576 (_2!4015 lt!137212)) (currentBit!4571 (_2!4015 lt!137212)))))))

(declare-fun b!90555 () Bool)

(declare-fun res!74673 () Bool)

(assert (=> b!90555 (=> (not res!74673) (not e!59625))))

(assert (=> b!90555 (= res!74673 (= (bitIndex!0 (size!1914 (buf!2304 (_2!4015 lt!137155))) (currentByte!4576 (_2!4015 lt!137155)) (currentBit!4571 (_2!4015 lt!137155))) (bvadd (bitIndex!0 (size!1914 (buf!2304 thiss!1151)) (currentByte!4576 thiss!1151) (currentBit!4571 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90556 () Bool)

(declare-fun Unit!5821 () Unit!5817)

(assert (=> b!90556 (= e!59628 (tuple3!439 Unit!5821 (_2!4015 lt!137217) lt!137214))))

(declare-fun b!90557 () Bool)

(assert (=> b!90557 (= e!59627 e!59626)))

(declare-fun res!74677 () Bool)

(assert (=> b!90557 (=> (not res!74677) (not e!59626))))

(declare-fun lt!137216 () Bool)

(assert (=> b!90557 (= res!74677 (and (= (_2!4016 lt!137210) lt!137216) (= (_1!4016 lt!137210) (_2!4015 lt!137212))))))

(assert (=> b!90557 (= lt!137210 (readBitPure!0 (readerFrom!0 (_2!4015 lt!137212) (currentBit!4571 (_2!4015 lt!137155)) (currentByte!4576 (_2!4015 lt!137155)))))))

(declare-fun b!90548 () Bool)

(declare-fun res!74680 () Bool)

(assert (=> b!90548 (=> (not res!74680) (not e!59625))))

(assert (=> b!90548 (= res!74680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1914 (buf!2304 (_2!4015 lt!137155)))) ((_ sign_extend 32) (currentByte!4576 (_2!4015 lt!137155))) ((_ sign_extend 32) (currentBit!4571 (_2!4015 lt!137155))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun d!28156 () Bool)

(assert (=> d!28156 e!59624))

(declare-fun res!74669 () Bool)

(assert (=> d!28156 (=> (not res!74669) (not e!59624))))

(assert (=> d!28156 (= res!74669 (bvsge (_3!243 lt!137213) #b00000000000000000000000000000000))))

(assert (=> d!28156 (= lt!137213 e!59628)))

(declare-fun c!5879 () Bool)

(assert (=> d!28156 (= c!5879 (bvslt lt!137214 nBits!336))))

(assert (=> d!28156 (= lt!137214 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(assert (=> d!28156 (= lt!137217 lt!137212)))

(assert (=> d!28156 e!59627))

(declare-fun res!74667 () Bool)

(assert (=> d!28156 (=> (not res!74667) (not e!59627))))

(assert (=> d!28156 (= res!74667 (= (size!1914 (buf!2304 (_2!4015 lt!137155))) (size!1914 (buf!2304 (_2!4015 lt!137212)))))))

(assert (=> d!28156 (= lt!137212 (appendBit!0 (_2!4015 lt!137155) lt!137216))))

(assert (=> d!28156 (= lt!137216 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28156 e!59625))

(declare-fun res!74671 () Bool)

(assert (=> d!28156 (=> (not res!74671) (not e!59625))))

(assert (=> d!28156 (= res!74671 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!28156 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4015 lt!137155) (bvadd #b00000000000000000000000000000001 i!576)) lt!137213)))

(declare-fun b!90558 () Bool)

(declare-fun res!74675 () Bool)

(assert (=> b!90558 (=> (not res!74675) (not e!59624))))

(assert (=> b!90558 (= res!74675 (invariant!0 (currentBit!4571 (_2!4017 lt!137213)) (currentByte!4576 (_2!4017 lt!137213)) (size!1914 (buf!2304 (_2!4017 lt!137213)))))))

(declare-fun b!90559 () Bool)

(assert (=> b!90559 (= e!59625 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(assert (= (and d!28156 res!74671) b!90553))

(assert (= (and b!90553 res!74668) b!90549))

(assert (= (and b!90549 res!74674) b!90555))

(assert (= (and b!90555 res!74673) b!90548))

(assert (= (and b!90548 res!74680) b!90559))

(assert (= (and d!28156 res!74667) b!90551))

(assert (= (and b!90551 res!74676) b!90544))

(assert (= (and b!90544 res!74679) b!90557))

(assert (= (and b!90557 res!74677) b!90554))

(assert (= (and d!28156 c!5879) b!90547))

(assert (= (and d!28156 (not c!5879)) b!90556))

(assert (= (and d!28156 res!74669) b!90558))

(assert (= (and b!90558 res!74675) b!90545))

(assert (= (and b!90545 res!74678) b!90552))

(assert (= (and b!90552 res!74670) b!90550))

(assert (= (and b!90550 res!74672) b!90546))

(declare-fun m!134987 () Bool)

(assert (=> b!90557 m!134987))

(assert (=> b!90557 m!134987))

(declare-fun m!134989 () Bool)

(assert (=> b!90557 m!134989))

(declare-fun m!134991 () Bool)

(assert (=> b!90554 m!134991))

(declare-fun m!134993 () Bool)

(assert (=> b!90554 m!134993))

(declare-fun m!134995 () Bool)

(assert (=> b!90548 m!134995))

(declare-fun m!134997 () Bool)

(assert (=> b!90558 m!134997))

(declare-fun m!134999 () Bool)

(assert (=> b!90552 m!134999))

(assert (=> b!90552 m!134927))

(declare-fun m!135001 () Bool)

(assert (=> b!90544 m!135001))

(declare-fun m!135003 () Bool)

(assert (=> d!28156 m!135003))

(assert (=> b!90553 m!134911))

(declare-fun m!135005 () Bool)

(assert (=> b!90547 m!135005))

(assert (=> b!90555 m!134919))

(assert (=> b!90555 m!134927))

(declare-fun m!135007 () Bool)

(assert (=> b!90550 m!135007))

(assert (=> b!90551 m!134993))

(assert (=> b!90551 m!134919))

(assert (=> b!90452 d!28156))

(declare-fun d!28166 () Bool)

(declare-fun res!74688 () Bool)

(declare-fun e!59634 () Bool)

(assert (=> d!28166 (=> (not res!74688) (not e!59634))))

(assert (=> d!28166 (= res!74688 (= (size!1914 (buf!2304 thiss!1152)) (size!1914 (buf!2304 (_2!4015 lt!137155)))))))

(assert (=> d!28166 (= (isPrefixOf!0 thiss!1152 (_2!4015 lt!137155)) e!59634)))

(declare-fun b!90566 () Bool)

(declare-fun res!74687 () Bool)

(assert (=> b!90566 (=> (not res!74687) (not e!59634))))

(assert (=> b!90566 (= res!74687 (bvsle (bitIndex!0 (size!1914 (buf!2304 thiss!1152)) (currentByte!4576 thiss!1152) (currentBit!4571 thiss!1152)) (bitIndex!0 (size!1914 (buf!2304 (_2!4015 lt!137155))) (currentByte!4576 (_2!4015 lt!137155)) (currentBit!4571 (_2!4015 lt!137155)))))))

(declare-fun b!90567 () Bool)

(declare-fun e!59633 () Bool)

(assert (=> b!90567 (= e!59634 e!59633)))

(declare-fun res!74689 () Bool)

(assert (=> b!90567 (=> res!74689 e!59633)))

(assert (=> b!90567 (= res!74689 (= (size!1914 (buf!2304 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!90568 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4244 array!4244 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90568 (= e!59633 (arrayBitRangesEq!0 (buf!2304 thiss!1152) (buf!2304 (_2!4015 lt!137155)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1914 (buf!2304 thiss!1152)) (currentByte!4576 thiss!1152) (currentBit!4571 thiss!1152))))))

(assert (= (and d!28166 res!74688) b!90566))

(assert (= (and b!90566 res!74687) b!90567))

(assert (= (and b!90567 (not res!74689)) b!90568))

(assert (=> b!90566 m!134925))

(assert (=> b!90566 m!134919))

(assert (=> b!90568 m!134925))

(assert (=> b!90568 m!134925))

(declare-fun m!135009 () Bool)

(assert (=> b!90568 m!135009))

(assert (=> b!90442 d!28166))

(declare-fun d!28172 () Bool)

(assert (=> d!28172 (= (array_inv!1760 (buf!2304 thiss!1151)) (bvsge (size!1914 (buf!2304 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!90443 d!28172))

(declare-fun d!28174 () Bool)

(assert (=> d!28174 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1151))) ((_ sign_extend 32) (currentByte!4576 thiss!1151)) ((_ sign_extend 32) (currentBit!4571 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1151))) ((_ sign_extend 32) (currentByte!4576 thiss!1151)) ((_ sign_extend 32) (currentBit!4571 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6969 () Bool)

(assert (= bs!6969 d!28174))

(declare-fun m!135011 () Bool)

(assert (=> bs!6969 m!135011))

(assert (=> b!90449 d!28174))

(declare-fun d!28176 () Bool)

(assert (=> d!28176 (= (invariant!0 (currentBit!4571 (_2!4015 lt!137155)) (currentByte!4576 (_2!4015 lt!137155)) (size!1914 (buf!2304 (_2!4015 lt!137155)))) (and (bvsge (currentBit!4571 (_2!4015 lt!137155)) #b00000000000000000000000000000000) (bvslt (currentBit!4571 (_2!4015 lt!137155)) #b00000000000000000000000000001000) (bvsge (currentByte!4576 (_2!4015 lt!137155)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4576 (_2!4015 lt!137155)) (size!1914 (buf!2304 (_2!4015 lt!137155)))) (and (= (currentBit!4571 (_2!4015 lt!137155)) #b00000000000000000000000000000000) (= (currentByte!4576 (_2!4015 lt!137155)) (size!1914 (buf!2304 (_2!4015 lt!137155))))))))))

(assert (=> b!90439 d!28176))

(declare-fun b!90578 () Bool)

(declare-fun res!74701 () Bool)

(declare-fun e!59640 () Bool)

(assert (=> b!90578 (=> (not res!74701) (not e!59640))))

(declare-fun lt!137227 () tuple2!7544)

(declare-fun lt!137226 () (_ BitVec 64))

(declare-fun lt!137228 () (_ BitVec 64))

(assert (=> b!90578 (= res!74701 (= (bitIndex!0 (size!1914 (buf!2304 (_2!4015 lt!137227))) (currentByte!4576 (_2!4015 lt!137227)) (currentBit!4571 (_2!4015 lt!137227))) (bvadd lt!137226 lt!137228)))))

(assert (=> b!90578 (or (not (= (bvand lt!137226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137228 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137226 lt!137228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90578 (= lt!137228 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!90578 (= lt!137226 (bitIndex!0 (size!1914 (buf!2304 thiss!1152)) (currentByte!4576 thiss!1152) (currentBit!4571 thiss!1152)))))

(declare-fun b!90580 () Bool)

(declare-fun e!59639 () Bool)

(assert (=> b!90580 (= e!59640 e!59639)))

(declare-fun res!74700 () Bool)

(assert (=> b!90580 (=> (not res!74700) (not e!59639))))

(declare-fun lt!137229 () tuple2!7546)

(assert (=> b!90580 (= res!74700 (and (= (_2!4016 lt!137229) lt!137156) (= (_1!4016 lt!137229) (_2!4015 lt!137227))))))

(assert (=> b!90580 (= lt!137229 (readBitPure!0 (readerFrom!0 (_2!4015 lt!137227) (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152))))))

(declare-fun d!28178 () Bool)

(assert (=> d!28178 e!59640))

(declare-fun res!74698 () Bool)

(assert (=> d!28178 (=> (not res!74698) (not e!59640))))

(assert (=> d!28178 (= res!74698 (= (size!1914 (buf!2304 thiss!1152)) (size!1914 (buf!2304 (_2!4015 lt!137227)))))))

(declare-fun choose!16 (BitStream!3390 Bool) tuple2!7544)

(assert (=> d!28178 (= lt!137227 (choose!16 thiss!1152 lt!137156))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28178 (validate_offset_bit!0 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1152))) ((_ sign_extend 32) (currentByte!4576 thiss!1152)) ((_ sign_extend 32) (currentBit!4571 thiss!1152)))))

(assert (=> d!28178 (= (appendBit!0 thiss!1152 lt!137156) lt!137227)))

(declare-fun b!90579 () Bool)

(declare-fun res!74699 () Bool)

(assert (=> b!90579 (=> (not res!74699) (not e!59640))))

(assert (=> b!90579 (= res!74699 (isPrefixOf!0 thiss!1152 (_2!4015 lt!137227)))))

(declare-fun b!90581 () Bool)

(assert (=> b!90581 (= e!59639 (= (bitIndex!0 (size!1914 (buf!2304 (_1!4016 lt!137229))) (currentByte!4576 (_1!4016 lt!137229)) (currentBit!4571 (_1!4016 lt!137229))) (bitIndex!0 (size!1914 (buf!2304 (_2!4015 lt!137227))) (currentByte!4576 (_2!4015 lt!137227)) (currentBit!4571 (_2!4015 lt!137227)))))))

(assert (= (and d!28178 res!74698) b!90578))

(assert (= (and b!90578 res!74701) b!90579))

(assert (= (and b!90579 res!74699) b!90580))

(assert (= (and b!90580 res!74700) b!90581))

(declare-fun m!135013 () Bool)

(assert (=> b!90580 m!135013))

(assert (=> b!90580 m!135013))

(declare-fun m!135015 () Bool)

(assert (=> b!90580 m!135015))

(declare-fun m!135017 () Bool)

(assert (=> b!90578 m!135017))

(assert (=> b!90578 m!134925))

(declare-fun m!135019 () Bool)

(assert (=> b!90579 m!135019))

(declare-fun m!135021 () Bool)

(assert (=> d!28178 m!135021))

(declare-fun m!135023 () Bool)

(assert (=> d!28178 m!135023))

(declare-fun m!135025 () Bool)

(assert (=> b!90581 m!135025))

(assert (=> b!90581 m!135017))

(assert (=> b!90439 d!28178))

(declare-fun d!28180 () Bool)

(declare-datatypes ((tuple2!7552 0))(
  ( (tuple2!7553 (_1!4021 Bool) (_2!4021 BitStream!3390)) )
))
(declare-fun lt!137232 () tuple2!7552)

(declare-fun readBit!0 (BitStream!3390) tuple2!7552)

(assert (=> d!28180 (= lt!137232 (readBit!0 (readerFrom!0 (_2!4015 lt!137155) (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152))))))

(assert (=> d!28180 (= (readBitPure!0 (readerFrom!0 (_2!4015 lt!137155) (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152))) (tuple2!7547 (_2!4021 lt!137232) (_1!4021 lt!137232)))))

(declare-fun bs!6970 () Bool)

(assert (= bs!6970 d!28180))

(assert (=> bs!6970 m!134915))

(declare-fun m!135027 () Bool)

(assert (=> bs!6970 m!135027))

(assert (=> b!90440 d!28180))

(declare-fun d!28182 () Bool)

(declare-fun e!59643 () Bool)

(assert (=> d!28182 e!59643))

(declare-fun res!74705 () Bool)

(assert (=> d!28182 (=> (not res!74705) (not e!59643))))

(assert (=> d!28182 (= res!74705 (invariant!0 (currentBit!4571 (_2!4015 lt!137155)) (currentByte!4576 (_2!4015 lt!137155)) (size!1914 (buf!2304 (_2!4015 lt!137155)))))))

(assert (=> d!28182 (= (readerFrom!0 (_2!4015 lt!137155) (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152)) (BitStream!3391 (buf!2304 (_2!4015 lt!137155)) (currentByte!4576 thiss!1152) (currentBit!4571 thiss!1152)))))

(declare-fun b!90584 () Bool)

(assert (=> b!90584 (= e!59643 (invariant!0 (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152) (size!1914 (buf!2304 (_2!4015 lt!137155)))))))

(assert (= (and d!28182 res!74705) b!90584))

(assert (=> d!28182 m!134911))

(declare-fun m!135029 () Bool)

(assert (=> b!90584 m!135029))

(assert (=> b!90440 d!28182))

(declare-fun d!28184 () Bool)

(assert (=> d!28184 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1152))) ((_ sign_extend 32) (currentByte!4576 thiss!1152)) ((_ sign_extend 32) (currentBit!4571 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1152))) ((_ sign_extend 32) (currentByte!4576 thiss!1152)) ((_ sign_extend 32) (currentBit!4571 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6971 () Bool)

(assert (= bs!6971 d!28184))

(declare-fun m!135031 () Bool)

(assert (=> bs!6971 m!135031))

(assert (=> b!90451 d!28184))

(declare-fun d!28186 () Bool)

(assert (=> d!28186 (= (invariant!0 (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152) (size!1914 (buf!2304 thiss!1152))) (and (bvsge (currentBit!4571 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4571 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4576 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4576 thiss!1152) (size!1914 (buf!2304 thiss!1152))) (and (= (currentBit!4571 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4576 thiss!1152) (size!1914 (buf!2304 thiss!1152)))))))))

(assert (=> b!90447 d!28186))

(declare-fun d!28188 () Bool)

(assert (=> d!28188 (= (invariant!0 (currentBit!4571 thiss!1151) (currentByte!4576 thiss!1151) (size!1914 (buf!2304 thiss!1151))) (and (bvsge (currentBit!4571 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4571 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4576 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4576 thiss!1151) (size!1914 (buf!2304 thiss!1151))) (and (= (currentBit!4571 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4576 thiss!1151) (size!1914 (buf!2304 thiss!1151)))))))))

(assert (=> b!90448 d!28188))

(declare-fun d!28190 () Bool)

(assert (=> d!28190 (= (array_inv!1760 (buf!2304 thiss!1152)) (bvsge (size!1914 (buf!2304 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!90438 d!28190))

(declare-fun d!28192 () Bool)

(assert (=> d!28192 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152) (size!1914 (buf!2304 thiss!1152))))))

(declare-fun bs!6972 () Bool)

(assert (= bs!6972 d!28192))

(assert (=> bs!6972 m!134931))

(assert (=> start!18252 d!28192))

(declare-fun d!28194 () Bool)

(assert (=> d!28194 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4571 thiss!1151) (currentByte!4576 thiss!1151) (size!1914 (buf!2304 thiss!1151))))))

(declare-fun bs!6973 () Bool)

(assert (= bs!6973 d!28194))

(assert (=> bs!6973 m!134923))

(assert (=> start!18252 d!28194))

(declare-fun d!28196 () Bool)

(declare-fun e!59644 () Bool)

(assert (=> d!28196 e!59644))

(declare-fun res!74706 () Bool)

(assert (=> d!28196 (=> (not res!74706) (not e!59644))))

(declare-fun lt!137238 () (_ BitVec 64))

(declare-fun lt!137233 () (_ BitVec 64))

(declare-fun lt!137234 () (_ BitVec 64))

(assert (=> d!28196 (= res!74706 (= lt!137234 (bvsub lt!137238 lt!137233)))))

(assert (=> d!28196 (or (= (bvand lt!137238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137233 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137238 lt!137233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28196 (= lt!137233 (remainingBits!0 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1152))) ((_ sign_extend 32) (currentByte!4576 thiss!1152)) ((_ sign_extend 32) (currentBit!4571 thiss!1152))))))

(declare-fun lt!137235 () (_ BitVec 64))

(declare-fun lt!137236 () (_ BitVec 64))

(assert (=> d!28196 (= lt!137238 (bvmul lt!137235 lt!137236))))

(assert (=> d!28196 (or (= lt!137235 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137236 (bvsdiv (bvmul lt!137235 lt!137236) lt!137235)))))

(assert (=> d!28196 (= lt!137236 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28196 (= lt!137235 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1152))))))

(assert (=> d!28196 (= lt!137234 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4576 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4571 thiss!1152))))))

(assert (=> d!28196 (invariant!0 (currentBit!4571 thiss!1152) (currentByte!4576 thiss!1152) (size!1914 (buf!2304 thiss!1152)))))

(assert (=> d!28196 (= (bitIndex!0 (size!1914 (buf!2304 thiss!1152)) (currentByte!4576 thiss!1152) (currentBit!4571 thiss!1152)) lt!137234)))

(declare-fun b!90585 () Bool)

(declare-fun res!74707 () Bool)

(assert (=> b!90585 (=> (not res!74707) (not e!59644))))

(assert (=> b!90585 (= res!74707 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137234))))

(declare-fun b!90586 () Bool)

(declare-fun lt!137237 () (_ BitVec 64))

(assert (=> b!90586 (= e!59644 (bvsle lt!137234 (bvmul lt!137237 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90586 (or (= lt!137237 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137237 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137237)))))

(assert (=> b!90586 (= lt!137237 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1152))))))

(assert (= (and d!28196 res!74706) b!90585))

(assert (= (and b!90585 res!74707) b!90586))

(assert (=> d!28196 m!135031))

(assert (=> d!28196 m!134931))

(assert (=> b!90444 d!28196))

(declare-fun d!28198 () Bool)

(declare-fun e!59645 () Bool)

(assert (=> d!28198 e!59645))

(declare-fun res!74708 () Bool)

(assert (=> d!28198 (=> (not res!74708) (not e!59645))))

(declare-fun lt!137244 () (_ BitVec 64))

(declare-fun lt!137240 () (_ BitVec 64))

(declare-fun lt!137239 () (_ BitVec 64))

(assert (=> d!28198 (= res!74708 (= lt!137240 (bvsub lt!137244 lt!137239)))))

(assert (=> d!28198 (or (= (bvand lt!137244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137244 lt!137239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28198 (= lt!137239 (remainingBits!0 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1151))) ((_ sign_extend 32) (currentByte!4576 thiss!1151)) ((_ sign_extend 32) (currentBit!4571 thiss!1151))))))

(declare-fun lt!137241 () (_ BitVec 64))

(declare-fun lt!137242 () (_ BitVec 64))

(assert (=> d!28198 (= lt!137244 (bvmul lt!137241 lt!137242))))

(assert (=> d!28198 (or (= lt!137241 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137242 (bvsdiv (bvmul lt!137241 lt!137242) lt!137241)))))

(assert (=> d!28198 (= lt!137242 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28198 (= lt!137241 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1151))))))

(assert (=> d!28198 (= lt!137240 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4576 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4571 thiss!1151))))))

(assert (=> d!28198 (invariant!0 (currentBit!4571 thiss!1151) (currentByte!4576 thiss!1151) (size!1914 (buf!2304 thiss!1151)))))

(assert (=> d!28198 (= (bitIndex!0 (size!1914 (buf!2304 thiss!1151)) (currentByte!4576 thiss!1151) (currentBit!4571 thiss!1151)) lt!137240)))

(declare-fun b!90587 () Bool)

(declare-fun res!74709 () Bool)

(assert (=> b!90587 (=> (not res!74709) (not e!59645))))

(assert (=> b!90587 (= res!74709 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137240))))

(declare-fun b!90588 () Bool)

(declare-fun lt!137243 () (_ BitVec 64))

(assert (=> b!90588 (= e!59645 (bvsle lt!137240 (bvmul lt!137243 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90588 (or (= lt!137243 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137243 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137243)))))

(assert (=> b!90588 (= lt!137243 ((_ sign_extend 32) (size!1914 (buf!2304 thiss!1151))))))

(assert (= (and d!28198 res!74708) b!90587))

(assert (= (and b!90587 res!74709) b!90588))

(assert (=> d!28198 m!135011))

(assert (=> d!28198 m!134923))

(assert (=> b!90444 d!28198))

(declare-fun d!28200 () Bool)

(declare-fun e!59646 () Bool)

(assert (=> d!28200 e!59646))

(declare-fun res!74710 () Bool)

(assert (=> d!28200 (=> (not res!74710) (not e!59646))))

(declare-fun lt!137246 () (_ BitVec 64))

(declare-fun lt!137250 () (_ BitVec 64))

(declare-fun lt!137245 () (_ BitVec 64))

(assert (=> d!28200 (= res!74710 (= lt!137246 (bvsub lt!137250 lt!137245)))))

(assert (=> d!28200 (or (= (bvand lt!137250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137245 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137250 lt!137245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28200 (= lt!137245 (remainingBits!0 ((_ sign_extend 32) (size!1914 (buf!2304 (_2!4015 lt!137155)))) ((_ sign_extend 32) (currentByte!4576 (_2!4015 lt!137155))) ((_ sign_extend 32) (currentBit!4571 (_2!4015 lt!137155)))))))

(declare-fun lt!137247 () (_ BitVec 64))

(declare-fun lt!137248 () (_ BitVec 64))

(assert (=> d!28200 (= lt!137250 (bvmul lt!137247 lt!137248))))

(assert (=> d!28200 (or (= lt!137247 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137248 (bvsdiv (bvmul lt!137247 lt!137248) lt!137247)))))

(assert (=> d!28200 (= lt!137248 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28200 (= lt!137247 ((_ sign_extend 32) (size!1914 (buf!2304 (_2!4015 lt!137155)))))))

(assert (=> d!28200 (= lt!137246 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4576 (_2!4015 lt!137155))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4571 (_2!4015 lt!137155)))))))

(assert (=> d!28200 (invariant!0 (currentBit!4571 (_2!4015 lt!137155)) (currentByte!4576 (_2!4015 lt!137155)) (size!1914 (buf!2304 (_2!4015 lt!137155))))))

(assert (=> d!28200 (= (bitIndex!0 (size!1914 (buf!2304 (_2!4015 lt!137155))) (currentByte!4576 (_2!4015 lt!137155)) (currentBit!4571 (_2!4015 lt!137155))) lt!137246)))

(declare-fun b!90589 () Bool)

(declare-fun res!74711 () Bool)

(assert (=> b!90589 (=> (not res!74711) (not e!59646))))

(assert (=> b!90589 (= res!74711 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137246))))

(declare-fun b!90590 () Bool)

(declare-fun lt!137249 () (_ BitVec 64))

(assert (=> b!90590 (= e!59646 (bvsle lt!137246 (bvmul lt!137249 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90590 (or (= lt!137249 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137249 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137249)))))

(assert (=> b!90590 (= lt!137249 ((_ sign_extend 32) (size!1914 (buf!2304 (_2!4015 lt!137155)))))))

(assert (= (and d!28200 res!74710) b!90589))

(assert (= (and b!90589 res!74711) b!90590))

(declare-fun m!135033 () Bool)

(assert (=> d!28200 m!135033))

(assert (=> d!28200 m!134911))

(assert (=> b!90445 d!28200))

(check-sat (not b!90554) (not b!90551) (not d!28194) (not d!28198) (not b!90584) (not d!28192) (not d!28196) (not d!28178) (not d!28182) (not b!90581) (not d!28184) (not b!90544) (not b!90547) (not b!90553) (not b!90557) (not b!90552) (not b!90578) (not b!90566) (not b!90548) (not d!28174) (not b!90568) (not d!28180) (not b!90579) (not b!90555) (not d!28200) (not b!90550) (not b!90558) (not d!28156) (not b!90580) (not d!28154))
(check-sat)
