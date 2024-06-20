; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20110 () Bool)

(assert start!20110)

(declare-fun b!100569 () Bool)

(declare-fun res!82591 () Bool)

(declare-fun e!65783 () Bool)

(assert (=> b!100569 (=> (not res!82591) (not e!65783))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!100569 (= res!82591 (bvslt i!615 nBits!396))))

(declare-fun b!100570 () Bool)

(declare-fun res!82592 () Bool)

(declare-fun e!65790 () Bool)

(assert (=> b!100570 (=> (not res!82592) (not e!65790))))

(declare-datatypes ((array!4728 0))(
  ( (array!4729 (arr!2751 (Array (_ BitVec 32) (_ BitVec 8))) (size!2158 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3790 0))(
  ( (BitStream!3791 (buf!2515 array!4728) (currentByte!4970 (_ BitVec 32)) (currentBit!4965 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3790)

(declare-datatypes ((Unit!6164 0))(
  ( (Unit!6165) )
))
(declare-datatypes ((tuple2!8116 0))(
  ( (tuple2!8117 (_1!4313 Unit!6164) (_2!4313 BitStream!3790)) )
))
(declare-fun lt!145740 () tuple2!8116)

(declare-fun isPrefixOf!0 (BitStream!3790 BitStream!3790) Bool)

(assert (=> b!100570 (= res!82592 (isPrefixOf!0 thiss!1305 (_2!4313 lt!145740)))))

(declare-fun b!100571 () Bool)

(declare-fun res!82590 () Bool)

(assert (=> b!100571 (=> (not res!82590) (not e!65783))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100571 (= res!82590 (validate_offset_bits!1 ((_ sign_extend 32) (size!2158 (buf!2515 thiss!1305))) ((_ sign_extend 32) (currentByte!4970 thiss!1305)) ((_ sign_extend 32) (currentBit!4965 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!100572 () Bool)

(declare-fun e!65789 () Bool)

(declare-fun array_inv!1960 (array!4728) Bool)

(assert (=> b!100572 (= e!65789 (array_inv!1960 (buf!2515 thiss!1305)))))

(declare-fun b!100573 () Bool)

(declare-fun res!82589 () Bool)

(declare-fun e!65785 () Bool)

(assert (=> b!100573 (=> (not res!82589) (not e!65785))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100573 (= res!82589 (invariant!0 (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305) (size!2158 (buf!2515 (_2!4313 lt!145740)))))))

(declare-fun b!100574 () Bool)

(declare-fun e!65784 () Bool)

(assert (=> b!100574 (= e!65790 e!65784)))

(declare-fun res!82588 () Bool)

(assert (=> b!100574 (=> (not res!82588) (not e!65784))))

(declare-datatypes ((tuple2!8118 0))(
  ( (tuple2!8119 (_1!4314 BitStream!3790) (_2!4314 Bool)) )
))
(declare-fun lt!145739 () tuple2!8118)

(declare-fun lt!145733 () Bool)

(assert (=> b!100574 (= res!82588 (and (= (_2!4314 lt!145739) lt!145733) (= (_1!4314 lt!145739) (_2!4313 lt!145740))))))

(declare-fun readBitPure!0 (BitStream!3790) tuple2!8118)

(declare-fun readerFrom!0 (BitStream!3790 (_ BitVec 32) (_ BitVec 32)) BitStream!3790)

(assert (=> b!100574 (= lt!145739 (readBitPure!0 (readerFrom!0 (_2!4313 lt!145740) (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305))))))

(declare-fun b!100575 () Bool)

(declare-fun e!65786 () Bool)

(declare-fun lt!145736 () tuple2!8118)

(declare-fun lt!145737 () tuple2!8118)

(assert (=> b!100575 (= e!65786 (= (_2!4314 lt!145736) (_2!4314 lt!145737)))))

(declare-fun b!100576 () Bool)

(declare-fun res!82585 () Bool)

(assert (=> b!100576 (=> (not res!82585) (not e!65783))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100576 (= res!82585 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!100577 () Bool)

(declare-datatypes ((tuple2!8120 0))(
  ( (tuple2!8121 (_1!4315 BitStream!3790) (_2!4315 BitStream!3790)) )
))
(declare-fun lt!145743 () tuple2!8120)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100577 (= e!65783 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4315 lt!145743)))) ((_ sign_extend 32) (currentByte!4970 (_1!4315 lt!145743))) ((_ sign_extend 32) (currentBit!4965 (_1!4315 lt!145743))))))))

(declare-fun lt!145744 () tuple2!8120)

(declare-fun lt!145741 () tuple2!8116)

(declare-fun reader!0 (BitStream!3790 BitStream!3790) tuple2!8120)

(assert (=> b!100577 (= lt!145744 (reader!0 (_2!4313 lt!145740) (_2!4313 lt!145741)))))

(assert (=> b!100577 (= lt!145743 (reader!0 thiss!1305 (_2!4313 lt!145741)))))

(assert (=> b!100577 e!65786))

(declare-fun res!82587 () Bool)

(assert (=> b!100577 (=> (not res!82587) (not e!65786))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100577 (= res!82587 (= (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!145736))) (currentByte!4970 (_1!4314 lt!145736)) (currentBit!4965 (_1!4314 lt!145736))) (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!145737))) (currentByte!4970 (_1!4314 lt!145737)) (currentBit!4965 (_1!4314 lt!145737)))))))

(declare-fun lt!145738 () Unit!6164)

(declare-fun lt!145735 () BitStream!3790)

(declare-fun readBitPrefixLemma!0 (BitStream!3790 BitStream!3790) Unit!6164)

(assert (=> b!100577 (= lt!145738 (readBitPrefixLemma!0 lt!145735 (_2!4313 lt!145741)))))

(assert (=> b!100577 (= lt!145737 (readBitPure!0 (BitStream!3791 (buf!2515 (_2!4313 lt!145741)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305))))))

(assert (=> b!100577 (= lt!145736 (readBitPure!0 lt!145735))))

(assert (=> b!100577 (= lt!145735 (BitStream!3791 (buf!2515 (_2!4313 lt!145740)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)))))

(assert (=> b!100577 e!65785))

(declare-fun res!82593 () Bool)

(assert (=> b!100577 (=> (not res!82593) (not e!65785))))

(assert (=> b!100577 (= res!82593 (isPrefixOf!0 thiss!1305 (_2!4313 lt!145741)))))

(declare-fun lt!145734 () Unit!6164)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3790 BitStream!3790 BitStream!3790) Unit!6164)

(assert (=> b!100577 (= lt!145734 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4313 lt!145740) (_2!4313 lt!145741)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3790 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8116)

(assert (=> b!100577 (= lt!145741 (appendNLeastSignificantBitsLoop!0 (_2!4313 lt!145740) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65788 () Bool)

(assert (=> b!100577 e!65788))

(declare-fun res!82594 () Bool)

(assert (=> b!100577 (=> (not res!82594) (not e!65788))))

(assert (=> b!100577 (= res!82594 (= (size!2158 (buf!2515 thiss!1305)) (size!2158 (buf!2515 (_2!4313 lt!145740)))))))

(declare-fun appendBit!0 (BitStream!3790 Bool) tuple2!8116)

(assert (=> b!100577 (= lt!145740 (appendBit!0 thiss!1305 lt!145733))))

(assert (=> b!100577 (= lt!145733 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100578 () Bool)

(assert (=> b!100578 (= e!65785 (invariant!0 (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305) (size!2158 (buf!2515 (_2!4313 lt!145741)))))))

(declare-fun b!100580 () Bool)

(assert (=> b!100580 (= e!65788 e!65790)))

(declare-fun res!82586 () Bool)

(assert (=> b!100580 (=> (not res!82586) (not e!65790))))

(declare-fun lt!145732 () (_ BitVec 64))

(declare-fun lt!145742 () (_ BitVec 64))

(assert (=> b!100580 (= res!82586 (= lt!145732 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!145742)))))

(assert (=> b!100580 (= lt!145732 (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145740))) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))))))

(assert (=> b!100580 (= lt!145742 (bitIndex!0 (size!2158 (buf!2515 thiss!1305)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)))))

(declare-fun b!100579 () Bool)

(assert (=> b!100579 (= e!65784 (= (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!145739))) (currentByte!4970 (_1!4314 lt!145739)) (currentBit!4965 (_1!4314 lt!145739))) lt!145732))))

(declare-fun res!82595 () Bool)

(assert (=> start!20110 (=> (not res!82595) (not e!65783))))

(assert (=> start!20110 (= res!82595 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20110 e!65783))

(assert (=> start!20110 true))

(declare-fun inv!12 (BitStream!3790) Bool)

(assert (=> start!20110 (and (inv!12 thiss!1305) e!65789)))

(assert (= (and start!20110 res!82595) b!100571))

(assert (= (and b!100571 res!82590) b!100576))

(assert (= (and b!100576 res!82585) b!100569))

(assert (= (and b!100569 res!82591) b!100577))

(assert (= (and b!100577 res!82594) b!100580))

(assert (= (and b!100580 res!82586) b!100570))

(assert (= (and b!100570 res!82592) b!100574))

(assert (= (and b!100574 res!82588) b!100579))

(assert (= (and b!100577 res!82593) b!100573))

(assert (= (and b!100573 res!82589) b!100578))

(assert (= (and b!100577 res!82587) b!100575))

(assert (= start!20110 b!100572))

(declare-fun m!146179 () Bool)

(assert (=> b!100580 m!146179))

(declare-fun m!146181 () Bool)

(assert (=> b!100580 m!146181))

(declare-fun m!146183 () Bool)

(assert (=> b!100574 m!146183))

(assert (=> b!100574 m!146183))

(declare-fun m!146185 () Bool)

(assert (=> b!100574 m!146185))

(declare-fun m!146187 () Bool)

(assert (=> start!20110 m!146187))

(declare-fun m!146189 () Bool)

(assert (=> b!100570 m!146189))

(declare-fun m!146191 () Bool)

(assert (=> b!100573 m!146191))

(declare-fun m!146193 () Bool)

(assert (=> b!100579 m!146193))

(declare-fun m!146195 () Bool)

(assert (=> b!100571 m!146195))

(declare-fun m!146197 () Bool)

(assert (=> b!100577 m!146197))

(declare-fun m!146199 () Bool)

(assert (=> b!100577 m!146199))

(declare-fun m!146201 () Bool)

(assert (=> b!100577 m!146201))

(declare-fun m!146203 () Bool)

(assert (=> b!100577 m!146203))

(declare-fun m!146205 () Bool)

(assert (=> b!100577 m!146205))

(declare-fun m!146207 () Bool)

(assert (=> b!100577 m!146207))

(declare-fun m!146209 () Bool)

(assert (=> b!100577 m!146209))

(declare-fun m!146211 () Bool)

(assert (=> b!100577 m!146211))

(declare-fun m!146213 () Bool)

(assert (=> b!100577 m!146213))

(declare-fun m!146215 () Bool)

(assert (=> b!100577 m!146215))

(declare-fun m!146217 () Bool)

(assert (=> b!100577 m!146217))

(declare-fun m!146219 () Bool)

(assert (=> b!100577 m!146219))

(declare-fun m!146221 () Bool)

(assert (=> b!100578 m!146221))

(declare-fun m!146223 () Bool)

(assert (=> b!100572 m!146223))

(declare-fun m!146225 () Bool)

(assert (=> b!100576 m!146225))

(push 1)

(assert (not b!100570))

(assert (not start!20110))

(assert (not b!100579))

(assert (not b!100572))

(assert (not b!100576))

(assert (not b!100571))

(assert (not b!100573))

(assert (not b!100577))

(assert (not b!100578))

(assert (not b!100574))

(assert (not b!100580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31538 () Bool)

(assert (=> d!31538 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!100576 d!31538))

(declare-fun d!31540 () Bool)

(assert (=> d!31540 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305) (size!2158 (buf!2515 thiss!1305))))))

