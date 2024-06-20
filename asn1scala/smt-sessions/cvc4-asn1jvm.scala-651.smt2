; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18188 () Bool)

(assert start!18188)

(declare-fun b!90071 () Bool)

(declare-fun e!59408 () Bool)

(declare-datatypes ((array!4237 0))(
  ( (array!4238 (arr!2549 (Array (_ BitVec 32) (_ BitVec 8))) (size!1912 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3386 0))(
  ( (BitStream!3387 (buf!2302 array!4237) (currentByte!4565 (_ BitVec 32)) (currentBit!4560 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!7530 0))(
  ( (tuple2!7531 (_1!4006 BitStream!3386) (_2!4006 Bool)) )
))
(declare-fun lt!136876 () tuple2!7530)

(declare-fun lt!136875 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!90071 (= e!59408 (= (bitIndex!0 (size!1912 (buf!2302 (_1!4006 lt!136876))) (currentByte!4565 (_1!4006 lt!136876)) (currentBit!4560 (_1!4006 lt!136876))) lt!136875))))

(declare-fun b!90073 () Bool)

(declare-fun res!74239 () Bool)

(declare-fun e!59400 () Bool)

(assert (=> b!90073 (=> (not res!74239) (not e!59400))))

(declare-datatypes ((Unit!5810 0))(
  ( (Unit!5811) )
))
(declare-datatypes ((tuple3!434 0))(
  ( (tuple3!435 (_1!4007 Unit!5810) (_2!4007 BitStream!3386) (_3!241 (_ BitVec 32))) )
))
(declare-fun lt!136874 () tuple3!434)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!90073 (= res!74239 (invariant!0 (currentBit!4560 (_2!4007 lt!136874)) (currentByte!4565 (_2!4007 lt!136874)) (size!1912 (buf!2302 (_2!4007 lt!136874)))))))

(declare-fun b!90074 () Bool)

(declare-fun res!74236 () Bool)

(assert (=> b!90074 (=> (not res!74236) (not e!59400))))

(declare-fun thiss!1151 () BitStream!3386)

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!90074 (= res!74236 (and (bvsle (_3!241 lt!136874) nBits!336) (= (size!1912 (buf!2302 (_2!4007 lt!136874))) (size!1912 (buf!2302 thiss!1151)))))))

(declare-fun b!90075 () Bool)

(declare-fun e!59401 () Bool)

(assert (=> b!90075 (= e!59401 e!59400)))

(declare-fun res!74246 () Bool)

(assert (=> b!90075 (=> (not res!74246) (not e!59400))))

