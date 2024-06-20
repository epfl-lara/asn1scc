; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17850 () Bool)

(assert start!17850)

(declare-fun b!87227 () Bool)

(declare-fun e!57854 () Bool)

(declare-fun e!57855 () Bool)

(assert (=> b!87227 (= e!57854 e!57855)))

(declare-fun res!71729 () Bool)

(assert (=> b!87227 (=> (not res!71729) (not e!57855))))

(declare-fun lt!135552 () (_ BitVec 64))

(declare-fun lt!135550 () (_ BitVec 64))

(assert (=> b!87227 (= res!71729 (= lt!135552 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135550)))))

(declare-datatypes ((array!4118 0))(
  ( (array!4119 (arr!2497 (Array (_ BitVec 32) (_ BitVec 8))) (size!1860 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3282 0))(
  ( (BitStream!3283 (buf!2250 array!4118) (currentByte!4465 (_ BitVec 32)) (currentBit!4460 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5739 0))(
  ( (Unit!5740) )
))
(declare-datatypes ((tuple2!7376 0))(
  ( (tuple2!7377 (_1!3921 Unit!5739) (_2!3921 BitStream!3282)) )
))
(declare-fun lt!135553 () tuple2!7376)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87227 (= lt!135552 (bitIndex!0 (size!1860 (buf!2250 (_2!3921 lt!135553))) (currentByte!4465 (_2!3921 lt!135553)) (currentBit!4460 (_2!3921 lt!135553))))))

(declare-fun b!87228 () Bool)

(declare-fun res!71732 () Bool)

(declare-fun e!57856 () Bool)

(assert (=> b!87228 (=> (not res!71732) (not e!57856))))

(declare-fun thiss!1152 () BitStream!3282)

(declare-fun thiss!1151 () BitStream!3282)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!87228 (= res!71732 (and (bvsle i!576 nBits!336) (= (size!1860 (buf!2250 thiss!1152)) (size!1860 (buf!2250 thiss!1151)))))))

(declare-fun b!87229 () Bool)

(declare-fun res!71727 () Bool)

(assert (=> b!87229 (=> (not res!71727) (not e!57856))))