(declare-fun bs!7727 () Bool)

(assert (= bs!7727 d!31540))

(declare-fun m!146337 () Bool)

(assert (=> bs!7727 m!146337))

(assert (=> start!20110 d!31540))

(declare-fun d!31542 () Bool)

(declare-fun res!82692 () Bool)

(declare-fun e!65857 () Bool)

(assert (=> d!31542 (=> (not res!82692) (not e!65857))))

(assert (=> d!31542 (= res!82692 (= (size!2158 (buf!2515 thiss!1305)) (size!2158 (buf!2515 (_2!4313 lt!145740)))))))

(assert (=> d!31542 (= (isPrefixOf!0 thiss!1305 (_2!4313 lt!145740)) e!65857)))

(declare-fun b!100681 () Bool)

(declare-fun res!82693 () Bool)

(assert (=> b!100681 (=> (not res!82693) (not e!65857))))

(assert (=> b!100681 (= res!82693 (bvsle (bitIndex!0 (size!2158 (buf!2515 thiss!1305)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)) (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145740))) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740)))))))

(declare-fun b!100682 () Bool)

(declare-fun e!65858 () Bool)

(assert (=> b!100682 (= e!65857 e!65858)))

(declare-fun res!82691 () Bool)

(assert (=> b!100682 (=> res!82691 e!65858)))

(assert (=> b!100682 (= res!82691 (= (size!2158 (buf!2515 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100683 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4728 array!4728 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100683 (= e!65858 (arrayBitRangesEq!0 (buf!2515 thiss!1305) (buf!2515 (_2!4313 lt!145740)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2158 (buf!2515 thiss!1305)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305))))))

(assert (= (and d!31542 res!82692) b!100681))

(assert (= (and b!100681 res!82693) b!100682))

(assert (= (and b!100682 (not res!82691)) b!100683))

(assert (=> b!100681 m!146181))

(assert (=> b!100681 m!146179))

(assert (=> b!100683 m!146181))

(assert (=> b!100683 m!146181))

(declare-fun m!146341 () Bool)

(assert (=> b!100683 m!146341))

(assert (=> b!100570 d!31542))

(declare-fun b!100749 () Bool)

(declare-fun e!65899 () tuple2!8116)

(declare-fun lt!146067 () Unit!6164)

(assert (=> b!100749 (= e!65899 (tuple2!8117 lt!146067 (_2!4313 lt!145740)))))

(declare-fun lt!146084 () BitStream!3790)

(assert (=> b!100749 (= lt!146084 (_2!4313 lt!145740))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3790) Unit!6164)

(assert (=> b!100749 (= lt!146067 (lemmaIsPrefixRefl!0 lt!146084))))

(declare-fun call!1258 () Bool)

(assert (=> b!100749 call!1258))

(declare-fun b!100750 () Bool)

(declare-fun res!82750 () Bool)

(declare-fun lt!146058 () tuple2!8116)

(assert (=> b!100750 (= res!82750 (= (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!146058))) (currentByte!4970 (_2!4313 lt!146058)) (currentBit!4965 (_2!4313 lt!146058))) (bvadd (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145740))) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!65894 () Bool)

(assert (=> b!100750 (=> (not res!82750) (not e!65894))))

(declare-fun b!100751 () Bool)

(declare-fun lt!146061 () tuple2!8118)

(assert (=> b!100751 (= lt!146061 (readBitPure!0 (readerFrom!0 (_2!4313 lt!146058) (currentBit!4965 (_2!4313 lt!145740)) (currentByte!4970 (_2!4313 lt!145740)))))))

(declare-fun lt!146092 () Bool)

(declare-fun res!82747 () Bool)

(assert (=> b!100751 (= res!82747 (and (= (_2!4314 lt!146061) lt!146092) (= (_1!4314 lt!146061) (_2!4313 lt!146058))))))

(declare-fun e!65900 () Bool)

(assert (=> b!100751 (=> (not res!82747) (not e!65900))))

(assert (=> b!100751 (= e!65894 e!65900)))

(declare-fun b!100752 () Bool)

(declare-fun res!82749 () Bool)

(declare-fun e!65895 () Bool)

(assert (=> b!100752 (=> (not res!82749) (not e!65895))))

(declare-fun lt!146081 () (_ BitVec 64))

(declare-fun lt!146074 () tuple2!8116)

(declare-fun lt!146077 () (_ BitVec 64))

(assert (=> b!100752 (= res!82749 (= (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!146074))) (currentByte!4970 (_2!4313 lt!146074)) (currentBit!4965 (_2!4313 lt!146074))) (bvadd lt!146077 lt!146081)))))

(assert (=> b!100752 (or (not (= (bvand lt!146077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146081 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!146077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!146077 lt!146081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100752 (= lt!146081 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100752 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100752 (= lt!146077 (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145740))) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))))))

(declare-fun b!100753 () Bool)

(declare-fun e!65898 () Bool)

(declare-fun lt!146087 () (_ BitVec 64))

(assert (=> b!100753 (= e!65898 (validate_offset_bits!1 ((_ sign_extend 32) (size!2158 (buf!2515 (_2!4313 lt!145740)))) ((_ sign_extend 32) (currentByte!4970 (_2!4313 lt!145740))) ((_ sign_extend 32) (currentBit!4965 (_2!4313 lt!145740))) lt!146087))))

(declare-fun b!100754 () Bool)

(declare-fun e!65896 () (_ BitVec 64))

(assert (=> b!100754 (= e!65896 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!100755 () Bool)

(declare-fun res!82746 () Bool)

(assert (=> b!100755 (= res!82746 (isPrefixOf!0 (_2!4313 lt!145740) (_2!4313 lt!146058)))))

(assert (=> b!100755 (=> (not res!82746) (not e!65894))))

(declare-fun b!100756 () Bool)

(declare-fun lt!146066 () tuple2!8116)

(declare-fun Unit!6170 () Unit!6164)

(assert (=> b!100756 (= e!65899 (tuple2!8117 Unit!6170 (_2!4313 lt!146066)))))

(assert (=> b!100756 (= lt!146092 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100756 (= lt!146058 (appendBit!0 (_2!4313 lt!145740) lt!146092))))

(declare-fun res!82753 () Bool)

(assert (=> b!100756 (= res!82753 (= (size!2158 (buf!2515 (_2!4313 lt!145740))) (size!2158 (buf!2515 (_2!4313 lt!146058)))))))

(assert (=> b!100756 (=> (not res!82753) (not e!65894))))

(assert (=> b!100756 e!65894))

(declare-fun lt!146080 () tuple2!8116)

(assert (=> b!100756 (= lt!146080 lt!146058)))

(assert (=> b!100756 (= lt!146066 (appendNLeastSignificantBitsLoop!0 (_2!4313 lt!146080) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!146071 () Unit!6164)

(assert (=> b!100756 (= lt!146071 (lemmaIsPrefixTransitive!0 (_2!4313 lt!145740) (_2!4313 lt!146080) (_2!4313 lt!146066)))))

(assert (=> b!100756 call!1258))

(declare-fun lt!146059 () Unit!6164)

(assert (=> b!100756 (= lt!146059 lt!146071)))

(assert (=> b!100756 (invariant!0 (currentBit!4965 (_2!4313 lt!145740)) (currentByte!4970 (_2!4313 lt!145740)) (size!2158 (buf!2515 (_2!4313 lt!146080))))))

(declare-fun lt!146060 () BitStream!3790)

(assert (=> b!100756 (= lt!146060 (BitStream!3791 (buf!2515 (_2!4313 lt!146080)) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))))))

(assert (=> b!100756 (invariant!0 (currentBit!4965 lt!146060) (currentByte!4970 lt!146060) (size!2158 (buf!2515 (_2!4313 lt!146066))))))

(declare-fun lt!146057 () BitStream!3790)

(assert (=> b!100756 (= lt!146057 (BitStream!3791 (buf!2515 (_2!4313 lt!146066)) (currentByte!4970 lt!146060) (currentBit!4965 lt!146060)))))

(declare-fun lt!146085 () tuple2!8118)

(assert (=> b!100756 (= lt!146085 (readBitPure!0 lt!146060))))

(declare-fun lt!146082 () tuple2!8118)

(assert (=> b!100756 (= lt!146082 (readBitPure!0 lt!146057))))

(declare-fun lt!146079 () Unit!6164)

(assert (=> b!100756 (= lt!146079 (readBitPrefixLemma!0 lt!146060 (_2!4313 lt!146066)))))

(declare-fun res!82754 () Bool)

(assert (=> b!100756 (= res!82754 (= (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!146085))) (currentByte!4970 (_1!4314 lt!146085)) (currentBit!4965 (_1!4314 lt!146085))) (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!146082))) (currentByte!4970 (_1!4314 lt!146082)) (currentBit!4965 (_1!4314 lt!146082)))))))