(assert (=> b!90075 (= res!74246 (bvsge (_3!241 lt!136874) #b00000000000000000000000000000000))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun v!179 () (_ BitVec 64))

(declare-datatypes ((tuple2!7532 0))(
  ( (tuple2!7533 (_1!4008 Unit!5810) (_2!4008 BitStream!3386)) )
))
(declare-fun lt!136872 () tuple2!7532)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3386 (_ BitVec 64) BitStream!3386 (_ BitVec 32)) tuple3!434)

(assert (=> b!90075 (= lt!136874 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4008 lt!136872) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!90076 () Bool)

(declare-fun e!59404 () Bool)

(declare-fun e!59402 () Bool)

(assert (=> b!90076 (= e!59404 e!59402)))

(declare-fun res!74251 () Bool)

(assert (=> b!90076 (=> (not res!74251) (not e!59402))))

(declare-fun lt!136873 () (_ BitVec 64))

(declare-fun lt!136877 () (_ BitVec 64))

(assert (=> b!90076 (= res!74251 (= lt!136873 (bvadd lt!136877 ((_ sign_extend 32) i!576))))))

(declare-fun thiss!1152 () BitStream!3386)

(assert (=> b!90076 (= lt!136873 (bitIndex!0 (size!1912 (buf!2302 thiss!1152)) (currentByte!4565 thiss!1152) (currentBit!4560 thiss!1152)))))

(assert (=> b!90076 (= lt!136877 (bitIndex!0 (size!1912 (buf!2302 thiss!1151)) (currentByte!4565 thiss!1151) (currentBit!4560 thiss!1151)))))

(declare-fun b!90077 () Bool)

(declare-fun res!74244 () Bool)

(assert (=> b!90077 (=> (not res!74244) (not e!59400))))

(assert (=> b!90077 (= res!74244 (= (bitIndex!0 (size!1912 (buf!2302 (_2!4007 lt!136874))) (currentByte!4565 (_2!4007 lt!136874)) (currentBit!4560 (_2!4007 lt!136874))) (bvadd lt!136877 ((_ sign_extend 32) (_3!241 lt!136874)))))))

(declare-fun b!90078 () Bool)

(declare-fun res!74245 () Bool)

(assert (=> b!90078 (=> (not res!74245) (not e!59404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90078 (= res!74245 (validate_offset_bits!1 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1151))) ((_ sign_extend 32) (currentByte!4565 thiss!1151)) ((_ sign_extend 32) (currentBit!4560 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!90079 () Bool)

(assert (=> b!90079 (= e!59402 (not e!59401))))

(declare-fun res!74254 () Bool)

(assert (=> b!90079 (=> res!74254 e!59401)))

(assert (=> b!90079 (= res!74254 (not (invariant!0 (currentBit!4560 (_2!4008 lt!136872)) (currentByte!4565 (_2!4008 lt!136872)) (size!1912 (buf!2302 (_2!4008 lt!136872))))))))

(declare-fun e!59407 () Bool)

(assert (=> b!90079 e!59407))

(declare-fun res!74250 () Bool)

(assert (=> b!90079 (=> (not res!74250) (not e!59407))))

(assert (=> b!90079 (= res!74250 (= (size!1912 (buf!2302 thiss!1152)) (size!1912 (buf!2302 (_2!4008 lt!136872)))))))

(declare-fun lt!136878 () Bool)

(declare-fun appendBit!0 (BitStream!3386 Bool) tuple2!7532)

(assert (=> b!90079 (= lt!136872 (appendBit!0 thiss!1152 lt!136878))))

(assert (=> b!90079 (= lt!136878 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90080 () Bool)

(declare-fun res!74238 () Bool)

(assert (=> b!90080 (=> (not res!74238) (not e!59404))))

(assert (=> b!90080 (= res!74238 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!90081 () Bool)

(declare-fun e!59409 () Bool)

(declare-fun array_inv!1758 (array!4237) Bool)

(assert (=> b!90081 (= e!59409 (array_inv!1758 (buf!2302 thiss!1151)))))

(declare-fun b!90082 () Bool)

(declare-fun res!74240 () Bool)

(assert (=> b!90082 (=> (not res!74240) (not e!59404))))

(assert (=> b!90082 (= res!74240 (invariant!0 (currentBit!4560 thiss!1151) (currentByte!4565 thiss!1151) (size!1912 (buf!2302 thiss!1151))))))

(declare-fun b!90083 () Bool)

(declare-fun e!59405 () Bool)

(assert (=> b!90083 (= e!59405 e!59408)))

(declare-fun res!74252 () Bool)

(assert (=> b!90083 (=> (not res!74252) (not e!59408))))

(assert (=> b!90083 (= res!74252 (and (= (_2!4006 lt!136876) lt!136878) (= (_1!4006 lt!136876) (_2!4008 lt!136872))))))

(declare-fun readBitPure!0 (BitStream!3386) tuple2!7530)

(declare-fun readerFrom!0 (BitStream!3386 (_ BitVec 32) (_ BitVec 32)) BitStream!3386)

(assert (=> b!90083 (= lt!136876 (readBitPure!0 (readerFrom!0 (_2!4008 lt!136872) (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152))))))

(declare-fun b!90084 () Bool)

(declare-fun res!74253 () Bool)

(assert (=> b!90084 (=> (not res!74253) (not e!59402))))

(assert (=> b!90084 (= res!74253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1152))) ((_ sign_extend 32) (currentByte!4565 thiss!1152)) ((_ sign_extend 32) (currentBit!4560 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun res!74237 () Bool)

(assert (=> start!18188 (=> (not res!74237) (not e!59404))))

(assert (=> start!18188 (= res!74237 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18188 e!59404))

(declare-fun e!59406 () Bool)

(declare-fun inv!12 (BitStream!3386) Bool)

(assert (=> start!18188 (and (inv!12 thiss!1152) e!59406)))

(assert (=> start!18188 (and (inv!12 thiss!1151) e!59409)))

(assert (=> start!18188 true))

(declare-fun b!90072 () Bool)

(declare-fun res!74248 () Bool)

(assert (=> b!90072 (=> (not res!74248) (not e!59404))))

(assert (=> b!90072 (= res!74248 (invariant!0 (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152) (size!1912 (buf!2302 thiss!1152))))))

(declare-fun b!90085 () Bool)

(declare-fun res!74249 () Bool)

(assert (=> b!90085 (=> (not res!74249) (not e!59404))))

(assert (=> b!90085 (= res!74249 (and (bvsle i!576 nBits!336) (= (size!1912 (buf!2302 thiss!1152)) (size!1912 (buf!2302 thiss!1151)))))))

(declare-fun b!90086 () Bool)

(assert (=> b!90086 (= e!59407 e!59405)))

(declare-fun res!74247 () Bool)

(assert (=> b!90086 (=> (not res!74247) (not e!59405))))

(assert (=> b!90086 (= res!74247 (= lt!136875 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136873)))))

(assert (=> b!90086 (= lt!136875 (bitIndex!0 (size!1912 (buf!2302 (_2!4008 lt!136872))) (currentByte!4565 (_2!4008 lt!136872)) (currentBit!4560 (_2!4008 lt!136872))))))

(declare-fun b!90087 () Bool)

(assert (=> b!90087 (= e!59406 (array_inv!1758 (buf!2302 thiss!1152)))))

(declare-fun b!90088 () Bool)

(assert (=> b!90088 (= e!59400 (validate_offset_bits!1 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4007 lt!136874)))) ((_ sign_extend 32) (currentByte!4565 (_2!4007 lt!136874))) ((_ sign_extend 32) (currentBit!4560 (_2!4007 lt!136874))) ((_ sign_extend 32) (bvsub nBits!336 (_3!241 lt!136874)))))))

(declare-fun b!90089 () Bool)

(declare-fun res!74242 () Bool)

(assert (=> b!90089 (=> (not res!74242) (not e!59405))))

(declare-fun isPrefixOf!0 (BitStream!3386 BitStream!3386) Bool)

(assert (=> b!90089 (= res!74242 (isPrefixOf!0 thiss!1152 (_2!4008 lt!136872)))))

(declare-fun b!90090 () Bool)

(declare-fun res!74241 () Bool)

(assert (=> b!90090 (=> res!74241 e!59401)))

(assert (=> b!90090 (= res!74241 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!90091 () Bool)

(declare-fun res!74243 () Bool)

(assert (=> b!90091 (=> (not res!74243) (not e!59402))))

(assert (=> b!90091 (= res!74243 (bvslt i!576 nBits!336))))

(assert (= (and start!18188 res!74237) b!90078))

(assert (= (and b!90078 res!74245) b!90082))

(assert (= (and b!90082 res!74240) b!90080))

(assert (= (and b!90080 res!74238) b!90072))

(assert (= (and b!90072 res!74248) b!90085))

(assert (= (and b!90085 res!74249) b!90076))

(assert (= (and b!90076 res!74251) b!90084))

(assert (= (and b!90084 res!74253) b!90091))

(assert (= (and b!90091 res!74243) b!90079))

(assert (= (and b!90079 res!74250) b!90086))

(assert (= (and b!90086 res!74247) b!90089))

(assert (= (and b!90089 res!74242) b!90083))

(assert (= (and b!90083 res!74252) b!90071))

(assert (= (and b!90079 (not res!74254)) b!90090))

(assert (= (and b!90090 (not res!74241)) b!90075))

(assert (= (and b!90075 res!74246) b!90073))

(assert (= (and b!90073 res!74239) b!90074))

(assert (= (and b!90074 res!74236) b!90077))

(assert (= (and b!90077 res!74244) b!90088))

(assert (= start!18188 b!90087))

(assert (= start!18188 b!90081))

(declare-fun m!134669 () Bool)

(assert (=> b!90071 m!134669))

(declare-fun m!134671 () Bool)

(assert (=> b!90084 m!134671))

(declare-fun m!134673 () Bool)

(assert (=> b!90079 m!134673))

(declare-fun m!134675 () Bool)

(assert (=> b!90079 m!134675))

(declare-fun m!134677 () Bool)

(assert (=> b!90083 m!134677))

(assert (=> b!90083 m!134677))

(declare-fun m!134679 () Bool)

(assert (=> b!90083 m!134679))

(declare-fun m!134681 () Bool)

(assert (=> b!90078 m!134681))

(declare-fun m!134683 () Bool)

(assert (=> b!90076 m!134683))

(declare-fun m!134685 () Bool)

(assert (=> b!90076 m!134685))

(declare-fun m!134687 () Bool)

(assert (=> b!90081 m!134687))

(declare-fun m!134689 () Bool)

(assert (=> b!90086 m!134689))

(declare-fun m!134691 () Bool)

(assert (=> b!90075 m!134691))

(declare-fun m!134693 () Bool)

(assert (=> b!90089 m!134693))

(declare-fun m!134695 () Bool)

(assert (=> b!90073 m!134695))

(declare-fun m!134697 () Bool)

(assert (=> b!90072 m!134697))

(declare-fun m!134699 () Bool)

(assert (=> b!90077 m!134699))

(declare-fun m!134701 () Bool)

(assert (=> b!90087 m!134701))

(declare-fun m!134703 () Bool)

(assert (=> b!90088 m!134703))

(declare-fun m!134705 () Bool)

(assert (=> start!18188 m!134705))

(declare-fun m!134707 () Bool)

(assert (=> start!18188 m!134707))

(declare-fun m!134709 () Bool)

(assert (=> b!90082 m!134709))

(push 1)

(assert (not b!90079))

(assert (not b!90088))

(assert (not b!90089))

(assert (not b!90082))

(assert (not b!90073))

(assert (not b!90086))

(assert (not b!90078))

(assert (not b!90075))

(assert (not b!90076))

(assert (not b!90084))

(assert (not start!18188))

(assert (not b!90087))

(assert (not b!90083))

(assert (not b!90081))

(assert (not b!90077))

(assert (not b!90071))

(assert (not b!90072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28056 () Bool)

(declare-fun e!59427 () Bool)

(assert (=> d!28056 e!59427))

(declare-fun res!74287 () Bool)

(assert (=> d!28056 (=> (not res!74287) (not e!59427))))

(declare-fun lt!136947 () (_ BitVec 64))

(declare-fun lt!136948 () (_ BitVec 64))

(declare-fun lt!136946 () (_ BitVec 64))

(assert (=> d!28056 (= res!74287 (= lt!136947 (bvsub lt!136948 lt!136946)))))

(assert (=> d!28056 (or (= (bvand lt!136948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136946 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136948 lt!136946) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28056 (= lt!136946 (remainingBits!0 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4008 lt!136872)))) ((_ sign_extend 32) (currentByte!4565 (_2!4008 lt!136872))) ((_ sign_extend 32) (currentBit!4560 (_2!4008 lt!136872)))))))

(declare-fun lt!136945 () (_ BitVec 64))

(declare-fun lt!136949 () (_ BitVec 64))

(assert (=> d!28056 (= lt!136948 (bvmul lt!136945 lt!136949))))

(assert (=> d!28056 (or (= lt!136945 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136949 (bvsdiv (bvmul lt!136945 lt!136949) lt!136945)))))

(assert (=> d!28056 (= lt!136949 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28056 (= lt!136945 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4008 lt!136872)))))))

(assert (=> d!28056 (= lt!136947 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4565 (_2!4008 lt!136872))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4560 (_2!4008 lt!136872)))))))

(assert (=> d!28056 (invariant!0 (currentBit!4560 (_2!4008 lt!136872)) (currentByte!4565 (_2!4008 lt!136872)) (size!1912 (buf!2302 (_2!4008 lt!136872))))))

(assert (=> d!28056 (= (bitIndex!0 (size!1912 (buf!2302 (_2!4008 lt!136872))) (currentByte!4565 (_2!4008 lt!136872)) (currentBit!4560 (_2!4008 lt!136872))) lt!136947)))

(declare-fun b!90123 () Bool)

(declare-fun res!74286 () Bool)

(assert (=> b!90123 (=> (not res!74286) (not e!59427))))

(assert (=> b!90123 (= res!74286 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136947))))

(declare-fun b!90124 () Bool)

(declare-fun lt!136950 () (_ BitVec 64))

(assert (=> b!90124 (= e!59427 (bvsle lt!136947 (bvmul lt!136950 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90124 (or (= lt!136950 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136950 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136950)))))

(assert (=> b!90124 (= lt!136950 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4008 lt!136872)))))))