(assert (=> b!87229 (= res!71727 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87230 () Bool)

(declare-fun res!71733 () Bool)

(declare-fun e!57851 () Bool)

(assert (=> b!87230 (=> (not res!71733) (not e!57851))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87230 (= res!71733 (validate_offset_bits!1 ((_ sign_extend 32) (size!1860 (buf!2250 thiss!1152))) ((_ sign_extend 32) (currentByte!4465 thiss!1152)) ((_ sign_extend 32) (currentBit!4460 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87231 () Bool)

(declare-fun res!71724 () Bool)

(assert (=> b!87231 (=> (not res!71724) (not e!57855))))

(declare-fun isPrefixOf!0 (BitStream!3282 BitStream!3282) Bool)

(assert (=> b!87231 (= res!71724 (isPrefixOf!0 thiss!1152 (_2!3921 lt!135553)))))

(declare-fun b!87232 () Bool)

(assert (=> b!87232 (= e!57856 e!57851)))

(declare-fun res!71731 () Bool)

(assert (=> b!87232 (=> (not res!71731) (not e!57851))))

(declare-fun lt!135555 () (_ BitVec 64))

(assert (=> b!87232 (= res!71731 (= lt!135550 (bvadd lt!135555 ((_ sign_extend 32) i!576))))))

(assert (=> b!87232 (= lt!135550 (bitIndex!0 (size!1860 (buf!2250 thiss!1152)) (currentByte!4465 thiss!1152) (currentBit!4460 thiss!1152)))))

(assert (=> b!87232 (= lt!135555 (bitIndex!0 (size!1860 (buf!2250 thiss!1151)) (currentByte!4465 thiss!1151) (currentBit!4460 thiss!1151)))))

(declare-fun b!87233 () Bool)

(assert (=> b!87233 (= e!57851 (not true))))

(assert (=> b!87233 e!57854))

(declare-fun res!71728 () Bool)

(assert (=> b!87233 (=> (not res!71728) (not e!57854))))

(assert (=> b!87233 (= res!71728 (= (size!1860 (buf!2250 thiss!1152)) (size!1860 (buf!2250 (_2!3921 lt!135553)))))))

(declare-fun lt!135551 () Bool)

(declare-fun appendBit!0 (BitStream!3282 Bool) tuple2!7376)

(assert (=> b!87233 (= lt!135553 (appendBit!0 thiss!1152 lt!135551))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87233 (= lt!135551 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87234 () Bool)

(declare-fun res!71734 () Bool)

(assert (=> b!87234 (=> (not res!71734) (not e!57851))))

(assert (=> b!87234 (= res!71734 (bvslt i!576 nBits!336))))

(declare-fun b!87235 () Bool)

(declare-fun res!71723 () Bool)

(assert (=> b!87235 (=> (not res!71723) (not e!57856))))

(assert (=> b!87235 (= res!71723 (validate_offset_bits!1 ((_ sign_extend 32) (size!1860 (buf!2250 thiss!1151))) ((_ sign_extend 32) (currentByte!4465 thiss!1151)) ((_ sign_extend 32) (currentBit!4460 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87236 () Bool)

(declare-fun res!71725 () Bool)

(assert (=> b!87236 (=> (not res!71725) (not e!57856))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87236 (= res!71725 (invariant!0 (currentBit!4460 thiss!1151) (currentByte!4465 thiss!1151) (size!1860 (buf!2250 thiss!1151))))))

(declare-fun b!87237 () Bool)

(declare-fun e!57852 () Bool)

(assert (=> b!87237 (= e!57855 e!57852)))

(declare-fun res!71726 () Bool)

(assert (=> b!87237 (=> (not res!71726) (not e!57852))))

(declare-datatypes ((tuple2!7378 0))(
  ( (tuple2!7379 (_1!3922 BitStream!3282) (_2!3922 Bool)) )
))
(declare-fun lt!135554 () tuple2!7378)

(assert (=> b!87237 (= res!71726 (and (= (_2!3922 lt!135554) lt!135551) (= (_1!3922 lt!135554) (_2!3921 lt!135553))))))

(declare-fun readBitPure!0 (BitStream!3282) tuple2!7378)

(declare-fun readerFrom!0 (BitStream!3282 (_ BitVec 32) (_ BitVec 32)) BitStream!3282)

(assert (=> b!87237 (= lt!135554 (readBitPure!0 (readerFrom!0 (_2!3921 lt!135553) (currentBit!4460 thiss!1152) (currentByte!4465 thiss!1152))))))

(declare-fun res!71722 () Bool)

(assert (=> start!17850 (=> (not res!71722) (not e!57856))))

(assert (=> start!17850 (= res!71722 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17850 e!57856))

(declare-fun e!57853 () Bool)

(declare-fun inv!12 (BitStream!3282) Bool)

(assert (=> start!17850 (and (inv!12 thiss!1152) e!57853)))

(declare-fun e!57857 () Bool)

(assert (=> start!17850 (and (inv!12 thiss!1151) e!57857)))

(assert (=> start!17850 true))

(declare-fun b!87238 () Bool)

(declare-fun array_inv!1706 (array!4118) Bool)

(assert (=> b!87238 (= e!57857 (array_inv!1706 (buf!2250 thiss!1151)))))

(declare-fun b!87239 () Bool)

(assert (=> b!87239 (= e!57853 (array_inv!1706 (buf!2250 thiss!1152)))))

(declare-fun b!87240 () Bool)

(assert (=> b!87240 (= e!57852 (= (bitIndex!0 (size!1860 (buf!2250 (_1!3922 lt!135554))) (currentByte!4465 (_1!3922 lt!135554)) (currentBit!4460 (_1!3922 lt!135554))) lt!135552))))

(declare-fun b!87241 () Bool)

(declare-fun res!71730 () Bool)

(assert (=> b!87241 (=> (not res!71730) (not e!57856))))

(assert (=> b!87241 (= res!71730 (invariant!0 (currentBit!4460 thiss!1152) (currentByte!4465 thiss!1152) (size!1860 (buf!2250 thiss!1152))))))

(assert (= (and start!17850 res!71722) b!87235))

(assert (= (and b!87235 res!71723) b!87236))

(assert (= (and b!87236 res!71725) b!87229))

(assert (= (and b!87229 res!71727) b!87241))

(assert (= (and b!87241 res!71730) b!87228))

(assert (= (and b!87228 res!71732) b!87232))

(assert (= (and b!87232 res!71731) b!87230))

(assert (= (and b!87230 res!71733) b!87234))

(assert (= (and b!87234 res!71734) b!87233))

(assert (= (and b!87233 res!71728) b!87227))

(assert (= (and b!87227 res!71729) b!87231))

(assert (= (and b!87231 res!71724) b!87237))

(assert (= (and b!87237 res!71726) b!87240))

(assert (= start!17850 b!87239))

(assert (= start!17850 b!87238))

(declare-fun m!132775 () Bool)

(assert (=> b!87232 m!132775))

(declare-fun m!132777 () Bool)

(assert (=> b!87232 m!132777))

(declare-fun m!132779 () Bool)

(assert (=> b!87238 m!132779))

(declare-fun m!132781 () Bool)

(assert (=> b!87235 m!132781))

(declare-fun m!132783 () Bool)

(assert (=> b!87236 m!132783))

(declare-fun m!132785 () Bool)

(assert (=> b!87233 m!132785))

(declare-fun m!132787 () Bool)

(assert (=> b!87239 m!132787))

(declare-fun m!132789 () Bool)

(assert (=> b!87240 m!132789))

(declare-fun m!132791 () Bool)

(assert (=> b!87237 m!132791))

(assert (=> b!87237 m!132791))

(declare-fun m!132793 () Bool)

(assert (=> b!87237 m!132793))

(declare-fun m!132795 () Bool)

(assert (=> b!87231 m!132795))

(declare-fun m!132797 () Bool)

(assert (=> b!87230 m!132797))

(declare-fun m!132799 () Bool)

(assert (=> start!17850 m!132799))

(declare-fun m!132801 () Bool)

(assert (=> start!17850 m!132801))

(declare-fun m!132803 () Bool)

(assert (=> b!87227 m!132803))

(declare-fun m!132805 () Bool)

(assert (=> b!87241 m!132805))

(check-sat (not b!87227) (not b!87231) (not b!87236) (not b!87238) (not b!87232) (not b!87230) (not b!87233) (not start!17850) (not b!87235) (not b!87240) (not b!87239) (not b!87241) (not b!87237))