(declare-fun e!65897 () Bool)

(assert (=> b!100756 (=> (not res!82754) (not e!65897))))

(assert (=> b!100756 e!65897))

(declare-fun lt!146073 () Unit!6164)

(assert (=> b!100756 (= lt!146073 lt!146079)))

(declare-fun lt!146088 () tuple2!8120)

(assert (=> b!100756 (= lt!146088 (reader!0 (_2!4313 lt!145740) (_2!4313 lt!146066)))))

(declare-fun lt!146064 () tuple2!8120)

(assert (=> b!100756 (= lt!146064 (reader!0 (_2!4313 lt!146080) (_2!4313 lt!146066)))))

(declare-fun lt!146053 () tuple2!8118)

(assert (=> b!100756 (= lt!146053 (readBitPure!0 (_1!4315 lt!146088)))))

(assert (=> b!100756 (= (_2!4314 lt!146053) lt!146092)))

(declare-fun lt!146072 () Unit!6164)

(declare-fun Unit!6171 () Unit!6164)

(assert (=> b!100756 (= lt!146072 Unit!6171)))

(declare-fun lt!146052 () (_ BitVec 64))

(assert (=> b!100756 (= lt!146052 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!146089 () (_ BitVec 64))

(assert (=> b!100756 (= lt!146089 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!146091 () Unit!6164)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3790 array!4728 (_ BitVec 64)) Unit!6164)

(assert (=> b!100756 (= lt!146091 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4313 lt!145740) (buf!2515 (_2!4313 lt!146066)) lt!146089))))

(assert (=> b!100756 (validate_offset_bits!1 ((_ sign_extend 32) (size!2158 (buf!2515 (_2!4313 lt!146066)))) ((_ sign_extend 32) (currentByte!4970 (_2!4313 lt!145740))) ((_ sign_extend 32) (currentBit!4965 (_2!4313 lt!145740))) lt!146089)))

(declare-fun lt!146048 () Unit!6164)

(assert (=> b!100756 (= lt!146048 lt!146091)))

(declare-datatypes ((tuple2!8134 0))(
  ( (tuple2!8135 (_1!4322 BitStream!3790) (_2!4322 (_ BitVec 64))) )
))
(declare-fun lt!146056 () tuple2!8134)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8134)

(assert (=> b!100756 (= lt!146056 (readNLeastSignificantBitsLoopPure!0 (_1!4315 lt!146088) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146052))))

(declare-fun lt!146083 () (_ BitVec 64))

(assert (=> b!100756 (= lt!146083 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!146051 () Unit!6164)

(assert (=> b!100756 (= lt!146051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4313 lt!146080) (buf!2515 (_2!4313 lt!146066)) lt!146083))))

(assert (=> b!100756 (validate_offset_bits!1 ((_ sign_extend 32) (size!2158 (buf!2515 (_2!4313 lt!146066)))) ((_ sign_extend 32) (currentByte!4970 (_2!4313 lt!146080))) ((_ sign_extend 32) (currentBit!4965 (_2!4313 lt!146080))) lt!146083)))

(declare-fun lt!146065 () Unit!6164)

(assert (=> b!100756 (= lt!146065 lt!146051)))

(declare-fun lt!146049 () tuple2!8134)

(assert (=> b!100756 (= lt!146049 (readNLeastSignificantBitsLoopPure!0 (_1!4315 lt!146064) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!146052 (ite (_2!4314 lt!146053) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!146090 () tuple2!8134)

(assert (=> b!100756 (= lt!146090 (readNLeastSignificantBitsLoopPure!0 (_1!4315 lt!146088) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146052))))

(declare-fun c!6304 () Bool)

(assert (=> b!100756 (= c!6304 (_2!4314 (readBitPure!0 (_1!4315 lt!146088))))))

(declare-fun lt!146063 () tuple2!8134)

(declare-fun withMovedBitIndex!0 (BitStream!3790 (_ BitVec 64)) BitStream!3790)

(assert (=> b!100756 (= lt!146063 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4315 lt!146088) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!146052 e!65896)))))

(declare-fun lt!146069 () Unit!6164)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6164)

(assert (=> b!100756 (= lt!146069 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4315 lt!146088) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146052))))

(assert (=> b!100756 (and (= (_2!4322 lt!146090) (_2!4322 lt!146063)) (= (_1!4322 lt!146090) (_1!4322 lt!146063)))))

(declare-fun lt!146068 () Unit!6164)

(assert (=> b!100756 (= lt!146068 lt!146069)))

(assert (=> b!100756 (= (_1!4315 lt!146088) (withMovedBitIndex!0 (_2!4315 lt!146088) (bvsub (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145740))) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))) (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!146066))) (currentByte!4970 (_2!4313 lt!146066)) (currentBit!4965 (_2!4313 lt!146066))))))))

(declare-fun lt!146086 () Unit!6164)

(declare-fun Unit!6172 () Unit!6164)

(assert (=> b!100756 (= lt!146086 Unit!6172)))

(assert (=> b!100756 (= (_1!4315 lt!146064) (withMovedBitIndex!0 (_2!4315 lt!146064) (bvsub (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!146080))) (currentByte!4970 (_2!4313 lt!146080)) (currentBit!4965 (_2!4313 lt!146080))) (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!146066))) (currentByte!4970 (_2!4313 lt!146066)) (currentBit!4965 (_2!4313 lt!146066))))))))

(declare-fun lt!146050 () Unit!6164)

(declare-fun Unit!6173 () Unit!6164)

(assert (=> b!100756 (= lt!146050 Unit!6173)))

(assert (=> b!100756 (= (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145740))) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))) (bvsub (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!146080))) (currentByte!4970 (_2!4313 lt!146080)) (currentBit!4965 (_2!4313 lt!146080))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!146070 () Unit!6164)

(declare-fun Unit!6174 () Unit!6164)

(assert (=> b!100756 (= lt!146070 Unit!6174)))

(assert (=> b!100756 (= (_2!4322 lt!146056) (_2!4322 lt!146049))))

(declare-fun lt!146078 () Unit!6164)

(declare-fun Unit!6175 () Unit!6164)

(assert (=> b!100756 (= lt!146078 Unit!6175)))

(assert (=> b!100756 (= (_1!4322 lt!146056) (_2!4315 lt!146088))))

(declare-fun b!100757 () Bool)

(declare-fun res!82752 () Bool)

(assert (=> b!100757 (=> (not res!82752) (not e!65895))))

(assert (=> b!100757 (= res!82752 (isPrefixOf!0 (_2!4313 lt!145740) (_2!4313 lt!146074)))))

(declare-fun b!100758 () Bool)

(assert (=> b!100758 (= e!65897 (= (_2!4314 lt!146085) (_2!4314 lt!146082)))))

(declare-fun c!6305 () Bool)

(declare-fun bm!1255 () Bool)

(assert (=> bm!1255 (= call!1258 (isPrefixOf!0 (ite c!6305 (_2!4313 lt!145740) lt!146084) (ite c!6305 (_2!4313 lt!146066) lt!146084)))))

(declare-fun d!31546 () Bool)

(assert (=> d!31546 e!65895))

(declare-fun res!82751 () Bool)

(assert (=> d!31546 (=> (not res!82751) (not e!65895))))

(assert (=> d!31546 (= res!82751 (= (size!2158 (buf!2515 (_2!4313 lt!145740))) (size!2158 (buf!2515 (_2!4313 lt!146074)))))))

(assert (=> d!31546 (= lt!146074 e!65899)))

(assert (=> d!31546 (= c!6305 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31546 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31546 (= (appendNLeastSignificantBitsLoop!0 (_2!4313 lt!145740) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!146074)))

(declare-fun b!100759 () Bool)

(assert (=> b!100759 (= e!65896 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!100760 () Bool)

(assert (=> b!100760 (= e!65900 (= (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!146061))) (currentByte!4970 (_1!4314 lt!146061)) (currentBit!4965 (_1!4314 lt!146061))) (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!146058))) (currentByte!4970 (_2!4313 lt!146058)) (currentBit!4965 (_2!4313 lt!146058)))))))

(declare-fun lt!146076 () tuple2!8134)

(declare-fun b!100761 () Bool)

(declare-fun lt!146075 () tuple2!8120)

(assert (=> b!100761 (= e!65895 (and (= (_2!4322 lt!146076) v!199) (= (_1!4322 lt!146076) (_2!4315 lt!146075))))))

(declare-fun lt!146054 () (_ BitVec 64))

(assert (=> b!100761 (= lt!146076 (readNLeastSignificantBitsLoopPure!0 (_1!4315 lt!146075) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146054))))

(declare-fun lt!146055 () Unit!6164)

(declare-fun lt!146062 () Unit!6164)

(assert (=> b!100761 (= lt!146055 lt!146062)))

(assert (=> b!100761 (validate_offset_bits!1 ((_ sign_extend 32) (size!2158 (buf!2515 (_2!4313 lt!146074)))) ((_ sign_extend 32) (currentByte!4970 (_2!4313 lt!145740))) ((_ sign_extend 32) (currentBit!4965 (_2!4313 lt!145740))) lt!146087)))

(assert (=> b!100761 (= lt!146062 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4313 lt!145740) (buf!2515 (_2!4313 lt!146074)) lt!146087))))

(assert (=> b!100761 e!65898))

(declare-fun res!82748 () Bool)

(assert (=> b!100761 (=> (not res!82748) (not e!65898))))