(assert (= (and d!28056 res!74287) b!90123))

(assert (= (and b!90123 res!74286) b!90124))

(declare-fun m!134727 () Bool)

(assert (=> d!28056 m!134727))

(assert (=> d!28056 m!134673))

(assert (=> b!90086 d!28056))

(declare-fun b!90261 () Bool)

(declare-fun res!74421 () Bool)

(declare-fun e!59476 () Bool)

(assert (=> b!90261 (=> (not res!74421) (not e!59476))))

(declare-fun lt!137039 () tuple2!7532)

(assert (=> b!90261 (= res!74421 (= (bitIndex!0 (size!1912 (buf!2302 (_2!4008 lt!137039))) (currentByte!4565 (_2!4008 lt!137039)) (currentBit!4560 (_2!4008 lt!137039))) (bvadd (bitIndex!0 (size!1912 (buf!2302 (_2!4008 lt!136872))) (currentByte!4565 (_2!4008 lt!136872)) (currentBit!4560 (_2!4008 lt!136872))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!28060 () Bool)

(declare-fun e!59475 () Bool)

(assert (=> d!28060 e!59475))

(declare-fun res!74413 () Bool)

(assert (=> d!28060 (=> (not res!74413) (not e!59475))))

(declare-fun lt!137042 () tuple3!434)

(assert (=> d!28060 (= res!74413 (bvsge (_3!241 lt!137042) #b00000000000000000000000000000000))))

(declare-fun e!59473 () tuple3!434)

(assert (=> d!28060 (= lt!137042 e!59473)))

(declare-fun c!5876 () Bool)

(declare-fun lt!137041 () (_ BitVec 32))

(assert (=> d!28060 (= c!5876 (bvslt lt!137041 nBits!336))))

(assert (=> d!28060 (= lt!137041 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(declare-fun lt!137045 () tuple2!7532)

(assert (=> d!28060 (= lt!137045 lt!137039)))

(assert (=> d!28060 e!59476))

(declare-fun res!74420 () Bool)

(assert (=> d!28060 (=> (not res!74420) (not e!59476))))

(assert (=> d!28060 (= res!74420 (= (size!1912 (buf!2302 (_2!4008 lt!136872))) (size!1912 (buf!2302 (_2!4008 lt!137039)))))))

(declare-fun lt!137040 () Bool)

(assert (=> d!28060 (= lt!137039 (appendBit!0 (_2!4008 lt!136872) lt!137040))))

(assert (=> d!28060 (= lt!137040 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!59472 () Bool)

(assert (=> d!28060 e!59472))

(declare-fun res!74415 () Bool)

(assert (=> d!28060 (=> (not res!74415) (not e!59472))))

(assert (=> d!28060 (= res!74415 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!28060 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4008 lt!136872) (bvadd #b00000000000000000000000000000001 i!576)) lt!137042)))

(declare-fun b!90262 () Bool)

(declare-fun res!74408 () Bool)

(assert (=> b!90262 (=> (not res!74408) (not e!59475))))

(assert (=> b!90262 (= res!74408 (invariant!0 (currentBit!4560 (_2!4007 lt!137042)) (currentByte!4565 (_2!4007 lt!137042)) (size!1912 (buf!2302 (_2!4007 lt!137042)))))))

(declare-fun b!90263 () Bool)

(assert (=> b!90263 (= e!59472 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!90264 () Bool)

(declare-fun e!59474 () Bool)

(assert (=> b!90264 (= e!59476 e!59474)))

(declare-fun res!74409 () Bool)

(assert (=> b!90264 (=> (not res!74409) (not e!59474))))

(declare-fun lt!137044 () tuple2!7530)

(assert (=> b!90264 (= res!74409 (and (= (_2!4006 lt!137044) lt!137040) (= (_1!4006 lt!137044) (_2!4008 lt!137039))))))

(assert (=> b!90264 (= lt!137044 (readBitPure!0 (readerFrom!0 (_2!4008 lt!137039) (currentBit!4560 (_2!4008 lt!136872)) (currentByte!4565 (_2!4008 lt!136872)))))))

(declare-fun b!90265 () Bool)

(declare-fun res!74418 () Bool)

(assert (=> b!90265 (=> (not res!74418) (not e!59472))))

(assert (=> b!90265 (= res!74418 (= (bitIndex!0 (size!1912 (buf!2302 (_2!4008 lt!136872))) (currentByte!4565 (_2!4008 lt!136872)) (currentBit!4560 (_2!4008 lt!136872))) (bvadd (bitIndex!0 (size!1912 (buf!2302 thiss!1151)) (currentByte!4565 thiss!1151) (currentBit!4560 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90266 () Bool)

(declare-fun Unit!5813 () Unit!5810)

(assert (=> b!90266 (= e!59473 (tuple3!435 Unit!5813 (_2!4008 lt!137045) lt!137041))))

(declare-fun b!90267 () Bool)

(assert (=> b!90267 (= e!59475 (bvsge (_3!241 lt!137042) nBits!336))))

(declare-fun b!90268 () Bool)

(declare-fun res!74411 () Bool)

(assert (=> b!90268 (=> (not res!74411) (not e!59475))))

(assert (=> b!90268 (= res!74411 (and (bvsle (_3!241 lt!137042) nBits!336) (= (size!1912 (buf!2302 (_2!4007 lt!137042))) (size!1912 (buf!2302 thiss!1151)))))))

(declare-fun b!90269 () Bool)

(declare-fun res!74410 () Bool)

(assert (=> b!90269 (=> (not res!74410) (not e!59472))))

(assert (=> b!90269 (= res!74410 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1912 (buf!2302 (_2!4008 lt!136872))) (size!1912 (buf!2302 thiss!1151)))))))

(declare-fun b!90270 () Bool)

(assert (=> b!90270 (= e!59473 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4008 lt!137045) lt!137041))))

(declare-fun b!90271 () Bool)

(declare-fun res!74416 () Bool)

(assert (=> b!90271 (=> (not res!74416) (not e!59475))))

(declare-fun lt!137043 () (_ BitVec 64))

(declare-fun lt!137046 () (_ BitVec 64))

(assert (=> b!90271 (= res!74416 (= (bitIndex!0 (size!1912 (buf!2302 (_2!4007 lt!137042))) (currentByte!4565 (_2!4007 lt!137042)) (currentBit!4560 (_2!4007 lt!137042))) (bvadd lt!137043 lt!137046)))))

(assert (=> b!90271 (or (not (= (bvand lt!137043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137046 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137043 lt!137046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90271 (= lt!137046 ((_ sign_extend 32) (_3!241 lt!137042)))))

(assert (=> b!90271 (= lt!137043 (bitIndex!0 (size!1912 (buf!2302 thiss!1151)) (currentByte!4565 thiss!1151) (currentBit!4560 thiss!1151)))))

(declare-fun b!90272 () Bool)

(declare-fun res!74417 () Bool)

(assert (=> b!90272 (=> (not res!74417) (not e!59472))))

(assert (=> b!90272 (= res!74417 (invariant!0 (currentBit!4560 (_2!4008 lt!136872)) (currentByte!4565 (_2!4008 lt!136872)) (size!1912 (buf!2302 (_2!4008 lt!136872)))))))

(declare-fun b!90273 () Bool)

(declare-fun res!74412 () Bool)

(assert (=> b!90273 (=> (not res!74412) (not e!59476))))

(assert (=> b!90273 (= res!74412 (isPrefixOf!0 (_2!4008 lt!136872) (_2!4008 lt!137039)))))

(declare-fun b!90274 () Bool)

(declare-fun res!74419 () Bool)

(assert (=> b!90274 (=> (not res!74419) (not e!59472))))

(assert (=> b!90274 (= res!74419 (validate_offset_bits!1 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4008 lt!136872)))) ((_ sign_extend 32) (currentByte!4565 (_2!4008 lt!136872))) ((_ sign_extend 32) (currentBit!4560 (_2!4008 lt!136872))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90275 () Bool)

(declare-fun res!74414 () Bool)

(assert (=> b!90275 (=> (not res!74414) (not e!59475))))

(assert (=> b!90275 (= res!74414 (validate_offset_bits!1 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4007 lt!137042)))) ((_ sign_extend 32) (currentByte!4565 (_2!4007 lt!137042))) ((_ sign_extend 32) (currentBit!4560 (_2!4007 lt!137042))) ((_ sign_extend 32) (bvsub nBits!336 (_3!241 lt!137042)))))))

(assert (=> b!90275 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!241 lt!137042) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!241 lt!137042)) #b10000000000000000000000000000000)))))

(declare-fun b!90276 () Bool)

(assert (=> b!90276 (= e!59474 (= (bitIndex!0 (size!1912 (buf!2302 (_1!4006 lt!137044))) (currentByte!4565 (_1!4006 lt!137044)) (currentBit!4560 (_1!4006 lt!137044))) (bitIndex!0 (size!1912 (buf!2302 (_2!4008 lt!137039))) (currentByte!4565 (_2!4008 lt!137039)) (currentBit!4560 (_2!4008 lt!137039)))))))

(assert (= (and d!28060 res!74415) b!90272))

(assert (= (and b!90272 res!74417) b!90269))

(assert (= (and b!90269 res!74410) b!90265))

(assert (= (and b!90265 res!74418) b!90274))

(assert (= (and b!90274 res!74419) b!90263))

(assert (= (and d!28060 res!74420) b!90261))

(assert (= (and b!90261 res!74421) b!90273))

(assert (= (and b!90273 res!74412) b!90264))

(assert (= (and b!90264 res!74409) b!90276))

(assert (= (and d!28060 c!5876) b!90270))

(assert (= (and d!28060 (not c!5876)) b!90266))

(assert (= (and d!28060 res!74413) b!90262))

(assert (= (and b!90262 res!74408) b!90268))

(assert (= (and b!90268 res!74411) b!90271))

(assert (= (and b!90271 res!74416) b!90275))

(assert (= (and b!90275 res!74414) b!90267))

(declare-fun m!134781 () Bool)

(assert (=> d!28060 m!134781))

(assert (=> b!90272 m!134673))

(declare-fun m!134783 () Bool)

(assert (=> b!90261 m!134783))

(assert (=> b!90261 m!134689))

(declare-fun m!134785 () Bool)

(assert (=> b!90262 m!134785))

(declare-fun m!134787 () Bool)

(assert (=> b!90273 m!134787))

(declare-fun m!134789 () Bool)

(assert (=> b!90264 m!134789))

(assert (=> b!90264 m!134789))

(declare-fun m!134791 () Bool)

(assert (=> b!90264 m!134791))

(declare-fun m!134793 () Bool)

(assert (=> b!90274 m!134793))

(declare-fun m!134795 () Bool)

(assert (=> b!90270 m!134795))

(assert (=> b!90265 m!134689))

(assert (=> b!90265 m!134685))

(declare-fun m!134797 () Bool)

(assert (=> b!90275 m!134797))

(declare-fun m!134799 () Bool)

(assert (=> b!90276 m!134799))

(assert (=> b!90276 m!134783))

(declare-fun m!134801 () Bool)

(assert (=> b!90271 m!134801))

(assert (=> b!90271 m!134685))

(assert (=> b!90075 d!28060))

(declare-fun d!28092 () Bool)

(declare-fun e!59477 () Bool)

(assert (=> d!28092 e!59477))

(declare-fun res!74423 () Bool)

(assert (=> d!28092 (=> (not res!74423) (not e!59477))))

(declare-fun lt!137050 () (_ BitVec 64))

(declare-fun lt!137048 () (_ BitVec 64))

(declare-fun lt!137049 () (_ BitVec 64))

(assert (=> d!28092 (= res!74423 (= lt!137049 (bvsub lt!137050 lt!137048)))))

(assert (=> d!28092 (or (= (bvand lt!137050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137050 lt!137048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28092 (= lt!137048 (remainingBits!0 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1152))) ((_ sign_extend 32) (currentByte!4565 thiss!1152)) ((_ sign_extend 32) (currentBit!4560 thiss!1152))))))

(declare-fun lt!137047 () (_ BitVec 64))

(declare-fun lt!137051 () (_ BitVec 64))

(assert (=> d!28092 (= lt!137050 (bvmul lt!137047 lt!137051))))

(assert (=> d!28092 (or (= lt!137047 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137051 (bvsdiv (bvmul lt!137047 lt!137051) lt!137047)))))

(assert (=> d!28092 (= lt!137051 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28092 (= lt!137047 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1152))))))

(assert (=> d!28092 (= lt!137049 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4565 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4560 thiss!1152))))))

(assert (=> d!28092 (invariant!0 (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152) (size!1912 (buf!2302 thiss!1152)))))

(assert (=> d!28092 (= (bitIndex!0 (size!1912 (buf!2302 thiss!1152)) (currentByte!4565 thiss!1152) (currentBit!4560 thiss!1152)) lt!137049)))

(declare-fun b!90277 () Bool)

(declare-fun res!74422 () Bool)

(assert (=> b!90277 (=> (not res!74422) (not e!59477))))

(assert (=> b!90277 (= res!74422 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137049))))

(declare-fun b!90278 () Bool)

(declare-fun lt!137052 () (_ BitVec 64))

(assert (=> b!90278 (= e!59477 (bvsle lt!137049 (bvmul lt!137052 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90278 (or (= lt!137052 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137052 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137052)))))

(assert (=> b!90278 (= lt!137052 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1152))))))

(assert (= (and d!28092 res!74423) b!90277))

(assert (= (and b!90277 res!74422) b!90278))

(declare-fun m!134803 () Bool)

(assert (=> d!28092 m!134803))

(assert (=> d!28092 m!134697))

(assert (=> b!90076 d!28092))

(declare-fun d!28094 () Bool)

(declare-fun e!59478 () Bool)

(assert (=> d!28094 e!59478))

(declare-fun res!74425 () Bool)

(assert (=> d!28094 (=> (not res!74425) (not e!59478))))

(declare-fun lt!137054 () (_ BitVec 64))

(declare-fun lt!137055 () (_ BitVec 64))

(declare-fun lt!137056 () (_ BitVec 64))

(assert (=> d!28094 (= res!74425 (= lt!137055 (bvsub lt!137056 lt!137054)))))

(assert (=> d!28094 (or (= (bvand lt!137056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137054 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137056 lt!137054) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28094 (= lt!137054 (remainingBits!0 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1151))) ((_ sign_extend 32) (currentByte!4565 thiss!1151)) ((_ sign_extend 32) (currentBit!4560 thiss!1151))))))

(declare-fun lt!137053 () (_ BitVec 64))

(declare-fun lt!137057 () (_ BitVec 64))

(assert (=> d!28094 (= lt!137056 (bvmul lt!137053 lt!137057))))

(assert (=> d!28094 (or (= lt!137053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137057 (bvsdiv (bvmul lt!137053 lt!137057) lt!137053)))))

(assert (=> d!28094 (= lt!137057 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28094 (= lt!137053 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1151))))))

(assert (=> d!28094 (= lt!137055 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4565 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4560 thiss!1151))))))

(assert (=> d!28094 (invariant!0 (currentBit!4560 thiss!1151) (currentByte!4565 thiss!1151) (size!1912 (buf!2302 thiss!1151)))))

(assert (=> d!28094 (= (bitIndex!0 (size!1912 (buf!2302 thiss!1151)) (currentByte!4565 thiss!1151) (currentBit!4560 thiss!1151)) lt!137055)))

(declare-fun b!90279 () Bool)

(declare-fun res!74424 () Bool)

(assert (=> b!90279 (=> (not res!74424) (not e!59478))))

(assert (=> b!90279 (= res!74424 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137055))))

(declare-fun b!90280 () Bool)

(declare-fun lt!137058 () (_ BitVec 64))

(assert (=> b!90280 (= e!59478 (bvsle lt!137055 (bvmul lt!137058 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90280 (or (= lt!137058 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137058 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137058)))))

(assert (=> b!90280 (= lt!137058 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1151))))))

(assert (= (and d!28094 res!74425) b!90279))

(assert (= (and b!90279 res!74424) b!90280))

(declare-fun m!134805 () Bool)

(assert (=> d!28094 m!134805))

(assert (=> d!28094 m!134709))

(assert (=> b!90076 d!28094))

(declare-fun d!28096 () Bool)

(assert (=> d!28096 (= (array_inv!1758 (buf!2302 thiss!1152)) (bvsge (size!1912 (buf!2302 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!90087 d!28096))

(declare-fun d!28098 () Bool)

(assert (=> d!28098 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4007 lt!136874)))) ((_ sign_extend 32) (currentByte!4565 (_2!4007 lt!136874))) ((_ sign_extend 32) (currentBit!4560 (_2!4007 lt!136874))) ((_ sign_extend 32) (bvsub nBits!336 (_3!241 lt!136874)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4007 lt!136874)))) ((_ sign_extend 32) (currentByte!4565 (_2!4007 lt!136874))) ((_ sign_extend 32) (currentBit!4560 (_2!4007 lt!136874)))) ((_ sign_extend 32) (bvsub nBits!336 (_3!241 lt!136874)))))))

