; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39230 () Bool)

(assert start!39230)

(declare-fun b!176418 () Bool)

(declare-fun e!122978 () Bool)

(declare-datatypes ((array!9524 0))(
  ( (array!9525 (arr!5131 (Array (_ BitVec 32) (_ BitVec 8))) (size!4201 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7510 0))(
  ( (BitStream!7511 (buf!4644 array!9524) (currentByte!8797 (_ BitVec 32)) (currentBit!8792 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15182 0))(
  ( (tuple2!15183 (_1!8236 BitStream!7510) (_2!8236 Bool)) )
))
(declare-fun lt!271657 () tuple2!15182)

(declare-fun lt!271655 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176418 (= e!122978 (= (bitIndex!0 (size!4201 (buf!4644 (_1!8236 lt!271657))) (currentByte!8797 (_1!8236 lt!271657)) (currentBit!8792 (_1!8236 lt!271657))) lt!271655))))

(declare-fun b!176419 () Bool)

(declare-fun e!122979 () Bool)

(assert (=> b!176419 (= e!122979 e!122978)))

(declare-fun res!146150 () Bool)

(assert (=> b!176419 (=> (not res!146150) (not e!122978))))

(declare-datatypes ((Unit!12716 0))(
  ( (Unit!12717) )
))
(declare-datatypes ((tuple2!15184 0))(
  ( (tuple2!15185 (_1!8237 Unit!12716) (_2!8237 BitStream!7510)) )
))
(declare-fun lt!271654 () tuple2!15184)

(declare-fun lt!271656 () Bool)

(assert (=> b!176419 (= res!146150 (and (= (_2!8236 lt!271657) lt!271656) (= (_1!8236 lt!271657) (_2!8237 lt!271654))))))

(declare-fun thiss!1204 () BitStream!7510)

(declare-fun readBitPure!0 (BitStream!7510) tuple2!15182)

(declare-fun readerFrom!0 (BitStream!7510 (_ BitVec 32) (_ BitVec 32)) BitStream!7510)

(assert (=> b!176419 (= lt!271657 (readBitPure!0 (readerFrom!0 (_2!8237 lt!271654) (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204))))))

(declare-fun b!176420 () Bool)

(declare-fun e!122980 () Bool)

(declare-fun array_inv!3942 (array!9524) Bool)

(assert (=> b!176420 (= e!122980 (array_inv!3942 (buf!4644 thiss!1204)))))

(declare-fun b!176421 () Bool)

(declare-fun e!122982 () Bool)

(assert (=> b!176421 (= e!122982 e!122979)))

(declare-fun res!146148 () Bool)

(assert (=> b!176421 (=> (not res!146148) (not e!122979))))

(declare-fun lt!271658 () (_ BitVec 64))

(assert (=> b!176421 (= res!146148 (= lt!271655 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271658)))))

(assert (=> b!176421 (= lt!271655 (bitIndex!0 (size!4201 (buf!4644 (_2!8237 lt!271654))) (currentByte!8797 (_2!8237 lt!271654)) (currentBit!8792 (_2!8237 lt!271654))))))

(assert (=> b!176421 (= lt!271658 (bitIndex!0 (size!4201 (buf!4644 thiss!1204)) (currentByte!8797 thiss!1204) (currentBit!8792 thiss!1204)))))

(declare-fun b!176422 () Bool)

(declare-fun e!122983 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176422 (= e!122983 (invariant!0 (currentBit!8792 (_2!8237 lt!271654)) (currentByte!8797 (_2!8237 lt!271654)) (size!4201 (buf!4644 (_2!8237 lt!271654)))))))

(declare-fun res!146144 () Bool)

(declare-fun e!122977 () Bool)

(assert (=> start!39230 (=> (not res!146144) (not e!122977))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39230 (= res!146144 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39230 e!122977))

(assert (=> start!39230 true))

(declare-fun inv!12 (BitStream!7510) Bool)

(assert (=> start!39230 (and (inv!12 thiss!1204) e!122980)))

(declare-fun b!176423 () Bool)

(assert (=> b!176423 (= e!122977 (not e!122983))))

(declare-fun res!146149 () Bool)

(assert (=> b!176423 (=> res!146149 e!122983)))

(assert (=> b!176423 (= res!146149 (not (= (bitIndex!0 (size!4201 (buf!4644 (_2!8237 lt!271654))) (currentByte!8797 (_2!8237 lt!271654)) (currentBit!8792 (_2!8237 lt!271654))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4201 (buf!4644 thiss!1204)) (currentByte!8797 thiss!1204) (currentBit!8792 thiss!1204))))))))