(assert (=> b!100761 (= res!82748 (and (= (size!2158 (buf!2515 (_2!4313 lt!145740))) (size!2158 (buf!2515 (_2!4313 lt!146074)))) (bvsge lt!146087 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100761 (= lt!146087 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100761 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100761 (= lt!146054 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!100761 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100761 (= lt!146075 (reader!0 (_2!4313 lt!145740) (_2!4313 lt!146074)))))

(assert (= (and d!31546 c!6305) b!100756))

(assert (= (and d!31546 (not c!6305)) b!100749))

(assert (= (and b!100756 res!82753) b!100750))

(assert (= (and b!100750 res!82750) b!100755))

(assert (= (and b!100755 res!82746) b!100751))

(assert (= (and b!100751 res!82747) b!100760))

(assert (= (and b!100756 res!82754) b!100758))

(assert (= (and b!100756 c!6304) b!100759))

(assert (= (and b!100756 (not c!6304)) b!100754))

(assert (= (or b!100756 b!100749) bm!1255))

(assert (= (and d!31546 res!82751) b!100752))

(assert (= (and b!100752 res!82749) b!100757))

(assert (= (and b!100757 res!82752) b!100761))

(assert (= (and b!100761 res!82748) b!100753))

(declare-fun m!146399 () Bool)

(assert (=> b!100750 m!146399))

(assert (=> b!100750 m!146179))

(declare-fun m!146401 () Bool)

(assert (=> bm!1255 m!146401))

(declare-fun m!146403 () Bool)

(assert (=> b!100757 m!146403))

(declare-fun m!146405 () Bool)

(assert (=> b!100749 m!146405))

(declare-fun m!146407 () Bool)

(assert (=> b!100756 m!146407))

(declare-fun m!146409 () Bool)

(assert (=> b!100756 m!146409))

(declare-fun m!146411 () Bool)

(assert (=> b!100756 m!146411))

(declare-fun m!146413 () Bool)

(assert (=> b!100756 m!146413))

(assert (=> b!100756 m!146409))

(declare-fun m!146415 () Bool)

(assert (=> b!100756 m!146415))

(declare-fun m!146417 () Bool)

(assert (=> b!100756 m!146417))

(declare-fun m!146419 () Bool)

(assert (=> b!100756 m!146419))

(assert (=> b!100756 m!146179))

(declare-fun m!146421 () Bool)

(assert (=> b!100756 m!146421))

(declare-fun m!146423 () Bool)

(assert (=> b!100756 m!146423))

(declare-fun m!146425 () Bool)

(assert (=> b!100756 m!146425))

(declare-fun m!146427 () Bool)

(assert (=> b!100756 m!146427))

(declare-fun m!146429 () Bool)

(assert (=> b!100756 m!146429))

(declare-fun m!146431 () Bool)

(assert (=> b!100756 m!146431))

(declare-fun m!146433 () Bool)

(assert (=> b!100756 m!146433))

(declare-fun m!146435 () Bool)

(assert (=> b!100756 m!146435))

(declare-fun m!146437 () Bool)

(assert (=> b!100756 m!146437))

(declare-fun m!146439 () Bool)

(assert (=> b!100756 m!146439))

(declare-fun m!146441 () Bool)

(assert (=> b!100756 m!146441))

(declare-fun m!146443 () Bool)

(assert (=> b!100756 m!146443))

(declare-fun m!146445 () Bool)

(assert (=> b!100756 m!146445))

(declare-fun m!146447 () Bool)

(assert (=> b!100756 m!146447))

(declare-fun m!146449 () Bool)

(assert (=> b!100756 m!146449))

(declare-fun m!146451 () Bool)

(assert (=> b!100756 m!146451))

(declare-fun m!146453 () Bool)

(assert (=> b!100756 m!146453))

(declare-fun m!146455 () Bool)

(assert (=> b!100756 m!146455))

(declare-fun m!146457 () Bool)

(assert (=> b!100756 m!146457))

(declare-fun m!146459 () Bool)

(assert (=> b!100756 m!146459))

(declare-fun m!146461 () Bool)

(assert (=> b!100755 m!146461))

(declare-fun m!146463 () Bool)

(assert (=> b!100753 m!146463))

(declare-fun m!146465 () Bool)

(assert (=> b!100751 m!146465))

(assert (=> b!100751 m!146465))

(declare-fun m!146467 () Bool)

(assert (=> b!100751 m!146467))

(declare-fun m!146469 () Bool)

(assert (=> b!100752 m!146469))

(assert (=> b!100752 m!146179))

(declare-fun m!146471 () Bool)

(assert (=> b!100760 m!146471))

(assert (=> b!100760 m!146399))

(assert (=> b!100761 m!146441))

(declare-fun m!146473 () Bool)

(assert (=> b!100761 m!146473))

(declare-fun m!146475 () Bool)

(assert (=> b!100761 m!146475))

(declare-fun m!146477 () Bool)

(assert (=> b!100761 m!146477))

(declare-fun m!146479 () Bool)

(assert (=> b!100761 m!146479))

(assert (=> b!100577 d!31546))

(declare-fun d!31576 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31576 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4315 lt!145743)))) ((_ sign_extend 32) (currentByte!4970 (_1!4315 lt!145743))) ((_ sign_extend 32) (currentBit!4965 (_1!4315 lt!145743)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4315 lt!145743)))) ((_ sign_extend 32) (currentByte!4970 (_1!4315 lt!145743))) ((_ sign_extend 32) (currentBit!4965 (_1!4315 lt!145743)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7732 () Bool)

(assert (= bs!7732 d!31576))

(declare-fun m!146481 () Bool)

(assert (=> bs!7732 m!146481))

(assert (=> b!100577 d!31576))

(declare-fun d!31578 () Bool)

(declare-fun res!82756 () Bool)

(declare-fun e!65901 () Bool)

(assert (=> d!31578 (=> (not res!82756) (not e!65901))))

(assert (=> d!31578 (= res!82756 (= (size!2158 (buf!2515 thiss!1305)) (size!2158 (buf!2515 (_2!4313 lt!145741)))))))

(assert (=> d!31578 (= (isPrefixOf!0 thiss!1305 (_2!4313 lt!145741)) e!65901)))

(declare-fun b!100762 () Bool)

(declare-fun res!82757 () Bool)

(assert (=> b!100762 (=> (not res!82757) (not e!65901))))

(assert (=> b!100762 (= res!82757 (bvsle (bitIndex!0 (size!2158 (buf!2515 thiss!1305)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)) (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145741))) (currentByte!4970 (_2!4313 lt!145741)) (currentBit!4965 (_2!4313 lt!145741)))))))

(declare-fun b!100763 () Bool)

(declare-fun e!65902 () Bool)

(assert (=> b!100763 (= e!65901 e!65902)))

(declare-fun res!82755 () Bool)

(assert (=> b!100763 (=> res!82755 e!65902)))

(assert (=> b!100763 (= res!82755 (= (size!2158 (buf!2515 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100764 () Bool)

(assert (=> b!100764 (= e!65902 (arrayBitRangesEq!0 (buf!2515 thiss!1305) (buf!2515 (_2!4313 lt!145741)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2158 (buf!2515 thiss!1305)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305))))))

(assert (= (and d!31578 res!82756) b!100762))

(assert (= (and b!100762 res!82757) b!100763))

(assert (= (and b!100763 (not res!82755)) b!100764))

(assert (=> b!100762 m!146181))

(declare-fun m!146483 () Bool)

(assert (=> b!100762 m!146483))

(assert (=> b!100764 m!146181))

(assert (=> b!100764 m!146181))

(declare-fun m!146485 () Bool)

(assert (=> b!100764 m!146485))

(assert (=> b!100577 d!31578))

(declare-fun d!31580 () Bool)

(assert (=> d!31580 (isPrefixOf!0 thiss!1305 (_2!4313 lt!145741))))

(declare-fun lt!146095 () Unit!6164)

(declare-fun choose!30 (BitStream!3790 BitStream!3790 BitStream!3790) Unit!6164)

(assert (=> d!31580 (= lt!146095 (choose!30 thiss!1305 (_2!4313 lt!145740) (_2!4313 lt!145741)))))

(assert (=> d!31580 (isPrefixOf!0 thiss!1305 (_2!4313 lt!145740))))

(assert (=> d!31580 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4313 lt!145740) (_2!4313 lt!145741)) lt!146095)))

(declare-fun bs!7733 () Bool)

(assert (= bs!7733 d!31580))

(assert (=> bs!7733 m!146199))

(declare-fun m!146487 () Bool)

(assert (=> bs!7733 m!146487))

(assert (=> bs!7733 m!146189))

(assert (=> b!100577 d!31580))

(declare-fun b!100787 () Bool)

(declare-fun res!82774 () Bool)

(declare-fun e!65913 () Bool)

(assert (=> b!100787 (=> (not res!82774) (not e!65913))))

(declare-fun lt!146117 () tuple2!8116)

(assert (=> b!100787 (= res!82774 (isPrefixOf!0 thiss!1305 (_2!4313 lt!146117)))))

(declare-fun b!100789 () Bool)

(declare-fun e!65914 () Bool)

(declare-fun lt!146115 () tuple2!8118)

(assert (=> b!100789 (= e!65914 (= (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!146115))) (currentByte!4970 (_1!4314 lt!146115)) (currentBit!4965 (_1!4314 lt!146115))) (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!146117))) (currentByte!4970 (_2!4313 lt!146117)) (currentBit!4965 (_2!4313 lt!146117)))))))

(declare-fun b!100788 () Bool)

(assert (=> b!100788 (= e!65913 e!65914)))

(declare-fun res!82776 () Bool)

(assert (=> b!100788 (=> (not res!82776) (not e!65914))))

(assert (=> b!100788 (= res!82776 (and (= (_2!4314 lt!146115) lt!145733) (= (_1!4314 lt!146115) (_2!4313 lt!146117))))))

(assert (=> b!100788 (= lt!146115 (readBitPure!0 (readerFrom!0 (_2!4313 lt!146117) (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305))))))

(declare-fun d!31582 () Bool)

(assert (=> d!31582 e!65913))

(declare-fun res!82777 () Bool)

(assert (=> d!31582 (=> (not res!82777) (not e!65913))))

(assert (=> d!31582 (= res!82777 (= (size!2158 (buf!2515 thiss!1305)) (size!2158 (buf!2515 (_2!4313 lt!146117)))))))

(declare-fun choose!16 (BitStream!3790 Bool) tuple2!8116)

(assert (=> d!31582 (= lt!146117 (choose!16 thiss!1305 lt!145733))))

(assert (=> d!31582 (validate_offset_bit!0 ((_ sign_extend 32) (size!2158 (buf!2515 thiss!1305))) ((_ sign_extend 32) (currentByte!4970 thiss!1305)) ((_ sign_extend 32) (currentBit!4965 thiss!1305)))))

(assert (=> d!31582 (= (appendBit!0 thiss!1305 lt!145733) lt!146117)))