(declare-fun bs!6955 () Bool)

(assert (= bs!6955 d!28098))

(declare-fun m!134807 () Bool)

(assert (=> bs!6955 m!134807))

(assert (=> b!90088 d!28098))

(declare-fun d!28100 () Bool)

(declare-fun e!59483 () Bool)

(assert (=> d!28100 e!59483))

(declare-fun res!74435 () Bool)

(assert (=> d!28100 (=> (not res!74435) (not e!59483))))

(declare-fun lt!137068 () (_ BitVec 64))

(declare-fun lt!137070 () (_ BitVec 64))

(declare-fun lt!137069 () (_ BitVec 64))

(assert (=> d!28100 (= res!74435 (= lt!137069 (bvsub lt!137070 lt!137068)))))

(assert (=> d!28100 (or (= (bvand lt!137070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137070 lt!137068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28100 (= lt!137068 (remainingBits!0 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4007 lt!136874)))) ((_ sign_extend 32) (currentByte!4565 (_2!4007 lt!136874))) ((_ sign_extend 32) (currentBit!4560 (_2!4007 lt!136874)))))))

(declare-fun lt!137067 () (_ BitVec 64))

(declare-fun lt!137071 () (_ BitVec 64))

(assert (=> d!28100 (= lt!137070 (bvmul lt!137067 lt!137071))))

