; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17852 () Bool)

(assert start!17852)

(declare-fun b!87272 () Bool)

(declare-fun e!57878 () Bool)

(assert (=> b!87272 (= e!57878 (not true))))

(declare-fun e!57881 () Bool)

(assert (=> b!87272 e!57881))

(declare-fun res!71772 () Bool)

(assert (=> b!87272 (=> (not res!71772) (not e!57881))))

(declare-datatypes ((array!4120 0))(
  ( (array!4121 (arr!2498 (Array (_ BitVec 32) (_ BitVec 8))) (size!1861 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3284 0))(
  ( (BitStream!3285 (buf!2251 array!4120) (currentByte!4466 (_ BitVec 32)) (currentBit!4461 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3284)

(declare-datatypes ((Unit!5741 0))(
  ( (Unit!5742) )
))
(declare-datatypes ((tuple2!7380 0))(
  ( (tuple2!7381 (_1!3923 Unit!5741) (_2!3923 BitStream!3284)) )
))
(declare-fun lt!135570 () tuple2!7380)

(assert (=> b!87272 (= res!71772 (= (size!1861 (buf!2251 thiss!1152)) (size!1861 (buf!2251 (_2!3923 lt!135570)))))))

(declare-fun lt!135571 () Bool)

(declare-fun appendBit!0 (BitStream!3284 Bool) tuple2!7380)

(assert (=> b!87272 (= lt!135570 (appendBit!0 thiss!1152 lt!135571))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!87272 (= lt!135571 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87273 () Bool)

(declare-fun e!57885 () Bool)

(declare-fun e!57877 () Bool)

(assert (=> b!87273 (= e!57885 e!57877)))

(declare-fun res!71767 () Bool)

(assert (=> b!87273 (=> (not res!71767) (not e!57877))))

(declare-datatypes ((tuple2!7382 0))(
  ( (tuple2!7383 (_1!3924 BitStream!3284) (_2!3924 Bool)) )
))
(declare-fun lt!135568 () tuple2!7382)

(assert (=> b!87273 (= res!71767 (and (= (_2!3924 lt!135568) lt!135571) (= (_1!3924 lt!135568) (_2!3923 lt!135570))))))

(declare-fun readBitPure!0 (BitStream!3284) tuple2!7382)

(declare-fun readerFrom!0 (BitStream!3284 (_ BitVec 32) (_ BitVec 32)) BitStream!3284)

(assert (=> b!87273 (= lt!135568 (readBitPure!0 (readerFrom!0 (_2!3923 lt!135570) (currentBit!4461 thiss!1152) (currentByte!4466 thiss!1152))))))

(declare-fun b!87274 () Bool)

(declare-fun res!71773 () Bool)

(declare-fun e!57883 () Bool)

(assert (=> b!87274 (=> (not res!71773) (not e!57883))))

(assert (=> b!87274 (= res!71773 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87275 () Bool)

(declare-fun res!71762 () Bool)

(assert (=> b!87275 (=> (not res!71762) (not e!57883))))

(declare-fun thiss!1151 () BitStream!3284)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87275 (= res!71762 (validate_offset_bits!1 ((_ sign_extend 32) (size!1861 (buf!2251 thiss!1151))) ((_ sign_extend 32) (currentByte!4466 thiss!1151)) ((_ sign_extend 32) (currentBit!4461 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87276 () Bool)

(declare-fun res!71770 () Bool)

(assert (=> b!87276 (=> (not res!71770) (not e!57883))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87276 (= res!71770 (invariant!0 (currentBit!4461 thiss!1151) (currentByte!4466 thiss!1151) (size!1861 (buf!2251 thiss!1151))))))

(declare-fun b!87277 () Bool)

(declare-fun res!71769 () Bool)

(assert (=> b!87277 (=> (not res!71769) (not e!57885))))

(declare-fun isPrefixOf!0 (BitStream!3284 BitStream!3284) Bool)

(assert (=> b!87277 (= res!71769 (isPrefixOf!0 thiss!1152 (_2!3923 lt!135570)))))

(declare-fun b!87278 () Bool)

(declare-fun res!71763 () Bool)

(assert (=> b!87278 (=> (not res!71763) (not e!57878))))

(assert (=> b!87278 (= res!71763 (validate_offset_bits!1 ((_ sign_extend 32) (size!1861 (buf!2251 thiss!1152))) ((_ sign_extend 32) (currentByte!4466 thiss!1152)) ((_ sign_extend 32) (currentBit!4461 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87279 () Bool)

(declare-fun res!71761 () Bool)

(assert (=> b!87279 (=> (not res!71761) (not e!57883))))

(assert (=> b!87279 (= res!71761 (invariant!0 (currentBit!4461 thiss!1152) (currentByte!4466 thiss!1152) (size!1861 (buf!2251 thiss!1152))))))

(declare-fun b!87280 () Bool)

(declare-fun lt!135569 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87280 (= e!57877 (= (bitIndex!0 (size!1861 (buf!2251 (_1!3924 lt!135568))) (currentByte!4466 (_1!3924 lt!135568)) (currentBit!4461 (_1!3924 lt!135568))) lt!135569))))

(declare-fun b!87281 () Bool)

(assert (=> b!87281 (= e!57883 e!57878)))

(declare-fun res!71764 () Bool)

(assert (=> b!87281 (=> (not res!71764) (not e!57878))))

(declare-fun lt!135573 () (_ BitVec 64))

(declare-fun lt!135572 () (_ BitVec 64))

(assert (=> b!87281 (= res!71764 (= lt!135572 (bvadd lt!135573 ((_ sign_extend 32) i!576))))))

(assert (=> b!87281 (= lt!135572 (bitIndex!0 (size!1861 (buf!2251 thiss!1152)) (currentByte!4466 thiss!1152) (currentBit!4461 thiss!1152)))))

(assert (=> b!87281 (= lt!135573 (bitIndex!0 (size!1861 (buf!2251 thiss!1151)) (currentByte!4466 thiss!1151) (currentBit!4461 thiss!1151)))))

(declare-fun b!87282 () Bool)

(declare-fun e!57879 () Bool)

(declare-fun array_inv!1707 (array!4120) Bool)

(assert (=> b!87282 (= e!57879 (array_inv!1707 (buf!2251 thiss!1152)))))

(declare-fun res!71766 () Bool)

(assert (=> start!17852 (=> (not res!71766) (not e!57883))))

(assert (=> start!17852 (= res!71766 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17852 e!57883))

(declare-fun inv!12 (BitStream!3284) Bool)

(assert (=> start!17852 (and (inv!12 thiss!1152) e!57879)))

(declare-fun e!57882 () Bool)

(assert (=> start!17852 (and (inv!12 thiss!1151) e!57882)))

(assert (=> start!17852 true))

(declare-fun b!87283 () Bool)

(assert (=> b!87283 (= e!57881 e!57885)))

(declare-fun res!71765 () Bool)

(assert (=> b!87283 (=> (not res!71765) (not e!57885))))

(assert (=> b!87283 (= res!71765 (= lt!135569 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135572)))))

(assert (=> b!87283 (= lt!135569 (bitIndex!0 (size!1861 (buf!2251 (_2!3923 lt!135570))) (currentByte!4466 (_2!3923 lt!135570)) (currentBit!4461 (_2!3923 lt!135570))))))

(declare-fun b!87284 () Bool)

(assert (=> b!87284 (= e!57882 (array_inv!1707 (buf!2251 thiss!1151)))))

(declare-fun b!87285 () Bool)

(declare-fun res!71768 () Bool)

(assert (=> b!87285 (=> (not res!71768) (not e!57878))))

(assert (=> b!87285 (= res!71768 (bvslt i!576 nBits!336))))

(declare-fun b!87286 () Bool)

(declare-fun res!71771 () Bool)

(assert (=> b!87286 (=> (not res!71771) (not e!57883))))

(assert (=> b!87286 (= res!71771 (and (bvsle i!576 nBits!336) (= (size!1861 (buf!2251 thiss!1152)) (size!1861 (buf!2251 thiss!1151)))))))

(assert (= (and start!17852 res!71766) b!87275))

(assert (= (and b!87275 res!71762) b!87276))

(assert (= (and b!87276 res!71770) b!87274))

(assert (= (and b!87274 res!71773) b!87279))

(assert (= (and b!87279 res!71761) b!87286))

(assert (= (and b!87286 res!71771) b!87281))

(assert (= (and b!87281 res!71764) b!87278))

(assert (= (and b!87278 res!71763) b!87285))

(assert (= (and b!87285 res!71768) b!87272))

(assert (= (and b!87272 res!71772) b!87283))

(assert (= (and b!87283 res!71765) b!87277))

(assert (= (and b!87277 res!71769) b!87273))

(assert (= (and b!87273 res!71767) b!87280))

(assert (= start!17852 b!87282))

(assert (= start!17852 b!87284))

(declare-fun m!132807 () Bool)

(assert (=> b!87278 m!132807))

(declare-fun m!132809 () Bool)

(assert (=> b!87282 m!132809))

(declare-fun m!132811 () Bool)

(assert (=> b!87272 m!132811))

(declare-fun m!132813 () Bool)

(assert (=> b!87276 m!132813))

(declare-fun m!132815 () Bool)

(assert (=> b!87275 m!132815))

(declare-fun m!132817 () Bool)

(assert (=> b!87280 m!132817))

(declare-fun m!132819 () Bool)

(assert (=> b!87283 m!132819))

(declare-fun m!132821 () Bool)

(assert (=> b!87284 m!132821))

(declare-fun m!132823 () Bool)

(assert (=> start!17852 m!132823))

(declare-fun m!132825 () Bool)

(assert (=> start!17852 m!132825))

(declare-fun m!132827 () Bool)

(assert (=> b!87281 m!132827))

(declare-fun m!132829 () Bool)

(assert (=> b!87281 m!132829))

(declare-fun m!132831 () Bool)

(assert (=> b!87273 m!132831))

(assert (=> b!87273 m!132831))

(declare-fun m!132833 () Bool)

(assert (=> b!87273 m!132833))

(declare-fun m!132835 () Bool)

(assert (=> b!87279 m!132835))

(declare-fun m!132837 () Bool)

(assert (=> b!87277 m!132837))

(push 1)

(assert (not b!87283))

(assert (not start!17852))

(assert (not b!87280))

(assert (not b!87281))

(assert (not b!87276))

(assert (not b!87277))

(assert (not b!87273))

(assert (not b!87282))

(assert (not b!87275))

(assert (not b!87284))

(assert (not b!87272))

(assert (not b!87279))

(assert (not b!87278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