(declare-fun b!100786 () Bool)

(declare-fun res!82775 () Bool)

(assert (=> b!100786 (=> (not res!82775) (not e!65913))))

(declare-fun lt!146114 () (_ BitVec 64))

(declare-fun lt!146116 () (_ BitVec 64))

(assert (=> b!100786 (= res!82775 (= (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!146117))) (currentByte!4970 (_2!4313 lt!146117)) (currentBit!4965 (_2!4313 lt!146117))) (bvadd lt!146116 lt!146114)))))

(assert (=> b!100786 (or (not (= (bvand lt!146116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146114 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!146116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!146116 lt!146114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100786 (= lt!146114 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!100786 (= lt!146116 (bitIndex!0 (size!2158 (buf!2515 thiss!1305)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)))))

(assert (= (and d!31582 res!82777) b!100786))

(assert (= (and b!100786 res!82775) b!100787))

(assert (= (and b!100787 res!82774) b!100788))

(assert (= (and b!100788 res!82776) b!100789))

(declare-fun m!146489 () Bool)

(assert (=> b!100787 m!146489))

(declare-fun m!146491 () Bool)

(assert (=> b!100788 m!146491))

(assert (=> b!100788 m!146491))

(declare-fun m!146493 () Bool)

(assert (=> b!100788 m!146493))

(declare-fun m!146495 () Bool)

(assert (=> d!31582 m!146495))

(declare-fun m!146497 () Bool)

(assert (=> d!31582 m!146497))

(declare-fun m!146499 () Bool)

(assert (=> b!100786 m!146499))

(assert (=> b!100786 m!146181))

(declare-fun m!146501 () Bool)

(assert (=> b!100789 m!146501))

(assert (=> b!100789 m!146499))

(assert (=> b!100577 d!31582))

(declare-fun d!31584 () Bool)

(declare-fun e!65925 () Bool)

(assert (=> d!31584 e!65925))

(declare-fun res!82792 () Bool)

(assert (=> d!31584 (=> (not res!82792) (not e!65925))))

(declare-fun lt!146212 () (_ BitVec 64))

(declare-fun lt!146213 () (_ BitVec 64))

(declare-fun lt!146211 () (_ BitVec 64))

(assert (=> d!31584 (= res!82792 (= lt!146211 (bvsub lt!146213 lt!146212)))))

(assert (=> d!31584 (or (= (bvand lt!146213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146213 lt!146212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31584 (= lt!146212 (remainingBits!0 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4314 lt!145737)))) ((_ sign_extend 32) (currentByte!4970 (_1!4314 lt!145737))) ((_ sign_extend 32) (currentBit!4965 (_1!4314 lt!145737)))))))

(declare-fun lt!146214 () (_ BitVec 64))

(declare-fun lt!146215 () (_ BitVec 64))

(assert (=> d!31584 (= lt!146213 (bvmul lt!146214 lt!146215))))

(assert (=> d!31584 (or (= lt!146214 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!146215 (bvsdiv (bvmul lt!146214 lt!146215) lt!146214)))))

(assert (=> d!31584 (= lt!146215 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31584 (= lt!146214 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4314 lt!145737)))))))

(assert (=> d!31584 (= lt!146211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4970 (_1!4314 lt!145737))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4965 (_1!4314 lt!145737)))))))

(assert (=> d!31584 (invariant!0 (currentBit!4965 (_1!4314 lt!145737)) (currentByte!4970 (_1!4314 lt!145737)) (size!2158 (buf!2515 (_1!4314 lt!145737))))))

(assert (=> d!31584 (= (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!145737))) (currentByte!4970 (_1!4314 lt!145737)) (currentBit!4965 (_1!4314 lt!145737))) lt!146211)))

(declare-fun b!100808 () Bool)

(declare-fun res!82793 () Bool)

(assert (=> b!100808 (=> (not res!82793) (not e!65925))))

(assert (=> b!100808 (= res!82793 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!146211))))

(declare-fun b!100809 () Bool)

(declare-fun lt!146210 () (_ BitVec 64))

(assert (=> b!100809 (= e!65925 (bvsle lt!146211 (bvmul lt!146210 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100809 (or (= lt!146210 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!146210 #b0000000000000000000000000000000000000000000000000000000000001000) lt!146210)))))

(assert (=> b!100809 (= lt!146210 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4314 lt!145737)))))))

(assert (= (and d!31584 res!82792) b!100808))

(assert (= (and b!100808 res!82793) b!100809))

(declare-fun m!146503 () Bool)

(assert (=> d!31584 m!146503))

(declare-fun m!146505 () Bool)

(assert (=> d!31584 m!146505))

(assert (=> b!100577 d!31584))

(declare-fun d!31586 () Bool)

(declare-datatypes ((tuple2!8140 0))(
  ( (tuple2!8141 (_1!4325 Bool) (_2!4325 BitStream!3790)) )
))
(declare-fun lt!146218 () tuple2!8140)

(declare-fun readBit!0 (BitStream!3790) tuple2!8140)

(assert (=> d!31586 (= lt!146218 (readBit!0 lt!145735))))

(assert (=> d!31586 (= (readBitPure!0 lt!145735) (tuple2!8119 (_2!4325 lt!146218) (_1!4325 lt!146218)))))

(declare-fun bs!7734 () Bool)

(assert (= bs!7734 d!31586))

(declare-fun m!146507 () Bool)

(assert (=> bs!7734 m!146507))

(assert (=> b!100577 d!31586))

(declare-fun d!31588 () Bool)

(declare-fun e!65928 () Bool)

(assert (=> d!31588 e!65928))

(declare-fun res!82796 () Bool)

(assert (=> d!31588 (=> (not res!82796) (not e!65928))))

(declare-fun lt!146227 () tuple2!8118)

(declare-fun lt!146230 () tuple2!8118)

(assert (=> d!31588 (= res!82796 (= (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!146227))) (currentByte!4970 (_1!4314 lt!146227)) (currentBit!4965 (_1!4314 lt!146227))) (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!146230))) (currentByte!4970 (_1!4314 lt!146230)) (currentBit!4965 (_1!4314 lt!146230)))))))

(declare-fun lt!146229 () BitStream!3790)

(declare-fun lt!146228 () Unit!6164)

(declare-fun choose!50 (BitStream!3790 BitStream!3790 BitStream!3790 tuple2!8118 tuple2!8118 BitStream!3790 Bool tuple2!8118 tuple2!8118 BitStream!3790 Bool) Unit!6164)

(assert (=> d!31588 (= lt!146228 (choose!50 lt!145735 (_2!4313 lt!145741) lt!146229 lt!146227 (tuple2!8119 (_1!4314 lt!146227) (_2!4314 lt!146227)) (_1!4314 lt!146227) (_2!4314 lt!146227) lt!146230 (tuple2!8119 (_1!4314 lt!146230) (_2!4314 lt!146230)) (_1!4314 lt!146230) (_2!4314 lt!146230)))))

(assert (=> d!31588 (= lt!146230 (readBitPure!0 lt!146229))))

(assert (=> d!31588 (= lt!146227 (readBitPure!0 lt!145735))))

(assert (=> d!31588 (= lt!146229 (BitStream!3791 (buf!2515 (_2!4313 lt!145741)) (currentByte!4970 lt!145735) (currentBit!4965 lt!145735)))))

(assert (=> d!31588 (invariant!0 (currentBit!4965 lt!145735) (currentByte!4970 lt!145735) (size!2158 (buf!2515 (_2!4313 lt!145741))))))

(assert (=> d!31588 (= (readBitPrefixLemma!0 lt!145735 (_2!4313 lt!145741)) lt!146228)))

(declare-fun b!100812 () Bool)

(assert (=> b!100812 (= e!65928 (= (_2!4314 lt!146227) (_2!4314 lt!146230)))))

(assert (= (and d!31588 res!82796) b!100812))

(declare-fun m!146509 () Bool)

(assert (=> d!31588 m!146509))

(declare-fun m!146511 () Bool)

(assert (=> d!31588 m!146511))

(declare-fun m!146513 () Bool)

(assert (=> d!31588 m!146513))

(declare-fun m!146515 () Bool)

(assert (=> d!31588 m!146515))

(declare-fun m!146517 () Bool)

(assert (=> d!31588 m!146517))

(assert (=> d!31588 m!146215))

(assert (=> b!100577 d!31588))

(declare-fun b!100875 () Bool)

(declare-fun res!82841 () Bool)

(declare-fun e!65962 () Bool)

(assert (=> b!100875 (=> (not res!82841) (not e!65962))))

(declare-fun lt!146456 () tuple2!8120)

(assert (=> b!100875 (= res!82841 (isPrefixOf!0 (_2!4315 lt!146456) (_2!4313 lt!145741)))))

(declare-fun b!100876 () Bool)

(declare-fun res!82840 () Bool)

(assert (=> b!100876 (=> (not res!82840) (not e!65962))))

(assert (=> b!100876 (= res!82840 (isPrefixOf!0 (_1!4315 lt!146456) thiss!1305))))

(declare-fun d!31590 () Bool)

(assert (=> d!31590 e!65962))

(declare-fun res!82839 () Bool)

(assert (=> d!31590 (=> (not res!82839) (not e!65962))))

(assert (=> d!31590 (= res!82839 (isPrefixOf!0 (_1!4315 lt!146456) (_2!4315 lt!146456)))))

(declare-fun lt!146458 () BitStream!3790)

(assert (=> d!31590 (= lt!146456 (tuple2!8121 lt!146458 (_2!4313 lt!145741)))))

(declare-fun lt!146464 () Unit!6164)

(declare-fun lt!146453 () Unit!6164)

(assert (=> d!31590 (= lt!146464 lt!146453)))

(assert (=> d!31590 (isPrefixOf!0 lt!146458 (_2!4313 lt!145741))))

(assert (=> d!31590 (= lt!146453 (lemmaIsPrefixTransitive!0 lt!146458 (_2!4313 lt!145741) (_2!4313 lt!145741)))))

(declare-fun lt!146469 () Unit!6164)

(declare-fun lt!146463 () Unit!6164)

(assert (=> d!31590 (= lt!146469 lt!146463)))

(assert (=> d!31590 (isPrefixOf!0 lt!146458 (_2!4313 lt!145741))))