(assert (=> d!28100 (or (= lt!137067 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137071 (bvsdiv (bvmul lt!137067 lt!137071) lt!137067)))))

(assert (=> d!28100 (= lt!137071 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28100 (= lt!137067 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4007 lt!136874)))))))

(assert (=> d!28100 (= lt!137069 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4565 (_2!4007 lt!136874))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4560 (_2!4007 lt!136874)))))))

(assert (=> d!28100 (invariant!0 (currentBit!4560 (_2!4007 lt!136874)) (currentByte!4565 (_2!4007 lt!136874)) (size!1912 (buf!2302 (_2!4007 lt!136874))))))

(assert (=> d!28100 (= (bitIndex!0 (size!1912 (buf!2302 (_2!4007 lt!136874))) (currentByte!4565 (_2!4007 lt!136874)) (currentBit!4560 (_2!4007 lt!136874))) lt!137069)))

(declare-fun b!90290 () Bool)

(declare-fun res!74434 () Bool)

(assert (=> b!90290 (=> (not res!74434) (not e!59483))))

(assert (=> b!90290 (= res!74434 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137069))))

(declare-fun b!90291 () Bool)

(declare-fun lt!137072 () (_ BitVec 64))

(assert (=> b!90291 (= e!59483 (bvsle lt!137069 (bvmul lt!137072 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90291 (or (= lt!137072 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137072 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137072)))))

(assert (=> b!90291 (= lt!137072 ((_ sign_extend 32) (size!1912 (buf!2302 (_2!4007 lt!136874)))))))

(assert (= (and d!28100 res!74435) b!90290))

(assert (= (and b!90290 res!74434) b!90291))

(assert (=> d!28100 m!134807))

(assert (=> d!28100 m!134695))

(assert (=> b!90077 d!28100))

(declare-fun d!28102 () Bool)

(assert (=> d!28102 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152) (size!1912 (buf!2302 thiss!1152))))))