(assert (=> b!176423 e!122982))

(declare-fun res!146151 () Bool)

(assert (=> b!176423 (=> (not res!146151) (not e!122982))))

(assert (=> b!176423 (= res!146151 (= (size!4201 (buf!4644 thiss!1204)) (size!4201 (buf!4644 (_2!8237 lt!271654)))))))

(declare-fun appendBit!0 (BitStream!7510 Bool) tuple2!15184)

(assert (=> b!176423 (= lt!271654 (appendBit!0 thiss!1204 lt!271656))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176423 (= lt!271656 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176424 () Bool)

(declare-fun res!146145 () Bool)

(assert (=> b!176424 (=> (not res!146145) (not e!122977))))

(assert (=> b!176424 (= res!146145 (invariant!0 (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204) (size!4201 (buf!4644 thiss!1204))))))

(declare-fun b!176425 () Bool)

(declare-fun res!146147 () Bool)

(assert (=> b!176425 (=> (not res!146147) (not e!122979))))

(declare-fun isPrefixOf!0 (BitStream!7510 BitStream!7510) Bool)

(assert (=> b!176425 (= res!146147 (isPrefixOf!0 thiss!1204 (_2!8237 lt!271654)))))

(declare-fun b!176426 () Bool)

(declare-fun res!146146 () Bool)

(assert (=> b!176426 (=> (not res!146146) (not e!122977))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176426 (= res!146146 (validate_offset_bits!1 ((_ sign_extend 32) (size!4201 (buf!4644 thiss!1204))) ((_ sign_extend 32) (currentByte!8797 thiss!1204)) ((_ sign_extend 32) (currentBit!8792 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176427 () Bool)

(declare-fun res!146143 () Bool)

(assert (=> b!176427 (=> (not res!146143) (not e!122977))))

(assert (=> b!176427 (= res!146143 (not (= i!590 nBits!348)))))

(assert (= (and start!39230 res!146144) b!176426))

(assert (= (and b!176426 res!146146) b!176424))

(assert (= (and b!176424 res!146145) b!176427))

(assert (= (and b!176427 res!146143) b!176423))

(assert (= (and b!176423 res!146151) b!176421))

(assert (= (and b!176421 res!146148) b!176425))

(assert (= (and b!176425 res!146147) b!176419))

(assert (= (and b!176419 res!146150) b!176418))

(assert (= (and b!176423 (not res!146149)) b!176422))

(assert (= start!39230 b!176420))

(declare-fun m!276529 () Bool)

(assert (=> b!176423 m!276529))

(declare-fun m!276531 () Bool)

(assert (=> b!176423 m!276531))

(declare-fun m!276533 () Bool)

(assert (=> b!176423 m!276533))

(declare-fun m!276535 () Bool)

(assert (=> b!176426 m!276535))

(declare-fun m!276537 () Bool)

(assert (=> b!176422 m!276537))

(assert (=> b!176421 m!276529))

(assert (=> b!176421 m!276531))

(declare-fun m!276539 () Bool)

(assert (=> b!176419 m!276539))

(assert (=> b!176419 m!276539))

(declare-fun m!276541 () Bool)

(assert (=> b!176419 m!276541))

(declare-fun m!276543 () Bool)

(assert (=> b!176424 m!276543))

(declare-fun m!276545 () Bool)

(assert (=> b!176425 m!276545))

(declare-fun m!276547 () Bool)

(assert (=> b!176420 m!276547))

(declare-fun m!276549 () Bool)

(assert (=> b!176418 m!276549))

(declare-fun m!276551 () Bool)

(assert (=> start!39230 m!276551))

(push 1)

(assert (not b!176421))

(assert (not b!176425))

(assert (not b!176423))

(assert (not start!39230))

(assert (not b!176426))

(assert (not b!176424))

(assert (not b!176422))

(assert (not b!176418))

(assert (not b!176420))

(assert (not b!176419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62227 () Bool)

(declare-fun res!146235 () Bool)

(declare-fun e!123043 () Bool)

(assert (=> d!62227 (=> (not res!146235) (not e!123043))))

(assert (=> d!62227 (= res!146235 (= (size!4201 (buf!4644 thiss!1204)) (size!4201 (buf!4644 (_2!8237 lt!271654)))))))

(assert (=> d!62227 (= (isPrefixOf!0 thiss!1204 (_2!8237 lt!271654)) e!123043)))

(declare-fun b!176514 () Bool)

(declare-fun res!146234 () Bool)

(assert (=> b!176514 (=> (not res!146234) (not e!123043))))

(assert (=> b!176514 (= res!146234 (bvsle (bitIndex!0 (size!4201 (buf!4644 thiss!1204)) (currentByte!8797 thiss!1204) (currentBit!8792 thiss!1204)) (bitIndex!0 (size!4201 (buf!4644 (_2!8237 lt!271654))) (currentByte!8797 (_2!8237 lt!271654)) (currentBit!8792 (_2!8237 lt!271654)))))))

(declare-fun b!176515 () Bool)

(declare-fun e!123044 () Bool)

(assert (=> b!176515 (= e!123043 e!123044)))

(declare-fun res!146233 () Bool)

(assert (=> b!176515 (=> res!146233 e!123044)))

(assert (=> b!176515 (= res!146233 (= (size!4201 (buf!4644 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176516 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9524 array!9524 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176516 (= e!123044 (arrayBitRangesEq!0 (buf!4644 thiss!1204) (buf!4644 (_2!8237 lt!271654)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4201 (buf!4644 thiss!1204)) (currentByte!8797 thiss!1204) (currentBit!8792 thiss!1204))))))

(assert (= (and d!62227 res!146235) b!176514))

(assert (= (and b!176514 res!146234) b!176515))

(assert (= (and b!176515 (not res!146233)) b!176516))

(assert (=> b!176514 m!276531))

(assert (=> b!176514 m!276529))

(assert (=> b!176516 m!276531))

(assert (=> b!176516 m!276531))

(declare-fun m!276611 () Bool)

(assert (=> b!176516 m!276611))

(assert (=> b!176425 d!62227))

(declare-fun d!62229 () Bool)

(assert (=> d!62229 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204) (size!4201 (buf!4644 thiss!1204))))))

(declare-fun bs!15525 () Bool)

(assert (= bs!15525 d!62229))

(assert (=> bs!15525 m!276543))

(assert (=> start!39230 d!62229))

(declare-fun d!62231 () Bool)

(assert (=> d!62231 (= (array_inv!3942 (buf!4644 thiss!1204)) (bvsge (size!4201 (buf!4644 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!176420 d!62231))

(declare-fun d!62233 () Bool)

(declare-fun e!123057 () Bool)

(assert (=> d!62233 e!123057))

(declare-fun res!146259 () Bool)

(assert (=> d!62233 (=> (not res!146259) (not e!123057))))

(declare-fun lt!271752 () (_ BitVec 64))

(declare-fun lt!271749 () (_ BitVec 64))

(declare-fun lt!271750 () (_ BitVec 64))

(assert (=> d!62233 (= res!146259 (= lt!271752 (bvsub lt!271750 lt!271749)))))

(assert (=> d!62233 (or (= (bvand lt!271750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271750 lt!271749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62233 (= lt!271749 (remainingBits!0 ((_ sign_extend 32) (size!4201 (buf!4644 (_2!8237 lt!271654)))) ((_ sign_extend 32) (currentByte!8797 (_2!8237 lt!271654))) ((_ sign_extend 32) (currentBit!8792 (_2!8237 lt!271654)))))))

(declare-fun lt!271753 () (_ BitVec 64))

(declare-fun lt!271751 () (_ BitVec 64))

(assert (=> d!62233 (= lt!271750 (bvmul lt!271753 lt!271751))))

(assert (=> d!62233 (or (= lt!271753 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271751 (bvsdiv (bvmul lt!271753 lt!271751) lt!271753)))))

(assert (=> d!62233 (= lt!271751 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62233 (= lt!271753 ((_ sign_extend 32) (size!4201 (buf!4644 (_2!8237 lt!271654)))))))

(assert (=> d!62233 (= lt!271752 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8797 (_2!8237 lt!271654))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8792 (_2!8237 lt!271654)))))))

(assert (=> d!62233 (invariant!0 (currentBit!8792 (_2!8237 lt!271654)) (currentByte!8797 (_2!8237 lt!271654)) (size!4201 (buf!4644 (_2!8237 lt!271654))))))

(assert (=> d!62233 (= (bitIndex!0 (size!4201 (buf!4644 (_2!8237 lt!271654))) (currentByte!8797 (_2!8237 lt!271654)) (currentBit!8792 (_2!8237 lt!271654))) lt!271752)))

(declare-fun b!176539 () Bool)

(declare-fun res!146258 () Bool)

(assert (=> b!176539 (=> (not res!146258) (not e!123057))))

(assert (=> b!176539 (= res!146258 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271752))))

(declare-fun b!176540 () Bool)

(declare-fun lt!271754 () (_ BitVec 64))

(assert (=> b!176540 (= e!123057 (bvsle lt!271752 (bvmul lt!271754 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176540 (or (= lt!271754 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271754 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271754)))))

(assert (=> b!176540 (= lt!271754 ((_ sign_extend 32) (size!4201 (buf!4644 (_2!8237 lt!271654)))))))

(assert (= (and d!62233 res!146259) b!176539))

(assert (= (and b!176539 res!146258) b!176540))

(declare-fun m!276635 () Bool)

(assert (=> d!62233 m!276635))

(assert (=> d!62233 m!276537))

(assert (=> b!176421 d!62233))

(declare-fun d!62251 () Bool)

(declare-fun e!123058 () Bool)

(assert (=> d!62251 e!123058))

(declare-fun res!146261 () Bool)

(assert (=> d!62251 (=> (not res!146261) (not e!123058))))

(declare-fun lt!271758 () (_ BitVec 64))

(declare-fun lt!271756 () (_ BitVec 64))

(declare-fun lt!271755 () (_ BitVec 64))

(assert (=> d!62251 (= res!146261 (= lt!271758 (bvsub lt!271756 lt!271755)))))

(assert (=> d!62251 (or (= (bvand lt!271756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271755 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271756 lt!271755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62251 (= lt!271755 (remainingBits!0 ((_ sign_extend 32) (size!4201 (buf!4644 thiss!1204))) ((_ sign_extend 32) (currentByte!8797 thiss!1204)) ((_ sign_extend 32) (currentBit!8792 thiss!1204))))))

(declare-fun lt!271759 () (_ BitVec 64))

(declare-fun lt!271757 () (_ BitVec 64))

(assert (=> d!62251 (= lt!271756 (bvmul lt!271759 lt!271757))))

(assert (=> d!62251 (or (= lt!271759 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271757 (bvsdiv (bvmul lt!271759 lt!271757) lt!271759)))))

(assert (=> d!62251 (= lt!271757 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62251 (= lt!271759 ((_ sign_extend 32) (size!4201 (buf!4644 thiss!1204))))))

(assert (=> d!62251 (= lt!271758 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8797 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8792 thiss!1204))))))

(assert (=> d!62251 (invariant!0 (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204) (size!4201 (buf!4644 thiss!1204)))))

(assert (=> d!62251 (= (bitIndex!0 (size!4201 (buf!4644 thiss!1204)) (currentByte!8797 thiss!1204) (currentBit!8792 thiss!1204)) lt!271758)))

(declare-fun b!176541 () Bool)

(declare-fun res!146260 () Bool)

(assert (=> b!176541 (=> (not res!146260) (not e!123058))))

(assert (=> b!176541 (= res!146260 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271758))))

(declare-fun b!176542 () Bool)

(declare-fun lt!271760 () (_ BitVec 64))

(assert (=> b!176542 (= e!123058 (bvsle lt!271758 (bvmul lt!271760 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176542 (or (= lt!271760 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271760 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271760)))))

(assert (=> b!176542 (= lt!271760 ((_ sign_extend 32) (size!4201 (buf!4644 thiss!1204))))))

(assert (= (and d!62251 res!146261) b!176541))

(assert (= (and b!176541 res!146260) b!176542))

(declare-fun m!276637 () Bool)

(assert (=> d!62251 m!276637))

(assert (=> d!62251 m!276543))

(assert (=> b!176421 d!62251))

(declare-fun d!62255 () Bool)

(assert (=> d!62255 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4201 (buf!4644 thiss!1204))) ((_ sign_extend 32) (currentByte!8797 thiss!1204)) ((_ sign_extend 32) (currentBit!8792 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4201 (buf!4644 thiss!1204))) ((_ sign_extend 32) (currentByte!8797 thiss!1204)) ((_ sign_extend 32) (currentBit!8792 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15528 () Bool)

(assert (= bs!15528 d!62255))

(assert (=> bs!15528 m!276637))

(assert (=> b!176426 d!62255))

(declare-fun d!62257 () Bool)

(assert (=> d!62257 (= (invariant!0 (currentBit!8792 (_2!8237 lt!271654)) (currentByte!8797 (_2!8237 lt!271654)) (size!4201 (buf!4644 (_2!8237 lt!271654)))) (and (bvsge (currentBit!8792 (_2!8237 lt!271654)) #b00000000000000000000000000000000) (bvslt (currentBit!8792 (_2!8237 lt!271654)) #b00000000000000000000000000001000) (bvsge (currentByte!8797 (_2!8237 lt!271654)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8797 (_2!8237 lt!271654)) (size!4201 (buf!4644 (_2!8237 lt!271654)))) (and (= (currentBit!8792 (_2!8237 lt!271654)) #b00000000000000000000000000000000) (= (currentByte!8797 (_2!8237 lt!271654)) (size!4201 (buf!4644 (_2!8237 lt!271654))))))))))

(assert (=> b!176422 d!62257))

(assert (=> b!176423 d!62233))

(assert (=> b!176423 d!62251))

(declare-fun b!176572 () Bool)

(declare-fun res!146289 () Bool)

(declare-fun e!123075 () Bool)

(assert (=> b!176572 (=> (not res!146289) (not e!123075))))

(declare-fun lt!271799 () tuple2!15184)

(assert (=> b!176572 (= res!146289 (isPrefixOf!0 thiss!1204 (_2!8237 lt!271799)))))

(declare-fun d!62259 () Bool)

(assert (=> d!62259 e!123075))

(declare-fun res!146290 () Bool)

(assert (=> d!62259 (=> (not res!146290) (not e!123075))))

(assert (=> d!62259 (= res!146290 (= (size!4201 (buf!4644 thiss!1204)) (size!4201 (buf!4644 (_2!8237 lt!271799)))))))

(declare-fun choose!16 (BitStream!7510 Bool) tuple2!15184)

(assert (=> d!62259 (= lt!271799 (choose!16 thiss!1204 lt!271656))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62259 (validate_offset_bit!0 ((_ sign_extend 32) (size!4201 (buf!4644 thiss!1204))) ((_ sign_extend 32) (currentByte!8797 thiss!1204)) ((_ sign_extend 32) (currentBit!8792 thiss!1204)))))

(assert (=> d!62259 (= (appendBit!0 thiss!1204 lt!271656) lt!271799)))

(declare-fun b!176573 () Bool)

(declare-fun e!123074 () Bool)

(assert (=> b!176573 (= e!123075 e!123074)))

(declare-fun res!146291 () Bool)

(assert (=> b!176573 (=> (not res!146291) (not e!123074))))

(declare-fun lt!271802 () tuple2!15182)

(assert (=> b!176573 (= res!146291 (and (= (_2!8236 lt!271802) lt!271656) (= (_1!8236 lt!271802) (_2!8237 lt!271799))))))

(assert (=> b!176573 (= lt!271802 (readBitPure!0 (readerFrom!0 (_2!8237 lt!271799) (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204))))))

(declare-fun b!176571 () Bool)

(declare-fun res!146292 () Bool)

(assert (=> b!176571 (=> (not res!146292) (not e!123075))))

(declare-fun lt!271801 () (_ BitVec 64))

(declare-fun lt!271800 () (_ BitVec 64))

(assert (=> b!176571 (= res!146292 (= (bitIndex!0 (size!4201 (buf!4644 (_2!8237 lt!271799))) (currentByte!8797 (_2!8237 lt!271799)) (currentBit!8792 (_2!8237 lt!271799))) (bvadd lt!271801 lt!271800)))))

(assert (=> b!176571 (or (not (= (bvand lt!271801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271800 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271801 lt!271800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176571 (= lt!271800 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176571 (= lt!271801 (bitIndex!0 (size!4201 (buf!4644 thiss!1204)) (currentByte!8797 thiss!1204) (currentBit!8792 thiss!1204)))))

(declare-fun b!176574 () Bool)

(assert (=> b!176574 (= e!123074 (= (bitIndex!0 (size!4201 (buf!4644 (_1!8236 lt!271802))) (currentByte!8797 (_1!8236 lt!271802)) (currentBit!8792 (_1!8236 lt!271802))) (bitIndex!0 (size!4201 (buf!4644 (_2!8237 lt!271799))) (currentByte!8797 (_2!8237 lt!271799)) (currentBit!8792 (_2!8237 lt!271799)))))))

(assert (= (and d!62259 res!146290) b!176571))

(assert (= (and b!176571 res!146292) b!176572))

(assert (= (and b!176572 res!146289) b!176573))

(assert (= (and b!176573 res!146291) b!176574))

(declare-fun m!276649 () Bool)

(assert (=> b!176571 m!276649))

(assert (=> b!176571 m!276531))

(declare-fun m!276651 () Bool)

(assert (=> b!176574 m!276651))

(assert (=> b!176574 m!276649))

(declare-fun m!276653 () Bool)

(assert (=> d!62259 m!276653))

(declare-fun m!276655 () Bool)

(assert (=> d!62259 m!276655))

(declare-fun m!276657 () Bool)

(assert (=> b!176572 m!276657))

(declare-fun m!276659 () Bool)

(assert (=> b!176573 m!276659))

(assert (=> b!176573 m!276659))

(declare-fun m!276661 () Bool)

(assert (=> b!176573 m!276661))

(assert (=> b!176423 d!62259))

(declare-fun d!62273 () Bool)

(declare-fun e!123076 () Bool)

(assert (=> d!62273 e!123076))

(declare-fun res!146294 () Bool)

(assert (=> d!62273 (=> (not res!146294) (not e!123076))))

(declare-fun lt!271803 () (_ BitVec 64))

(declare-fun lt!271804 () (_ BitVec 64))

(declare-fun lt!271806 () (_ BitVec 64))

(assert (=> d!62273 (= res!146294 (= lt!271806 (bvsub lt!271804 lt!271803)))))

(assert (=> d!62273 (or (= (bvand lt!271804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271803 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271804 lt!271803) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62273 (= lt!271803 (remainingBits!0 ((_ sign_extend 32) (size!4201 (buf!4644 (_1!8236 lt!271657)))) ((_ sign_extend 32) (currentByte!8797 (_1!8236 lt!271657))) ((_ sign_extend 32) (currentBit!8792 (_1!8236 lt!271657)))))))

(declare-fun lt!271807 () (_ BitVec 64))

(declare-fun lt!271805 () (_ BitVec 64))

(assert (=> d!62273 (= lt!271804 (bvmul lt!271807 lt!271805))))

(assert (=> d!62273 (or (= lt!271807 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271805 (bvsdiv (bvmul lt!271807 lt!271805) lt!271807)))))

(assert (=> d!62273 (= lt!271805 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62273 (= lt!271807 ((_ sign_extend 32) (size!4201 (buf!4644 (_1!8236 lt!271657)))))))

(assert (=> d!62273 (= lt!271806 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8797 (_1!8236 lt!271657))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8792 (_1!8236 lt!271657)))))))

(assert (=> d!62273 (invariant!0 (currentBit!8792 (_1!8236 lt!271657)) (currentByte!8797 (_1!8236 lt!271657)) (size!4201 (buf!4644 (_1!8236 lt!271657))))))

(assert (=> d!62273 (= (bitIndex!0 (size!4201 (buf!4644 (_1!8236 lt!271657))) (currentByte!8797 (_1!8236 lt!271657)) (currentBit!8792 (_1!8236 lt!271657))) lt!271806)))

(declare-fun b!176575 () Bool)

(declare-fun res!146293 () Bool)

(assert (=> b!176575 (=> (not res!146293) (not e!123076))))

(assert (=> b!176575 (= res!146293 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271806))))

(declare-fun b!176576 () Bool)

(declare-fun lt!271808 () (_ BitVec 64))

(assert (=> b!176576 (= e!123076 (bvsle lt!271806 (bvmul lt!271808 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176576 (or (= lt!271808 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271808 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271808)))))

(assert (=> b!176576 (= lt!271808 ((_ sign_extend 32) (size!4201 (buf!4644 (_1!8236 lt!271657)))))))

(assert (= (and d!62273 res!146294) b!176575))

(assert (= (and b!176575 res!146293) b!176576))

(declare-fun m!276663 () Bool)

(assert (=> d!62273 m!276663))

(declare-fun m!276665 () Bool)

(assert (=> d!62273 m!276665))

(assert (=> b!176418 d!62273))

(declare-fun d!62275 () Bool)

(declare-datatypes ((tuple2!15198 0))(
  ( (tuple2!15199 (_1!8244 Bool) (_2!8244 BitStream!7510)) )
))
(declare-fun lt!271811 () tuple2!15198)

(declare-fun readBit!0 (BitStream!7510) tuple2!15198)

(assert (=> d!62275 (= lt!271811 (readBit!0 (readerFrom!0 (_2!8237 lt!271654) (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204))))))

(assert (=> d!62275 (= (readBitPure!0 (readerFrom!0 (_2!8237 lt!271654) (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204))) (tuple2!15183 (_2!8244 lt!271811) (_1!8244 lt!271811)))))

(declare-fun bs!15530 () Bool)

(assert (= bs!15530 d!62275))

(assert (=> bs!15530 m!276539))

(declare-fun m!276667 () Bool)

(assert (=> bs!15530 m!276667))

(assert (=> b!176419 d!62275))

(declare-fun d!62277 () Bool)

(declare-fun e!123079 () Bool)

(assert (=> d!62277 e!123079))

(declare-fun res!146298 () Bool)

(assert (=> d!62277 (=> (not res!146298) (not e!123079))))

(assert (=> d!62277 (= res!146298 (invariant!0 (currentBit!8792 (_2!8237 lt!271654)) (currentByte!8797 (_2!8237 lt!271654)) (size!4201 (buf!4644 (_2!8237 lt!271654)))))))

(assert (=> d!62277 (= (readerFrom!0 (_2!8237 lt!271654) (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204)) (BitStream!7511 (buf!4644 (_2!8237 lt!271654)) (currentByte!8797 thiss!1204) (currentBit!8792 thiss!1204)))))

(declare-fun b!176579 () Bool)

(assert (=> b!176579 (= e!123079 (invariant!0 (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204) (size!4201 (buf!4644 (_2!8237 lt!271654)))))))

(assert (= (and d!62277 res!146298) b!176579))

(assert (=> d!62277 m!276537))

(declare-fun m!276669 () Bool)

(assert (=> b!176579 m!276669))

(assert (=> b!176419 d!62277))

(declare-fun d!62279 () Bool)

(assert (=> d!62279 (= (invariant!0 (currentBit!8792 thiss!1204) (currentByte!8797 thiss!1204) (size!4201 (buf!4644 thiss!1204))) (and (bvsge (currentBit!8792 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8792 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8797 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8797 thiss!1204) (size!4201 (buf!4644 thiss!1204))) (and (= (currentBit!8792 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8797 thiss!1204) (size!4201 (buf!4644 thiss!1204)))))))))

(assert (=> b!176424 d!62279))

(push 1)

(assert (not b!176572))

(assert (not b!176579))

(assert (not d!62251))

(assert (not b!176574))

(assert (not d!62229))

(assert (not d!62255))

(assert (not b!176571))

(assert (not d!62273))

(assert (not b!176516))

(assert (not b!176573))

(assert (not d!62259))

(assert (not d!62275))

(assert (not b!176514))

(assert (not d!62233))

(assert (not d!62277))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