(assert (=> d!31590 (= lt!146463 (lemmaIsPrefixTransitive!0 lt!146458 thiss!1305 (_2!4313 lt!145741)))))

(declare-fun lt!146466 () Unit!6164)

(declare-fun e!65961 () Unit!6164)

(assert (=> d!31590 (= lt!146466 e!65961)))

(declare-fun c!6320 () Bool)

(assert (=> d!31590 (= c!6320 (not (= (size!2158 (buf!2515 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!146461 () Unit!6164)

(declare-fun lt!146454 () Unit!6164)

(assert (=> d!31590 (= lt!146461 lt!146454)))

(assert (=> d!31590 (isPrefixOf!0 (_2!4313 lt!145741) (_2!4313 lt!145741))))

(assert (=> d!31590 (= lt!146454 (lemmaIsPrefixRefl!0 (_2!4313 lt!145741)))))

(declare-fun lt!146459 () Unit!6164)

(declare-fun lt!146455 () Unit!6164)

(assert (=> d!31590 (= lt!146459 lt!146455)))

(assert (=> d!31590 (= lt!146455 (lemmaIsPrefixRefl!0 (_2!4313 lt!145741)))))

(declare-fun lt!146467 () Unit!6164)

(declare-fun lt!146462 () Unit!6164)

(assert (=> d!31590 (= lt!146467 lt!146462)))

(assert (=> d!31590 (isPrefixOf!0 lt!146458 lt!146458)))

(assert (=> d!31590 (= lt!146462 (lemmaIsPrefixRefl!0 lt!146458))))

(declare-fun lt!146471 () Unit!6164)

(declare-fun lt!146460 () Unit!6164)

(assert (=> d!31590 (= lt!146471 lt!146460)))

(assert (=> d!31590 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31590 (= lt!146460 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31590 (= lt!146458 (BitStream!3791 (buf!2515 (_2!4313 lt!145741)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)))))

(assert (=> d!31590 (isPrefixOf!0 thiss!1305 (_2!4313 lt!145741))))

(assert (=> d!31590 (= (reader!0 thiss!1305 (_2!4313 lt!145741)) lt!146456)))

(declare-fun b!100877 () Bool)

(declare-fun Unit!6178 () Unit!6164)

(assert (=> b!100877 (= e!65961 Unit!6178)))

(declare-fun b!100878 () Bool)

(declare-fun lt!146452 () Unit!6164)

(assert (=> b!100878 (= e!65961 lt!146452)))

(declare-fun lt!146468 () (_ BitVec 64))

(assert (=> b!100878 (= lt!146468 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!146465 () (_ BitVec 64))

(assert (=> b!100878 (= lt!146465 (bitIndex!0 (size!2158 (buf!2515 thiss!1305)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4728 array!4728 (_ BitVec 64) (_ BitVec 64)) Unit!6164)

(assert (=> b!100878 (= lt!146452 (arrayBitRangesEqSymmetric!0 (buf!2515 thiss!1305) (buf!2515 (_2!4313 lt!145741)) lt!146468 lt!146465))))

(assert (=> b!100878 (arrayBitRangesEq!0 (buf!2515 (_2!4313 lt!145741)) (buf!2515 thiss!1305) lt!146468 lt!146465)))

(declare-fun b!100879 () Bool)

(declare-fun lt!146457 () (_ BitVec 64))

(declare-fun lt!146470 () (_ BitVec 64))

(assert (=> b!100879 (= e!65962 (= (_1!4315 lt!146456) (withMovedBitIndex!0 (_2!4315 lt!146456) (bvsub lt!146457 lt!146470))))))

(assert (=> b!100879 (or (= (bvand lt!146457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146457 lt!146470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100879 (= lt!146470 (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145741))) (currentByte!4970 (_2!4313 lt!145741)) (currentBit!4965 (_2!4313 lt!145741))))))

(assert (=> b!100879 (= lt!146457 (bitIndex!0 (size!2158 (buf!2515 thiss!1305)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)))))

(assert (= (and d!31590 c!6320) b!100878))

(assert (= (and d!31590 (not c!6320)) b!100877))

(assert (= (and d!31590 res!82839) b!100876))

(assert (= (and b!100876 res!82840) b!100875))

(assert (= (and b!100875 res!82841) b!100879))

(declare-fun m!146677 () Bool)

(assert (=> b!100876 m!146677))

(declare-fun m!146681 () Bool)

(assert (=> b!100879 m!146681))

(assert (=> b!100879 m!146483))

(assert (=> b!100879 m!146181))

(declare-fun m!146687 () Bool)

(assert (=> d!31590 m!146687))

(declare-fun m!146691 () Bool)

(assert (=> d!31590 m!146691))

(declare-fun m!146693 () Bool)

(assert (=> d!31590 m!146693))

(declare-fun m!146695 () Bool)

(assert (=> d!31590 m!146695))

(declare-fun m!146697 () Bool)

(assert (=> d!31590 m!146697))

(declare-fun m!146699 () Bool)

(assert (=> d!31590 m!146699))

(declare-fun m!146701 () Bool)

(assert (=> d!31590 m!146701))

(assert (=> d!31590 m!146199))

(declare-fun m!146703 () Bool)

(assert (=> d!31590 m!146703))

(declare-fun m!146705 () Bool)

(assert (=> d!31590 m!146705))

(declare-fun m!146707 () Bool)

(assert (=> d!31590 m!146707))

(declare-fun m!146709 () Bool)

(assert (=> b!100875 m!146709))

(assert (=> b!100878 m!146181))

(declare-fun m!146711 () Bool)

(assert (=> b!100878 m!146711))

(declare-fun m!146713 () Bool)

(assert (=> b!100878 m!146713))

(assert (=> b!100577 d!31590))

(declare-fun d!31598 () Bool)

(declare-fun lt!146472 () tuple2!8140)

(assert (=> d!31598 (= lt!146472 (readBit!0 (BitStream!3791 (buf!2515 (_2!4313 lt!145741)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305))))))

(assert (=> d!31598 (= (readBitPure!0 (BitStream!3791 (buf!2515 (_2!4313 lt!145741)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305))) (tuple2!8119 (_2!4325 lt!146472) (_1!4325 lt!146472)))))

(declare-fun bs!7736 () Bool)

(assert (= bs!7736 d!31598))

(declare-fun m!146715 () Bool)

(assert (=> bs!7736 m!146715))

(assert (=> b!100577 d!31598))

(declare-fun d!31600 () Bool)

(declare-fun e!65963 () Bool)

(assert (=> d!31600 e!65963))

(declare-fun res!82842 () Bool)

(assert (=> d!31600 (=> (not res!82842) (not e!65963))))

(declare-fun lt!146475 () (_ BitVec 64))

(declare-fun lt!146474 () (_ BitVec 64))

(declare-fun lt!146476 () (_ BitVec 64))

(assert (=> d!31600 (= res!82842 (= lt!146474 (bvsub lt!146476 lt!146475)))))

(assert (=> d!31600 (or (= (bvand lt!146476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146476 lt!146475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31600 (= lt!146475 (remainingBits!0 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4314 lt!145736)))) ((_ sign_extend 32) (currentByte!4970 (_1!4314 lt!145736))) ((_ sign_extend 32) (currentBit!4965 (_1!4314 lt!145736)))))))

(declare-fun lt!146477 () (_ BitVec 64))

(declare-fun lt!146478 () (_ BitVec 64))

(assert (=> d!31600 (= lt!146476 (bvmul lt!146477 lt!146478))))

(assert (=> d!31600 (or (= lt!146477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!146478 (bvsdiv (bvmul lt!146477 lt!146478) lt!146477)))))

(assert (=> d!31600 (= lt!146478 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31600 (= lt!146477 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4314 lt!145736)))))))

(assert (=> d!31600 (= lt!146474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4970 (_1!4314 lt!145736))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4965 (_1!4314 lt!145736)))))))

(assert (=> d!31600 (invariant!0 (currentBit!4965 (_1!4314 lt!145736)) (currentByte!4970 (_1!4314 lt!145736)) (size!2158 (buf!2515 (_1!4314 lt!145736))))))

(assert (=> d!31600 (= (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!145736))) (currentByte!4970 (_1!4314 lt!145736)) (currentBit!4965 (_1!4314 lt!145736))) lt!146474)))

(declare-fun b!100880 () Bool)

(declare-fun res!82843 () Bool)

(assert (=> b!100880 (=> (not res!82843) (not e!65963))))

(assert (=> b!100880 (= res!82843 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!146474))))

(declare-fun b!100881 () Bool)

(declare-fun lt!146473 () (_ BitVec 64))