(declare-fun bs!6956 () Bool)

(assert (= bs!6956 d!28102))

(assert (=> bs!6956 m!134697))

(assert (=> start!18188 d!28102))

(declare-fun d!28104 () Bool)

(assert (=> d!28104 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4560 thiss!1151) (currentByte!4565 thiss!1151) (size!1912 (buf!2302 thiss!1151))))))

(declare-fun bs!6957 () Bool)

(assert (= bs!6957 d!28104))

(assert (=> bs!6957 m!134709))

(assert (=> start!18188 d!28104))

(declare-fun d!28106 () Bool)

(declare-datatypes ((tuple2!7538 0))(
  ( (tuple2!7539 (_1!4011 Bool) (_2!4011 BitStream!3386)) )
))
(declare-fun lt!137079 () tuple2!7538)

(declare-fun readBit!0 (BitStream!3386) tuple2!7538)

(assert (=> d!28106 (= lt!137079 (readBit!0 (readerFrom!0 (_2!4008 lt!136872) (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152))))))

(assert (=> d!28106 (= (readBitPure!0 (readerFrom!0 (_2!4008 lt!136872) (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152))) (tuple2!7531 (_2!4011 lt!137079) (_1!4011 lt!137079)))))

(declare-fun bs!6958 () Bool)

(assert (= bs!6958 d!28106))

(assert (=> bs!6958 m!134677))

(declare-fun m!134815 () Bool)

(assert (=> bs!6958 m!134815))

(assert (=> b!90083 d!28106))

(declare-fun d!28108 () Bool)

(declare-fun e!59488 () Bool)

(assert (=> d!28108 e!59488))

(declare-fun res!74443 () Bool)

(assert (=> d!28108 (=> (not res!74443) (not e!59488))))

(assert (=> d!28108 (= res!74443 (invariant!0 (currentBit!4560 (_2!4008 lt!136872)) (currentByte!4565 (_2!4008 lt!136872)) (size!1912 (buf!2302 (_2!4008 lt!136872)))))))

(assert (=> d!28108 (= (readerFrom!0 (_2!4008 lt!136872) (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152)) (BitStream!3387 (buf!2302 (_2!4008 lt!136872)) (currentByte!4565 thiss!1152) (currentBit!4560 thiss!1152)))))

(declare-fun b!90298 () Bool)

(assert (=> b!90298 (= e!59488 (invariant!0 (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152) (size!1912 (buf!2302 (_2!4008 lt!136872)))))))

(assert (= (and d!28108 res!74443) b!90298))

(assert (=> d!28108 m!134673))

(declare-fun m!134825 () Bool)

(assert (=> b!90298 m!134825))

(assert (=> b!90083 d!28108))

(declare-fun d!28114 () Bool)