(assert (=> b!100881 (= e!65963 (bvsle lt!146474 (bvmul lt!146473 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100881 (or (= lt!146473 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!146473 #b0000000000000000000000000000000000000000000000000000000000001000) lt!146473)))))

(assert (=> b!100881 (= lt!146473 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4314 lt!145736)))))))

(assert (= (and d!31600 res!82842) b!100880))

(assert (= (and b!100880 res!82843) b!100881))

(declare-fun m!146717 () Bool)

(assert (=> d!31600 m!146717))

(declare-fun m!146719 () Bool)

(assert (=> d!31600 m!146719))

(assert (=> b!100577 d!31600))

(declare-fun b!100882 () Bool)

(declare-fun res!82846 () Bool)

(declare-fun e!65965 () Bool)

(assert (=> b!100882 (=> (not res!82846) (not e!65965))))

(declare-fun lt!146483 () tuple2!8120)

(assert (=> b!100882 (= res!82846 (isPrefixOf!0 (_2!4315 lt!146483) (_2!4313 lt!145741)))))

(declare-fun b!100883 () Bool)

(declare-fun res!82845 () Bool)

(assert (=> b!100883 (=> (not res!82845) (not e!65965))))

(assert (=> b!100883 (= res!82845 (isPrefixOf!0 (_1!4315 lt!146483) (_2!4313 lt!145740)))))

(declare-fun d!31602 () Bool)

(assert (=> d!31602 e!65965))

(declare-fun res!82844 () Bool)

(assert (=> d!31602 (=> (not res!82844) (not e!65965))))

(assert (=> d!31602 (= res!82844 (isPrefixOf!0 (_1!4315 lt!146483) (_2!4315 lt!146483)))))

(declare-fun lt!146485 () BitStream!3790)

(assert (=> d!31602 (= lt!146483 (tuple2!8121 lt!146485 (_2!4313 lt!145741)))))

(declare-fun lt!146491 () Unit!6164)

(declare-fun lt!146480 () Unit!6164)

(assert (=> d!31602 (= lt!146491 lt!146480)))

(assert (=> d!31602 (isPrefixOf!0 lt!146485 (_2!4313 lt!145741))))

(assert (=> d!31602 (= lt!146480 (lemmaIsPrefixTransitive!0 lt!146485 (_2!4313 lt!145741) (_2!4313 lt!145741)))))

(declare-fun lt!146496 () Unit!6164)

(declare-fun lt!146490 () Unit!6164)

(assert (=> d!31602 (= lt!146496 lt!146490)))

(assert (=> d!31602 (isPrefixOf!0 lt!146485 (_2!4313 lt!145741))))

(assert (=> d!31602 (= lt!146490 (lemmaIsPrefixTransitive!0 lt!146485 (_2!4313 lt!145740) (_2!4313 lt!145741)))))

(declare-fun lt!146493 () Unit!6164)

(declare-fun e!65964 () Unit!6164)

(assert (=> d!31602 (= lt!146493 e!65964)))

(declare-fun c!6321 () Bool)

(assert (=> d!31602 (= c!6321 (not (= (size!2158 (buf!2515 (_2!4313 lt!145740))) #b00000000000000000000000000000000)))))

(declare-fun lt!146488 () Unit!6164)

(declare-fun lt!146481 () Unit!6164)

(assert (=> d!31602 (= lt!146488 lt!146481)))

(assert (=> d!31602 (isPrefixOf!0 (_2!4313 lt!145741) (_2!4313 lt!145741))))

(assert (=> d!31602 (= lt!146481 (lemmaIsPrefixRefl!0 (_2!4313 lt!145741)))))

(declare-fun lt!146486 () Unit!6164)

(declare-fun lt!146482 () Unit!6164)

(assert (=> d!31602 (= lt!146486 lt!146482)))

(assert (=> d!31602 (= lt!146482 (lemmaIsPrefixRefl!0 (_2!4313 lt!145741)))))

(declare-fun lt!146494 () Unit!6164)

(declare-fun lt!146489 () Unit!6164)

(assert (=> d!31602 (= lt!146494 lt!146489)))

(assert (=> d!31602 (isPrefixOf!0 lt!146485 lt!146485)))

(assert (=> d!31602 (= lt!146489 (lemmaIsPrefixRefl!0 lt!146485))))

(declare-fun lt!146498 () Unit!6164)

(declare-fun lt!146487 () Unit!6164)

(assert (=> d!31602 (= lt!146498 lt!146487)))

(assert (=> d!31602 (isPrefixOf!0 (_2!4313 lt!145740) (_2!4313 lt!145740))))

(assert (=> d!31602 (= lt!146487 (lemmaIsPrefixRefl!0 (_2!4313 lt!145740)))))

(assert (=> d!31602 (= lt!146485 (BitStream!3791 (buf!2515 (_2!4313 lt!145741)) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))))))

(assert (=> d!31602 (isPrefixOf!0 (_2!4313 lt!145740) (_2!4313 lt!145741))))

(assert (=> d!31602 (= (reader!0 (_2!4313 lt!145740) (_2!4313 lt!145741)) lt!146483)))

(declare-fun b!100884 () Bool)

(declare-fun Unit!6184 () Unit!6164)

(assert (=> b!100884 (= e!65964 Unit!6184)))

(declare-fun b!100885 () Bool)

(declare-fun lt!146479 () Unit!6164)

(assert (=> b!100885 (= e!65964 lt!146479)))

(declare-fun lt!146495 () (_ BitVec 64))

(assert (=> b!100885 (= lt!146495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!146492 () (_ BitVec 64))

(assert (=> b!100885 (= lt!146492 (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145740))) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))))))

(assert (=> b!100885 (= lt!146479 (arrayBitRangesEqSymmetric!0 (buf!2515 (_2!4313 lt!145740)) (buf!2515 (_2!4313 lt!145741)) lt!146495 lt!146492))))

(assert (=> b!100885 (arrayBitRangesEq!0 (buf!2515 (_2!4313 lt!145741)) (buf!2515 (_2!4313 lt!145740)) lt!146495 lt!146492)))

(declare-fun lt!146497 () (_ BitVec 64))

(declare-fun lt!146484 () (_ BitVec 64))

(declare-fun b!100886 () Bool)

(assert (=> b!100886 (= e!65965 (= (_1!4315 lt!146483) (withMovedBitIndex!0 (_2!4315 lt!146483) (bvsub lt!146484 lt!146497))))))

(assert (=> b!100886 (or (= (bvand lt!146484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146497 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146484 lt!146497) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100886 (= lt!146497 (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145741))) (currentByte!4970 (_2!4313 lt!145741)) (currentBit!4965 (_2!4313 lt!145741))))))

(assert (=> b!100886 (= lt!146484 (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145740))) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))))))

(assert (= (and d!31602 c!6321) b!100885))

(assert (= (and d!31602 (not c!6321)) b!100884))

(assert (= (and d!31602 res!82844) b!100883))

(assert (= (and b!100883 res!82845) b!100882))

(assert (= (and b!100882 res!82846) b!100886))

(declare-fun m!146721 () Bool)

(assert (=> b!100883 m!146721))

(declare-fun m!146723 () Bool)

(assert (=> b!100886 m!146723))

(assert (=> b!100886 m!146483))

(assert (=> b!100886 m!146179))

(declare-fun m!146725 () Bool)

(assert (=> d!31602 m!146725))

(assert (=> d!31602 m!146691))

(declare-fun m!146727 () Bool)

(assert (=> d!31602 m!146727))

(declare-fun m!146729 () Bool)

(assert (=> d!31602 m!146729))

(declare-fun m!146731 () Bool)

(assert (=> d!31602 m!146731))

(declare-fun m!146733 () Bool)

(assert (=> d!31602 m!146733))

(declare-fun m!146735 () Bool)

(assert (=> d!31602 m!146735))

(declare-fun m!146737 () Bool)

(assert (=> d!31602 m!146737))

(declare-fun m!146739 () Bool)

(assert (=> d!31602 m!146739))

(declare-fun m!146741 () Bool)

(assert (=> d!31602 m!146741))

(assert (=> d!31602 m!146707))

(declare-fun m!146743 () Bool)

(assert (=> b!100882 m!146743))

(assert (=> b!100885 m!146179))

(declare-fun m!146745 () Bool)

(assert (=> b!100885 m!146745))

(declare-fun m!146747 () Bool)

(assert (=> b!100885 m!146747))

(assert (=> b!100577 d!31602))

(declare-fun d!31604 () Bool)