(assert (=> d!28114 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1152))) ((_ sign_extend 32) (currentByte!4565 thiss!1152)) ((_ sign_extend 32) (currentBit!4560 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1152))) ((_ sign_extend 32) (currentByte!4565 thiss!1152)) ((_ sign_extend 32) (currentBit!4560 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6959 () Bool)

(assert (= bs!6959 d!28114))

(assert (=> bs!6959 m!134803))

(assert (=> b!90084 d!28114))

(declare-fun d!28116 () Bool)

(assert (=> d!28116 (= (invariant!0 (currentBit!4560 (_2!4007 lt!136874)) (currentByte!4565 (_2!4007 lt!136874)) (size!1912 (buf!2302 (_2!4007 lt!136874)))) (and (bvsge (currentBit!4560 (_2!4007 lt!136874)) #b00000000000000000000000000000000) (bvslt (currentBit!4560 (_2!4007 lt!136874)) #b00000000000000000000000000001000) (bvsge (currentByte!4565 (_2!4007 lt!136874)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4565 (_2!4007 lt!136874)) (size!1912 (buf!2302 (_2!4007 lt!136874)))) (and (= (currentBit!4560 (_2!4007 lt!136874)) #b00000000000000000000000000000000) (= (currentByte!4565 (_2!4007 lt!136874)) (size!1912 (buf!2302 (_2!4007 lt!136874))))))))))

(assert (=> b!90073 d!28116))

(declare-fun d!28120 () Bool)

(assert (=> d!28120 (= (array_inv!1758 (buf!2302 thiss!1151)) (bvsge (size!1912 (buf!2302 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!90081 d!28120))

(declare-fun d!28122 () Bool)

(assert (=> d!28122 (= (invariant!0 (currentBit!4560 thiss!1151) (currentByte!4565 thiss!1151) (size!1912 (buf!2302 thiss!1151))) (and (bvsge (currentBit!4560 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4560 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4565 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4565 thiss!1151) (size!1912 (buf!2302 thiss!1151))) (and (= (currentBit!4560 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4565 thiss!1151) (size!1912 (buf!2302 thiss!1151)))))))))

(assert (=> b!90082 d!28122))

(declare-fun d!28124 () Bool)

(declare-fun e!59493 () Bool)

(assert (=> d!28124 e!59493))

(declare-fun res!74454 () Bool)

(assert (=> d!28124 (=> (not res!74454) (not e!59493))))

(declare-fun lt!137092 () (_ BitVec 64))

(declare-fun lt!137094 () (_ BitVec 64))

(declare-fun lt!137093 () (_ BitVec 64))

(assert (=> d!28124 (= res!74454 (= lt!137093 (bvsub lt!137094 lt!137092)))))

(assert (=> d!28124 (or (= (bvand lt!137094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137092 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137094 lt!137092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28124 (= lt!137092 (remainingBits!0 ((_ sign_extend 32) (size!1912 (buf!2302 (_1!4006 lt!136876)))) ((_ sign_extend 32) (currentByte!4565 (_1!4006 lt!136876))) ((_ sign_extend 32) (currentBit!4560 (_1!4006 lt!136876)))))))

(declare-fun lt!137091 () (_ BitVec 64))

(declare-fun lt!137095 () (_ BitVec 64))

(assert (=> d!28124 (= lt!137094 (bvmul lt!137091 lt!137095))))

(assert (=> d!28124 (or (= lt!137091 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137095 (bvsdiv (bvmul lt!137091 lt!137095) lt!137091)))))

(assert (=> d!28124 (= lt!137095 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28124 (= lt!137091 ((_ sign_extend 32) (size!1912 (buf!2302 (_1!4006 lt!136876)))))))

(assert (=> d!28124 (= lt!137093 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4565 (_1!4006 lt!136876))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4560 (_1!4006 lt!136876)))))))

(assert (=> d!28124 (invariant!0 (currentBit!4560 (_1!4006 lt!136876)) (currentByte!4565 (_1!4006 lt!136876)) (size!1912 (buf!2302 (_1!4006 lt!136876))))))

(assert (=> d!28124 (= (bitIndex!0 (size!1912 (buf!2302 (_1!4006 lt!136876))) (currentByte!4565 (_1!4006 lt!136876)) (currentBit!4560 (_1!4006 lt!136876))) lt!137093)))

(declare-fun b!90308 () Bool)

(declare-fun res!74453 () Bool)

(assert (=> b!90308 (=> (not res!74453) (not e!59493))))

(assert (=> b!90308 (= res!74453 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137093))))

(declare-fun b!90309 () Bool)

(declare-fun lt!137096 () (_ BitVec 64))

(assert (=> b!90309 (= e!59493 (bvsle lt!137093 (bvmul lt!137096 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90309 (or (= lt!137096 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137096 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137096)))))

(assert (=> b!90309 (= lt!137096 ((_ sign_extend 32) (size!1912 (buf!2302 (_1!4006 lt!136876)))))))

(assert (= (and d!28124 res!74454) b!90308))

(assert (= (and b!90308 res!74453) b!90309))

(declare-fun m!134829 () Bool)

(assert (=> d!28124 m!134829))

(declare-fun m!134831 () Bool)

(assert (=> d!28124 m!134831))

(assert (=> b!90071 d!28124))

(declare-fun d!28126 () Bool)

(assert (=> d!28126 (= (invariant!0 (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152) (size!1912 (buf!2302 thiss!1152))) (and (bvsge (currentBit!4560 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4560 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4565 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4565 thiss!1152) (size!1912 (buf!2302 thiss!1152))) (and (= (currentBit!4560 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4565 thiss!1152) (size!1912 (buf!2302 thiss!1152)))))))))

(assert (=> b!90072 d!28126))

(declare-fun d!28128 () Bool)

(assert (=> d!28128 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1151))) ((_ sign_extend 32) (currentByte!4565 thiss!1151)) ((_ sign_extend 32) (currentBit!4560 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1151))) ((_ sign_extend 32) (currentByte!4565 thiss!1151)) ((_ sign_extend 32) (currentBit!4560 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6961 () Bool)

(assert (= bs!6961 d!28128))

(assert (=> bs!6961 m!134805))

(assert (=> b!90078 d!28128))

(declare-fun d!28130 () Bool)

(declare-fun res!74470 () Bool)

(declare-fun e!59504 () Bool)

(assert (=> d!28130 (=> (not res!74470) (not e!59504))))

(assert (=> d!28130 (= res!74470 (= (size!1912 (buf!2302 thiss!1152)) (size!1912 (buf!2302 (_2!4008 lt!136872)))))))

(assert (=> d!28130 (= (isPrefixOf!0 thiss!1152 (_2!4008 lt!136872)) e!59504)))

(declare-fun b!90325 () Bool)

(declare-fun res!74471 () Bool)

(assert (=> b!90325 (=> (not res!74471) (not e!59504))))

(assert (=> b!90325 (= res!74471 (bvsle (bitIndex!0 (size!1912 (buf!2302 thiss!1152)) (currentByte!4565 thiss!1152) (currentBit!4560 thiss!1152)) (bitIndex!0 (size!1912 (buf!2302 (_2!4008 lt!136872))) (currentByte!4565 (_2!4008 lt!136872)) (currentBit!4560 (_2!4008 lt!136872)))))))

(declare-fun b!90326 () Bool)

(declare-fun e!59505 () Bool)

(assert (=> b!90326 (= e!59504 e!59505)))

(declare-fun res!74472 () Bool)

(assert (=> b!90326 (=> res!74472 e!59505)))

(assert (=> b!90326 (= res!74472 (= (size!1912 (buf!2302 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!90327 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4237 array!4237 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90327 (= e!59505 (arrayBitRangesEq!0 (buf!2302 thiss!1152) (buf!2302 (_2!4008 lt!136872)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1912 (buf!2302 thiss!1152)) (currentByte!4565 thiss!1152) (currentBit!4560 thiss!1152))))))

(assert (= (and d!28130 res!74470) b!90325))

(assert (= (and b!90325 res!74471) b!90326))

(assert (= (and b!90326 (not res!74472)) b!90327))

(assert (=> b!90325 m!134683))

(assert (=> b!90325 m!134689))

(assert (=> b!90327 m!134683))

(assert (=> b!90327 m!134683))

(declare-fun m!134851 () Bool)

(assert (=> b!90327 m!134851))

(assert (=> b!90089 d!28130))

(declare-fun d!28144 () Bool)

(assert (=> d!28144 (= (invariant!0 (currentBit!4560 (_2!4008 lt!136872)) (currentByte!4565 (_2!4008 lt!136872)) (size!1912 (buf!2302 (_2!4008 lt!136872)))) (and (bvsge (currentBit!4560 (_2!4008 lt!136872)) #b00000000000000000000000000000000) (bvslt (currentBit!4560 (_2!4008 lt!136872)) #b00000000000000000000000000001000) (bvsge (currentByte!4565 (_2!4008 lt!136872)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4565 (_2!4008 lt!136872)) (size!1912 (buf!2302 (_2!4008 lt!136872)))) (and (= (currentBit!4560 (_2!4008 lt!136872)) #b00000000000000000000000000000000) (= (currentByte!4565 (_2!4008 lt!136872)) (size!1912 (buf!2302 (_2!4008 lt!136872))))))))))

(assert (=> b!90079 d!28144))

(declare-fun b!90351 () Bool)

(declare-fun e!59519 () Bool)

(declare-fun e!59520 () Bool)

(assert (=> b!90351 (= e!59519 e!59520)))

(declare-fun res!74494 () Bool)

(assert (=> b!90351 (=> (not res!74494) (not e!59520))))

(declare-fun lt!137121 () tuple2!7532)

(declare-fun lt!137118 () tuple2!7530)

(assert (=> b!90351 (= res!74494 (and (= (_2!4006 lt!137118) lt!136878) (= (_1!4006 lt!137118) (_2!4008 lt!137121))))))

(assert (=> b!90351 (= lt!137118 (readBitPure!0 (readerFrom!0 (_2!4008 lt!137121) (currentBit!4560 thiss!1152) (currentByte!4565 thiss!1152))))))

(declare-fun b!90352 () Bool)

(assert (=> b!90352 (= e!59520 (= (bitIndex!0 (size!1912 (buf!2302 (_1!4006 lt!137118))) (currentByte!4565 (_1!4006 lt!137118)) (currentBit!4560 (_1!4006 lt!137118))) (bitIndex!0 (size!1912 (buf!2302 (_2!4008 lt!137121))) (currentByte!4565 (_2!4008 lt!137121)) (currentBit!4560 (_2!4008 lt!137121)))))))

(declare-fun b!90350 () Bool)

(declare-fun res!74495 () Bool)

(assert (=> b!90350 (=> (not res!74495) (not e!59519))))

(assert (=> b!90350 (= res!74495 (isPrefixOf!0 thiss!1152 (_2!4008 lt!137121)))))

(declare-fun b!90349 () Bool)

(declare-fun res!74496 () Bool)

(assert (=> b!90349 (=> (not res!74496) (not e!59519))))

(declare-fun lt!137120 () (_ BitVec 64))

(declare-fun lt!137119 () (_ BitVec 64))

(assert (=> b!90349 (= res!74496 (= (bitIndex!0 (size!1912 (buf!2302 (_2!4008 lt!137121))) (currentByte!4565 (_2!4008 lt!137121)) (currentBit!4560 (_2!4008 lt!137121))) (bvadd lt!137119 lt!137120)))))

(assert (=> b!90349 (or (not (= (bvand lt!137119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137120 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137119 lt!137120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90349 (= lt!137120 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!90349 (= lt!137119 (bitIndex!0 (size!1912 (buf!2302 thiss!1152)) (currentByte!4565 thiss!1152) (currentBit!4560 thiss!1152)))))

(declare-fun d!28146 () Bool)

(assert (=> d!28146 e!59519))

(declare-fun res!74497 () Bool)

(assert (=> d!28146 (=> (not res!74497) (not e!59519))))

(assert (=> d!28146 (= res!74497 (= (size!1912 (buf!2302 thiss!1152)) (size!1912 (buf!2302 (_2!4008 lt!137121)))))))

(declare-fun choose!16 (BitStream!3386 Bool) tuple2!7532)

(assert (=> d!28146 (= lt!137121 (choose!16 thiss!1152 lt!136878))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28146 (validate_offset_bit!0 ((_ sign_extend 32) (size!1912 (buf!2302 thiss!1152))) ((_ sign_extend 32) (currentByte!4565 thiss!1152)) ((_ sign_extend 32) (currentBit!4560 thiss!1152)))))

(assert (=> d!28146 (= (appendBit!0 thiss!1152 lt!136878) lt!137121)))

(assert (= (and d!28146 res!74497) b!90349))

(assert (= (and b!90349 res!74496) b!90350))

(assert (= (and b!90350 res!74495) b!90351))

(assert (= (and b!90351 res!74494) b!90352))

(declare-fun m!134859 () Bool)

(assert (=> b!90352 m!134859))

(declare-fun m!134861 () Bool)

(assert (=> b!90352 m!134861))

(declare-fun m!134863 () Bool)

(assert (=> d!28146 m!134863))

(declare-fun m!134865 () Bool)

(assert (=> d!28146 m!134865))

(assert (=> b!90349 m!134861))

(assert (=> b!90349 m!134683))

(declare-fun m!134867 () Bool)

(assert (=> b!90351 m!134867))

(assert (=> b!90351 m!134867))

(declare-fun m!134869 () Bool)

(assert (=> b!90351 m!134869))

(declare-fun m!134871 () Bool)

(assert (=> b!90350 m!134871))

(assert (=> b!90079 d!28146))

(push 1)

(assert (not d!28104))

(assert (not d!28100))

(assert (not b!90274))

(assert (not b!90261))

(assert (not d!28094))

(assert (not b!90352))

(assert (not b!90349))

(assert (not b!90276))

(assert (not b!90350))

(assert (not d!28092))

(assert (not d!28124))

(assert (not d!28108))

(assert (not d!28098))

(assert (not b!90327))

(assert (not d!28102))

(assert (not d!28060))

(assert (not d!28128))

(assert (not b!90262))

(assert (not d!28114))

(assert (not b!90272))

(assert (not b!90270))

(assert (not b!90351))

(assert (not b!90298))

(assert (not d!28056))

(assert (not b!90325))

(assert (not b!90273))

(assert (not b!90265))

(assert (not b!90264))

(assert (not d!28106))

(assert (not b!90275))

(assert (not b!90271))

(assert (not d!28146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