(assert (=> d!31604 (= (array_inv!1960 (buf!2515 thiss!1305)) (bvsge (size!2158 (buf!2515 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!100572 d!31604))

(declare-fun d!31606 () Bool)

(assert (=> d!31606 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2158 (buf!2515 thiss!1305))) ((_ sign_extend 32) (currentByte!4970 thiss!1305)) ((_ sign_extend 32) (currentBit!4965 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2158 (buf!2515 thiss!1305))) ((_ sign_extend 32) (currentByte!4970 thiss!1305)) ((_ sign_extend 32) (currentBit!4965 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!7737 () Bool)

(assert (= bs!7737 d!31606))

(declare-fun m!146749 () Bool)

(assert (=> bs!7737 m!146749))

(assert (=> b!100571 d!31606))

(declare-fun d!31608 () Bool)

(assert (=> d!31608 (= (invariant!0 (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305) (size!2158 (buf!2515 (_2!4313 lt!145740)))) (and (bvsge (currentBit!4965 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4965 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4970 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4970 thiss!1305) (size!2158 (buf!2515 (_2!4313 lt!145740)))) (and (= (currentBit!4965 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4970 thiss!1305) (size!2158 (buf!2515 (_2!4313 lt!145740))))))))))

(assert (=> b!100573 d!31608))

(declare-fun d!31610 () Bool)

(assert (=> d!31610 (= (invariant!0 (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305) (size!2158 (buf!2515 (_2!4313 lt!145741)))) (and (bvsge (currentBit!4965 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4965 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4970 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4970 thiss!1305) (size!2158 (buf!2515 (_2!4313 lt!145741)))) (and (= (currentBit!4965 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4970 thiss!1305) (size!2158 (buf!2515 (_2!4313 lt!145741))))))))))

(assert (=> b!100578 d!31610))

(declare-fun d!31612 () Bool)

(declare-fun e!65970 () Bool)

(assert (=> d!31612 e!65970))

(declare-fun res!82853 () Bool)

(assert (=> d!31612 (=> (not res!82853) (not e!65970))))

(declare-fun lt!146542 () (_ BitVec 64))

(declare-fun lt!146541 () (_ BitVec 64))

(declare-fun lt!146540 () (_ BitVec 64))

(assert (=> d!31612 (= res!82853 (= lt!146540 (bvsub lt!146542 lt!146541)))))

(assert (=> d!31612 (or (= (bvand lt!146542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146541 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146542 lt!146541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31612 (= lt!146541 (remainingBits!0 ((_ sign_extend 32) (size!2158 (buf!2515 (_2!4313 lt!145740)))) ((_ sign_extend 32) (currentByte!4970 (_2!4313 lt!145740))) ((_ sign_extend 32) (currentBit!4965 (_2!4313 lt!145740)))))))

(declare-fun lt!146543 () (_ BitVec 64))

(declare-fun lt!146544 () (_ BitVec 64))

(assert (=> d!31612 (= lt!146542 (bvmul lt!146543 lt!146544))))

(assert (=> d!31612 (or (= lt!146543 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!146544 (bvsdiv (bvmul lt!146543 lt!146544) lt!146543)))))

(assert (=> d!31612 (= lt!146544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31612 (= lt!146543 ((_ sign_extend 32) (size!2158 (buf!2515 (_2!4313 lt!145740)))))))

(assert (=> d!31612 (= lt!146540 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4970 (_2!4313 lt!145740))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4965 (_2!4313 lt!145740)))))))

(assert (=> d!31612 (invariant!0 (currentBit!4965 (_2!4313 lt!145740)) (currentByte!4970 (_2!4313 lt!145740)) (size!2158 (buf!2515 (_2!4313 lt!145740))))))

(assert (=> d!31612 (= (bitIndex!0 (size!2158 (buf!2515 (_2!4313 lt!145740))) (currentByte!4970 (_2!4313 lt!145740)) (currentBit!4965 (_2!4313 lt!145740))) lt!146540)))

(declare-fun b!100897 () Bool)

(declare-fun res!82854 () Bool)

(assert (=> b!100897 (=> (not res!82854) (not e!65970))))

(assert (=> b!100897 (= res!82854 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!146540))))

(declare-fun b!100898 () Bool)

(declare-fun lt!146539 () (_ BitVec 64))

(assert (=> b!100898 (= e!65970 (bvsle lt!146540 (bvmul lt!146539 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100898 (or (= lt!146539 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!146539 #b0000000000000000000000000000000000000000000000000000000000001000) lt!146539)))))

(assert (=> b!100898 (= lt!146539 ((_ sign_extend 32) (size!2158 (buf!2515 (_2!4313 lt!145740)))))))

(assert (= (and d!31612 res!82853) b!100897))

(assert (= (and b!100897 res!82854) b!100898))

(declare-fun m!146751 () Bool)

(assert (=> d!31612 m!146751))

(declare-fun m!146753 () Bool)

(assert (=> d!31612 m!146753))

(assert (=> b!100580 d!31612))

(declare-fun d!31614 () Bool)

(declare-fun e!65971 () Bool)

(assert (=> d!31614 e!65971))

(declare-fun res!82855 () Bool)

(assert (=> d!31614 (=> (not res!82855) (not e!65971))))

(declare-fun lt!146548 () (_ BitVec 64))

(declare-fun lt!146547 () (_ BitVec 64))

(declare-fun lt!146546 () (_ BitVec 64))

(assert (=> d!31614 (= res!82855 (= lt!146546 (bvsub lt!146548 lt!146547)))))

(assert (=> d!31614 (or (= (bvand lt!146548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146547 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146548 lt!146547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31614 (= lt!146547 (remainingBits!0 ((_ sign_extend 32) (size!2158 (buf!2515 thiss!1305))) ((_ sign_extend 32) (currentByte!4970 thiss!1305)) ((_ sign_extend 32) (currentBit!4965 thiss!1305))))))

(declare-fun lt!146549 () (_ BitVec 64))

(declare-fun lt!146550 () (_ BitVec 64))

(assert (=> d!31614 (= lt!146548 (bvmul lt!146549 lt!146550))))

(assert (=> d!31614 (or (= lt!146549 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!146550 (bvsdiv (bvmul lt!146549 lt!146550) lt!146549)))))

(assert (=> d!31614 (= lt!146550 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31614 (= lt!146549 ((_ sign_extend 32) (size!2158 (buf!2515 thiss!1305))))))

(assert (=> d!31614 (= lt!146546 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4970 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4965 thiss!1305))))))

(assert (=> d!31614 (invariant!0 (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305) (size!2158 (buf!2515 thiss!1305)))))

(assert (=> d!31614 (= (bitIndex!0 (size!2158 (buf!2515 thiss!1305)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)) lt!146546)))

(declare-fun b!100899 () Bool)

(declare-fun res!82856 () Bool)

(assert (=> b!100899 (=> (not res!82856) (not e!65971))))

(assert (=> b!100899 (= res!82856 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!146546))))

(declare-fun b!100900 () Bool)

(declare-fun lt!146545 () (_ BitVec 64))

(assert (=> b!100900 (= e!65971 (bvsle lt!146546 (bvmul lt!146545 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100900 (or (= lt!146545 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!146545 #b0000000000000000000000000000000000000000000000000000000000001000) lt!146545)))))

(assert (=> b!100900 (= lt!146545 ((_ sign_extend 32) (size!2158 (buf!2515 thiss!1305))))))

(assert (= (and d!31614 res!82855) b!100899))

(assert (= (and b!100899 res!82856) b!100900))

(assert (=> d!31614 m!146749))

(assert (=> d!31614 m!146337))

(assert (=> b!100580 d!31614))

(declare-fun d!31616 () Bool)

(declare-fun e!65972 () Bool)

(assert (=> d!31616 e!65972))

(declare-fun res!82857 () Bool)

(assert (=> d!31616 (=> (not res!82857) (not e!65972))))

(declare-fun lt!146553 () (_ BitVec 64))

(declare-fun lt!146554 () (_ BitVec 64))

(declare-fun lt!146552 () (_ BitVec 64))

(assert (=> d!31616 (= res!82857 (= lt!146552 (bvsub lt!146554 lt!146553)))))

(assert (=> d!31616 (or (= (bvand lt!146554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146554 lt!146553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31616 (= lt!146553 (remainingBits!0 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4314 lt!145739)))) ((_ sign_extend 32) (currentByte!4970 (_1!4314 lt!145739))) ((_ sign_extend 32) (currentBit!4965 (_1!4314 lt!145739)))))))

(declare-fun lt!146555 () (_ BitVec 64))

(declare-fun lt!146556 () (_ BitVec 64))

(assert (=> d!31616 (= lt!146554 (bvmul lt!146555 lt!146556))))

(assert (=> d!31616 (or (= lt!146555 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!146556 (bvsdiv (bvmul lt!146555 lt!146556) lt!146555)))))

(assert (=> d!31616 (= lt!146556 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31616 (= lt!146555 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4314 lt!145739)))))))

(assert (=> d!31616 (= lt!146552 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4970 (_1!4314 lt!145739))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4965 (_1!4314 lt!145739)))))))

(assert (=> d!31616 (invariant!0 (currentBit!4965 (_1!4314 lt!145739)) (currentByte!4970 (_1!4314 lt!145739)) (size!2158 (buf!2515 (_1!4314 lt!145739))))))

(assert (=> d!31616 (= (bitIndex!0 (size!2158 (buf!2515 (_1!4314 lt!145739))) (currentByte!4970 (_1!4314 lt!145739)) (currentBit!4965 (_1!4314 lt!145739))) lt!146552)))

(declare-fun b!100901 () Bool)

(declare-fun res!82858 () Bool)

(assert (=> b!100901 (=> (not res!82858) (not e!65972))))

(assert (=> b!100901 (= res!82858 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!146552))))

(declare-fun b!100902 () Bool)

(declare-fun lt!146551 () (_ BitVec 64))

(assert (=> b!100902 (= e!65972 (bvsle lt!146552 (bvmul lt!146551 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100902 (or (= lt!146551 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!146551 #b0000000000000000000000000000000000000000000000000000000000001000) lt!146551)))))

(assert (=> b!100902 (= lt!146551 ((_ sign_extend 32) (size!2158 (buf!2515 (_1!4314 lt!145739)))))))

(assert (= (and d!31616 res!82857) b!100901))

(assert (= (and b!100901 res!82858) b!100902))

(declare-fun m!146755 () Bool)

(assert (=> d!31616 m!146755))

(declare-fun m!146757 () Bool)

(assert (=> d!31616 m!146757))

(assert (=> b!100579 d!31616))

(declare-fun d!31618 () Bool)

(declare-fun lt!146557 () tuple2!8140)

(assert (=> d!31618 (= lt!146557 (readBit!0 (readerFrom!0 (_2!4313 lt!145740) (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305))))))

(assert (=> d!31618 (= (readBitPure!0 (readerFrom!0 (_2!4313 lt!145740) (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305))) (tuple2!8119 (_2!4325 lt!146557) (_1!4325 lt!146557)))))

(declare-fun bs!7738 () Bool)

(assert (= bs!7738 d!31618))

(assert (=> bs!7738 m!146183))

(declare-fun m!146759 () Bool)

(assert (=> bs!7738 m!146759))

(assert (=> b!100574 d!31618))

(declare-fun d!31620 () Bool)

(declare-fun e!65975 () Bool)

(assert (=> d!31620 e!65975))

(declare-fun res!82862 () Bool)

(assert (=> d!31620 (=> (not res!82862) (not e!65975))))

(assert (=> d!31620 (= res!82862 (invariant!0 (currentBit!4965 (_2!4313 lt!145740)) (currentByte!4970 (_2!4313 lt!145740)) (size!2158 (buf!2515 (_2!4313 lt!145740)))))))

(assert (=> d!31620 (= (readerFrom!0 (_2!4313 lt!145740) (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305)) (BitStream!3791 (buf!2515 (_2!4313 lt!145740)) (currentByte!4970 thiss!1305) (currentBit!4965 thiss!1305)))))

(declare-fun b!100905 () Bool)

(assert (=> b!100905 (= e!65975 (invariant!0 (currentBit!4965 thiss!1305) (currentByte!4970 thiss!1305) (size!2158 (buf!2515 (_2!4313 lt!145740)))))))

(assert (= (and d!31620 res!82862) b!100905))

(assert (=> d!31620 m!146753))

(assert (=> b!100905 m!146191))

(assert (=> b!100574 d!31620))

(push 1)

(assert (not d!31602))

(assert (not d!31606))

(assert (not b!100879))

(assert (not b!100761))

(assert (not b!100750))

(assert (not b!100751))

(assert (not d!31576))

(assert (not b!100749))

(assert (not b!100886))

(assert (not d!31600))

(assert (not b!100875))

(assert (not b!100756))

(assert (not b!100752))

(assert (not d!31580))

(assert (not b!100755))

(assert (not b!100789))

(assert (not d!31598))

(assert (not b!100760))

(assert (not b!100883))

(assert (not b!100753))

(assert (not d!31618))

(assert (not b!100878))

(assert (not d!31586))

(assert (not d!31614))

(assert (not b!100787))

(assert (not b!100683))

(assert (not b!100905))

(assert (not d!31584))

(assert (not d!31582))

(assert (not b!100885))

(assert (not b!100757))

(assert (not b!100882))

(assert (not b!100876))

(assert (not d!31612))

(assert (not bm!1255))

(assert (not d!31588))

(assert (not b!100762))

(assert (not b!100681))

(assert (not d!31540))

(assert (not d!31620))

(assert (not d!31616))

(assert (not d!31590))

(assert (not b!100786))

(assert (not b!100764))

(assert (not b!100788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

