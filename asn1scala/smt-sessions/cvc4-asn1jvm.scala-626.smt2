; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17690 () Bool)

(assert start!17690)

(declare-fun b!85537 () Bool)

(declare-fun e!56973 () Bool)

(declare-fun e!56972 () Bool)

(assert (=> b!85537 (= e!56973 e!56972)))

(declare-fun res!70200 () Bool)

(assert (=> b!85537 (=> (not res!70200) (not e!56972))))

(declare-fun lt!134686 () (_ BitVec 64))

(declare-fun lt!134689 () (_ BitVec 64))

(assert (=> b!85537 (= res!70200 (= lt!134686 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134689)))))

(declare-datatypes ((array!4066 0))(
  ( (array!4067 (arr!2474 (Array (_ BitVec 32) (_ BitVec 8))) (size!1837 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3236 0))(
  ( (BitStream!3237 (buf!2227 array!4066) (currentByte!4424 (_ BitVec 32)) (currentBit!4419 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5690 0))(
  ( (Unit!5691) )
))
(declare-datatypes ((tuple2!7272 0))(
  ( (tuple2!7273 (_1!3851 Unit!5690) (_2!3851 BitStream!3236)) )
))
(declare-fun lt!134690 () tuple2!7272)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85537 (= lt!134686 (bitIndex!0 (size!1837 (buf!2227 (_2!3851 lt!134690))) (currentByte!4424 (_2!3851 lt!134690)) (currentBit!4419 (_2!3851 lt!134690))))))

(declare-fun b!85538 () Bool)

(declare-fun e!56968 () Bool)

(declare-fun e!56965 () Bool)

(assert (=> b!85538 (= e!56968 e!56965)))

(declare-fun res!70188 () Bool)

(assert (=> b!85538 (=> (not res!70188) (not e!56965))))

(declare-fun lt!134691 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85538 (= res!70188 (= lt!134689 (bvadd lt!134691 ((_ sign_extend 32) i!576))))))

(declare-fun thiss!1152 () BitStream!3236)

(assert (=> b!85538 (= lt!134689 (bitIndex!0 (size!1837 (buf!2227 thiss!1152)) (currentByte!4424 thiss!1152) (currentBit!4419 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3236)

(assert (=> b!85538 (= lt!134691 (bitIndex!0 (size!1837 (buf!2227 thiss!1151)) (currentByte!4424 thiss!1151) (currentBit!4419 thiss!1151)))))

(declare-fun res!70190 () Bool)

(assert (=> start!17690 (=> (not res!70190) (not e!56968))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17690 (= res!70190 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17690 e!56968))

(declare-fun e!56971 () Bool)

(declare-fun inv!12 (BitStream!3236) Bool)

(assert (=> start!17690 (and (inv!12 thiss!1152) e!56971)))

(declare-fun e!56964 () Bool)

(assert (=> start!17690 (and (inv!12 thiss!1151) e!56964)))

(assert (=> start!17690 true))

(declare-fun b!85539 () Bool)

(declare-fun e!56963 () Bool)

(assert (=> b!85539 (= e!56965 (not e!56963))))

(declare-fun res!70193 () Bool)

(assert (=> b!85539 (=> res!70193 e!56963)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85539 (= res!70193 (not (invariant!0 (currentBit!4419 (_2!3851 lt!134690)) (currentByte!4424 (_2!3851 lt!134690)) (size!1837 (buf!2227 (_2!3851 lt!134690))))))))

(assert (=> b!85539 e!56973))

(declare-fun res!70196 () Bool)

(assert (=> b!85539 (=> (not res!70196) (not e!56973))))

(assert (=> b!85539 (= res!70196 (= (size!1837 (buf!2227 thiss!1152)) (size!1837 (buf!2227 (_2!3851 lt!134690)))))))

(declare-fun lt!134688 () Bool)

(declare-fun appendBit!0 (BitStream!3236 Bool) tuple2!7272)

(assert (=> b!85539 (= lt!134690 (appendBit!0 thiss!1152 lt!134688))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!85539 (= lt!134688 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85540 () Bool)

(declare-fun res!70199 () Bool)

(assert (=> b!85540 (=> (not res!70199) (not e!56968))))

(assert (=> b!85540 (= res!70199 (invariant!0 (currentBit!4419 thiss!1151) (currentByte!4424 thiss!1151) (size!1837 (buf!2227 thiss!1151))))))

(declare-fun b!85541 () Bool)

(declare-fun res!70198 () Bool)

(assert (=> b!85541 (=> (not res!70198) (not e!56968))))

(assert (=> b!85541 (= res!70198 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85542 () Bool)

(declare-fun res!70194 () Bool)

(assert (=> b!85542 (=> (not res!70194) (not e!56968))))

(assert (=> b!85542 (= res!70194 (invariant!0 (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152) (size!1837 (buf!2227 thiss!1152))))))

(declare-fun b!85543 () Bool)

(declare-fun res!70203 () Bool)

(assert (=> b!85543 (=> res!70203 e!56963)))

(assert (=> b!85543 (= res!70203 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!85544 () Bool)

(declare-fun res!70191 () Bool)

(assert (=> b!85544 (=> (not res!70191) (not e!56972))))

(declare-fun isPrefixOf!0 (BitStream!3236 BitStream!3236) Bool)

(assert (=> b!85544 (= res!70191 (isPrefixOf!0 thiss!1152 (_2!3851 lt!134690)))))

(declare-fun b!85545 () Bool)

(declare-fun array_inv!1683 (array!4066) Bool)

(assert (=> b!85545 (= e!56964 (array_inv!1683 (buf!2227 thiss!1151)))))

(declare-fun b!85546 () Bool)

(declare-fun res!70195 () Bool)

(assert (=> b!85546 (=> (not res!70195) (not e!56965))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85546 (= res!70195 (validate_offset_bits!1 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1152))) ((_ sign_extend 32) (currentByte!4424 thiss!1152)) ((_ sign_extend 32) (currentBit!4419 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!85547 () Bool)

(declare-fun res!70197 () Bool)

(assert (=> b!85547 (=> (not res!70197) (not e!56968))))

(assert (=> b!85547 (= res!70197 (and (bvsle i!576 nBits!336) (= (size!1837 (buf!2227 thiss!1152)) (size!1837 (buf!2227 thiss!1151)))))))

(declare-fun b!85548 () Bool)

(declare-fun e!56967 () Bool)

(assert (=> b!85548 (= e!56963 e!56967)))

(declare-fun res!70202 () Bool)

(assert (=> b!85548 (=> (not res!70202) (not e!56967))))

(assert (=> b!85548 (= res!70202 (and (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (= (size!1837 (buf!2227 (_2!3851 lt!134690))) (size!1837 (buf!2227 thiss!1151)))))))

(declare-fun b!85549 () Bool)

(declare-fun res!70201 () Bool)

(assert (=> b!85549 (=> (not res!70201) (not e!56967))))

(assert (=> b!85549 (= res!70201 (= (bitIndex!0 (size!1837 (buf!2227 (_2!3851 lt!134690))) (currentByte!4424 (_2!3851 lt!134690)) (currentBit!4419 (_2!3851 lt!134690))) (bvadd lt!134691 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!85550 () Bool)

(declare-fun e!56966 () Bool)

(declare-datatypes ((tuple2!7274 0))(
  ( (tuple2!7275 (_1!3852 BitStream!3236) (_2!3852 Bool)) )
))
(declare-fun lt!134687 () tuple2!7274)

(assert (=> b!85550 (= e!56966 (= (bitIndex!0 (size!1837 (buf!2227 (_1!3852 lt!134687))) (currentByte!4424 (_1!3852 lt!134687)) (currentBit!4419 (_1!3852 lt!134687))) lt!134686))))

(declare-fun b!85551 () Bool)

(assert (=> b!85551 (= e!56971 (array_inv!1683 (buf!2227 thiss!1152)))))

(declare-fun b!85552 () Bool)

(assert (=> b!85552 (= e!56972 e!56966)))

(declare-fun res!70192 () Bool)

(assert (=> b!85552 (=> (not res!70192) (not e!56966))))

(assert (=> b!85552 (= res!70192 (and (= (_2!3852 lt!134687) lt!134688) (= (_1!3852 lt!134687) (_2!3851 lt!134690))))))

(declare-fun readBitPure!0 (BitStream!3236) tuple2!7274)

(declare-fun readerFrom!0 (BitStream!3236 (_ BitVec 32) (_ BitVec 32)) BitStream!3236)

(assert (=> b!85552 (= lt!134687 (readBitPure!0 (readerFrom!0 (_2!3851 lt!134690) (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152))))))

(declare-fun b!85553 () Bool)

(declare-fun res!70204 () Bool)

(assert (=> b!85553 (=> (not res!70204) (not e!56968))))

(assert (=> b!85553 (= res!70204 (validate_offset_bits!1 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1151))) ((_ sign_extend 32) (currentByte!4424 thiss!1151)) ((_ sign_extend 32) (currentBit!4419 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85554 () Bool)

(assert (=> b!85554 (= e!56967 (validate_offset_bits!1 ((_ sign_extend 32) (size!1837 (buf!2227 (_2!3851 lt!134690)))) ((_ sign_extend 32) (currentByte!4424 (_2!3851 lt!134690))) ((_ sign_extend 32) (currentBit!4419 (_2!3851 lt!134690))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!85555 () Bool)

(declare-fun res!70189 () Bool)

(assert (=> b!85555 (=> (not res!70189) (not e!56965))))

(assert (=> b!85555 (= res!70189 (bvslt i!576 nBits!336))))

(assert (= (and start!17690 res!70190) b!85553))

(assert (= (and b!85553 res!70204) b!85540))

(assert (= (and b!85540 res!70199) b!85541))

(assert (= (and b!85541 res!70198) b!85542))

(assert (= (and b!85542 res!70194) b!85547))

(assert (= (and b!85547 res!70197) b!85538))

(assert (= (and b!85538 res!70188) b!85546))

(assert (= (and b!85546 res!70195) b!85555))

(assert (= (and b!85555 res!70189) b!85539))

(assert (= (and b!85539 res!70196) b!85537))

(assert (= (and b!85537 res!70200) b!85544))

(assert (= (and b!85544 res!70191) b!85552))

(assert (= (and b!85552 res!70192) b!85550))

(assert (= (and b!85539 (not res!70193)) b!85543))

(assert (= (and b!85543 (not res!70203)) b!85548))

(assert (= (and b!85548 res!70202) b!85549))

(assert (= (and b!85549 res!70201) b!85554))

(assert (= start!17690 b!85551))

(assert (= start!17690 b!85545))

(declare-fun m!131651 () Bool)

(assert (=> b!85549 m!131651))

(declare-fun m!131653 () Bool)

(assert (=> b!85540 m!131653))

(declare-fun m!131655 () Bool)

(assert (=> b!85550 m!131655))

(declare-fun m!131657 () Bool)

(assert (=> start!17690 m!131657))

(declare-fun m!131659 () Bool)

(assert (=> start!17690 m!131659))

(declare-fun m!131661 () Bool)

(assert (=> b!85554 m!131661))

(declare-fun m!131663 () Bool)

(assert (=> b!85544 m!131663))

(declare-fun m!131665 () Bool)

(assert (=> b!85546 m!131665))

(declare-fun m!131667 () Bool)

(assert (=> b!85542 m!131667))

(declare-fun m!131669 () Bool)

(assert (=> b!85553 m!131669))

(declare-fun m!131671 () Bool)

(assert (=> b!85551 m!131671))

(declare-fun m!131673 () Bool)

(assert (=> b!85538 m!131673))

(declare-fun m!131675 () Bool)

(assert (=> b!85538 m!131675))

(declare-fun m!131677 () Bool)

(assert (=> b!85539 m!131677))

(declare-fun m!131679 () Bool)

(assert (=> b!85539 m!131679))

(assert (=> b!85537 m!131651))

(declare-fun m!131681 () Bool)

(assert (=> b!85552 m!131681))

(assert (=> b!85552 m!131681))

(declare-fun m!131683 () Bool)

(assert (=> b!85552 m!131683))

(declare-fun m!131685 () Bool)

(assert (=> b!85545 m!131685))

(push 1)

(assert (not b!85538))

(assert (not b!85551))

(assert (not b!85554))

(assert (not b!85540))

(assert (not b!85549))

(assert (not b!85552))

(assert (not b!85550))

(assert (not start!17690))

(assert (not b!85553))

(assert (not b!85539))

(assert (not b!85545))

(assert (not b!85544))

(assert (not b!85537))

(assert (not b!85542))

(assert (not b!85546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27316 () Bool)

(declare-fun e!56976 () Bool)

(assert (=> d!27316 e!56976))

(declare-fun res!70209 () Bool)

(assert (=> d!27316 (=> (not res!70209) (not e!56976))))

(declare-fun lt!134706 () (_ BitVec 64))

(declare-fun lt!134709 () (_ BitVec 64))

(declare-fun lt!134705 () (_ BitVec 64))

(assert (=> d!27316 (= res!70209 (= lt!134709 (bvsub lt!134705 lt!134706)))))

(assert (=> d!27316 (or (= (bvand lt!134705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134706 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134705 lt!134706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27316 (= lt!134706 (remainingBits!0 ((_ sign_extend 32) (size!1837 (buf!2227 (_2!3851 lt!134690)))) ((_ sign_extend 32) (currentByte!4424 (_2!3851 lt!134690))) ((_ sign_extend 32) (currentBit!4419 (_2!3851 lt!134690)))))))

(declare-fun lt!134708 () (_ BitVec 64))

(declare-fun lt!134704 () (_ BitVec 64))

(assert (=> d!27316 (= lt!134705 (bvmul lt!134708 lt!134704))))

(assert (=> d!27316 (or (= lt!134708 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134704 (bvsdiv (bvmul lt!134708 lt!134704) lt!134708)))))

(assert (=> d!27316 (= lt!134704 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27316 (= lt!134708 ((_ sign_extend 32) (size!1837 (buf!2227 (_2!3851 lt!134690)))))))

(assert (=> d!27316 (= lt!134709 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4424 (_2!3851 lt!134690))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4419 (_2!3851 lt!134690)))))))

(assert (=> d!27316 (invariant!0 (currentBit!4419 (_2!3851 lt!134690)) (currentByte!4424 (_2!3851 lt!134690)) (size!1837 (buf!2227 (_2!3851 lt!134690))))))

(assert (=> d!27316 (= (bitIndex!0 (size!1837 (buf!2227 (_2!3851 lt!134690))) (currentByte!4424 (_2!3851 lt!134690)) (currentBit!4419 (_2!3851 lt!134690))) lt!134709)))

(declare-fun b!85560 () Bool)

(declare-fun res!70210 () Bool)

(assert (=> b!85560 (=> (not res!70210) (not e!56976))))

(assert (=> b!85560 (= res!70210 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134709))))

(declare-fun b!85561 () Bool)

(declare-fun lt!134707 () (_ BitVec 64))

(assert (=> b!85561 (= e!56976 (bvsle lt!134709 (bvmul lt!134707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85561 (or (= lt!134707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134707)))))

(assert (=> b!85561 (= lt!134707 ((_ sign_extend 32) (size!1837 (buf!2227 (_2!3851 lt!134690)))))))

(assert (= (and d!27316 res!70209) b!85560))

(assert (= (and b!85560 res!70210) b!85561))

(declare-fun m!131687 () Bool)

(assert (=> d!27316 m!131687))

(assert (=> d!27316 m!131677))

(assert (=> b!85549 d!27316))

(declare-fun d!27318 () Bool)

(declare-fun e!56977 () Bool)

(assert (=> d!27318 e!56977))

(declare-fun res!70211 () Bool)

(assert (=> d!27318 (=> (not res!70211) (not e!56977))))

(declare-fun lt!134712 () (_ BitVec 64))

(declare-fun lt!134711 () (_ BitVec 64))

(declare-fun lt!134715 () (_ BitVec 64))

(assert (=> d!27318 (= res!70211 (= lt!134715 (bvsub lt!134711 lt!134712)))))

(assert (=> d!27318 (or (= (bvand lt!134711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134711 lt!134712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27318 (= lt!134712 (remainingBits!0 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1152))) ((_ sign_extend 32) (currentByte!4424 thiss!1152)) ((_ sign_extend 32) (currentBit!4419 thiss!1152))))))

(declare-fun lt!134714 () (_ BitVec 64))

(declare-fun lt!134710 () (_ BitVec 64))

(assert (=> d!27318 (= lt!134711 (bvmul lt!134714 lt!134710))))

(assert (=> d!27318 (or (= lt!134714 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134710 (bvsdiv (bvmul lt!134714 lt!134710) lt!134714)))))

(assert (=> d!27318 (= lt!134710 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27318 (= lt!134714 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1152))))))

(assert (=> d!27318 (= lt!134715 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4424 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4419 thiss!1152))))))

(assert (=> d!27318 (invariant!0 (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152) (size!1837 (buf!2227 thiss!1152)))))

(assert (=> d!27318 (= (bitIndex!0 (size!1837 (buf!2227 thiss!1152)) (currentByte!4424 thiss!1152) (currentBit!4419 thiss!1152)) lt!134715)))

(declare-fun b!85562 () Bool)

(declare-fun res!70212 () Bool)

(assert (=> b!85562 (=> (not res!70212) (not e!56977))))

(assert (=> b!85562 (= res!70212 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134715))))

(declare-fun b!85563 () Bool)

(declare-fun lt!134713 () (_ BitVec 64))

(assert (=> b!85563 (= e!56977 (bvsle lt!134715 (bvmul lt!134713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85563 (or (= lt!134713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134713)))))

(assert (=> b!85563 (= lt!134713 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1152))))))

(assert (= (and d!27318 res!70211) b!85562))

(assert (= (and b!85562 res!70212) b!85563))

(declare-fun m!131689 () Bool)

(assert (=> d!27318 m!131689))

(assert (=> d!27318 m!131667))

(assert (=> b!85538 d!27318))

(declare-fun d!27320 () Bool)

(declare-fun e!56978 () Bool)

(assert (=> d!27320 e!56978))

(declare-fun res!70213 () Bool)

(assert (=> d!27320 (=> (not res!70213) (not e!56978))))

(declare-fun lt!134717 () (_ BitVec 64))

(declare-fun lt!134721 () (_ BitVec 64))

(declare-fun lt!134718 () (_ BitVec 64))

(assert (=> d!27320 (= res!70213 (= lt!134721 (bvsub lt!134717 lt!134718)))))

(assert (=> d!27320 (or (= (bvand lt!134717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134718 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134717 lt!134718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27320 (= lt!134718 (remainingBits!0 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1151))) ((_ sign_extend 32) (currentByte!4424 thiss!1151)) ((_ sign_extend 32) (currentBit!4419 thiss!1151))))))

(declare-fun lt!134720 () (_ BitVec 64))

(declare-fun lt!134716 () (_ BitVec 64))

(assert (=> d!27320 (= lt!134717 (bvmul lt!134720 lt!134716))))

(assert (=> d!27320 (or (= lt!134720 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134716 (bvsdiv (bvmul lt!134720 lt!134716) lt!134720)))))

(assert (=> d!27320 (= lt!134716 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27320 (= lt!134720 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1151))))))

(assert (=> d!27320 (= lt!134721 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4424 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4419 thiss!1151))))))

(assert (=> d!27320 (invariant!0 (currentBit!4419 thiss!1151) (currentByte!4424 thiss!1151) (size!1837 (buf!2227 thiss!1151)))))

(assert (=> d!27320 (= (bitIndex!0 (size!1837 (buf!2227 thiss!1151)) (currentByte!4424 thiss!1151) (currentBit!4419 thiss!1151)) lt!134721)))

(declare-fun b!85564 () Bool)

(declare-fun res!70214 () Bool)

(assert (=> b!85564 (=> (not res!70214) (not e!56978))))

(assert (=> b!85564 (= res!70214 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134721))))

(declare-fun b!85565 () Bool)

(declare-fun lt!134719 () (_ BitVec 64))

(assert (=> b!85565 (= e!56978 (bvsle lt!134721 (bvmul lt!134719 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85565 (or (= lt!134719 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134719 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134719)))))

(assert (=> b!85565 (= lt!134719 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1151))))))

(assert (= (and d!27320 res!70213) b!85564))

(assert (= (and b!85564 res!70214) b!85565))

(declare-fun m!131691 () Bool)

(assert (=> d!27320 m!131691))

(assert (=> d!27320 m!131653))

(assert (=> b!85538 d!27320))

(assert (=> b!85537 d!27316))

(declare-fun d!27322 () Bool)

(assert (=> d!27322 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1152))) ((_ sign_extend 32) (currentByte!4424 thiss!1152)) ((_ sign_extend 32) (currentBit!4419 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1152))) ((_ sign_extend 32) (currentByte!4424 thiss!1152)) ((_ sign_extend 32) (currentBit!4419 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6770 () Bool)

(assert (= bs!6770 d!27322))

(assert (=> bs!6770 m!131689))

(assert (=> b!85546 d!27322))

(declare-fun d!27324 () Bool)

(assert (=> d!27324 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152) (size!1837 (buf!2227 thiss!1152))))))

(declare-fun bs!6771 () Bool)

(assert (= bs!6771 d!27324))

(assert (=> bs!6771 m!131667))

(assert (=> start!17690 d!27324))

(declare-fun d!27326 () Bool)

(assert (=> d!27326 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4419 thiss!1151) (currentByte!4424 thiss!1151) (size!1837 (buf!2227 thiss!1151))))))

(declare-fun bs!6772 () Bool)

(assert (= bs!6772 d!27326))

(assert (=> bs!6772 m!131653))

(assert (=> start!17690 d!27326))

(declare-fun d!27328 () Bool)

(assert (=> d!27328 (= (array_inv!1683 (buf!2227 thiss!1151)) (bvsge (size!1837 (buf!2227 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!85545 d!27328))

(declare-fun d!27332 () Bool)

(declare-fun res!70222 () Bool)

(declare-fun e!56983 () Bool)

(assert (=> d!27332 (=> (not res!70222) (not e!56983))))

(assert (=> d!27332 (= res!70222 (= (size!1837 (buf!2227 thiss!1152)) (size!1837 (buf!2227 (_2!3851 lt!134690)))))))

(assert (=> d!27332 (= (isPrefixOf!0 thiss!1152 (_2!3851 lt!134690)) e!56983)))

(declare-fun b!85572 () Bool)

(declare-fun res!70221 () Bool)

(assert (=> b!85572 (=> (not res!70221) (not e!56983))))

(assert (=> b!85572 (= res!70221 (bvsle (bitIndex!0 (size!1837 (buf!2227 thiss!1152)) (currentByte!4424 thiss!1152) (currentBit!4419 thiss!1152)) (bitIndex!0 (size!1837 (buf!2227 (_2!3851 lt!134690))) (currentByte!4424 (_2!3851 lt!134690)) (currentBit!4419 (_2!3851 lt!134690)))))))

(declare-fun b!85573 () Bool)

(declare-fun e!56984 () Bool)

(assert (=> b!85573 (= e!56983 e!56984)))

(declare-fun res!70223 () Bool)

(assert (=> b!85573 (=> res!70223 e!56984)))

(assert (=> b!85573 (= res!70223 (= (size!1837 (buf!2227 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!85574 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4066 array!4066 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85574 (= e!56984 (arrayBitRangesEq!0 (buf!2227 thiss!1152) (buf!2227 (_2!3851 lt!134690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1837 (buf!2227 thiss!1152)) (currentByte!4424 thiss!1152) (currentBit!4419 thiss!1152))))))

(assert (= (and d!27332 res!70222) b!85572))

(assert (= (and b!85572 res!70221) b!85573))

(assert (= (and b!85573 (not res!70223)) b!85574))

(assert (=> b!85572 m!131673))

(assert (=> b!85572 m!131651))

(assert (=> b!85574 m!131673))

(assert (=> b!85574 m!131673))

(declare-fun m!131693 () Bool)

(assert (=> b!85574 m!131693))

(assert (=> b!85544 d!27332))

(declare-fun d!27334 () Bool)

(assert (=> d!27334 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1837 (buf!2227 (_2!3851 lt!134690)))) ((_ sign_extend 32) (currentByte!4424 (_2!3851 lt!134690))) ((_ sign_extend 32) (currentBit!4419 (_2!3851 lt!134690))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1837 (buf!2227 (_2!3851 lt!134690)))) ((_ sign_extend 32) (currentByte!4424 (_2!3851 lt!134690))) ((_ sign_extend 32) (currentBit!4419 (_2!3851 lt!134690)))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun bs!6773 () Bool)

(assert (= bs!6773 d!27334))

(assert (=> bs!6773 m!131687))

(assert (=> b!85554 d!27334))

(declare-fun d!27336 () Bool)

(assert (=> d!27336 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1151))) ((_ sign_extend 32) (currentByte!4424 thiss!1151)) ((_ sign_extend 32) (currentBit!4419 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1151))) ((_ sign_extend 32) (currentByte!4424 thiss!1151)) ((_ sign_extend 32) (currentBit!4419 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6774 () Bool)

(assert (= bs!6774 d!27336))

(assert (=> bs!6774 m!131691))

(assert (=> b!85553 d!27336))

(declare-fun d!27338 () Bool)

(assert (=> d!27338 (= (invariant!0 (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152) (size!1837 (buf!2227 thiss!1152))) (and (bvsge (currentBit!4419 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4419 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4424 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4424 thiss!1152) (size!1837 (buf!2227 thiss!1152))) (and (= (currentBit!4419 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4424 thiss!1152) (size!1837 (buf!2227 thiss!1152)))))))))

(assert (=> b!85542 d!27338))

(declare-fun d!27340 () Bool)

(declare-datatypes ((tuple2!7276 0))(
  ( (tuple2!7277 (_1!3853 Bool) (_2!3853 BitStream!3236)) )
))
(declare-fun lt!134724 () tuple2!7276)

(declare-fun readBit!0 (BitStream!3236) tuple2!7276)

(assert (=> d!27340 (= lt!134724 (readBit!0 (readerFrom!0 (_2!3851 lt!134690) (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152))))))

(assert (=> d!27340 (= (readBitPure!0 (readerFrom!0 (_2!3851 lt!134690) (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152))) (tuple2!7275 (_2!3853 lt!134724) (_1!3853 lt!134724)))))

(declare-fun bs!6775 () Bool)

(assert (= bs!6775 d!27340))

(assert (=> bs!6775 m!131681))

(declare-fun m!131695 () Bool)

(assert (=> bs!6775 m!131695))

(assert (=> b!85552 d!27340))

(declare-fun d!27342 () Bool)

(declare-fun e!56987 () Bool)

(assert (=> d!27342 e!56987))

(declare-fun res!70227 () Bool)

(assert (=> d!27342 (=> (not res!70227) (not e!56987))))

(assert (=> d!27342 (= res!70227 (invariant!0 (currentBit!4419 (_2!3851 lt!134690)) (currentByte!4424 (_2!3851 lt!134690)) (size!1837 (buf!2227 (_2!3851 lt!134690)))))))

(assert (=> d!27342 (= (readerFrom!0 (_2!3851 lt!134690) (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152)) (BitStream!3237 (buf!2227 (_2!3851 lt!134690)) (currentByte!4424 thiss!1152) (currentBit!4419 thiss!1152)))))

(declare-fun b!85577 () Bool)

(assert (=> b!85577 (= e!56987 (invariant!0 (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152) (size!1837 (buf!2227 (_2!3851 lt!134690)))))))

(assert (= (and d!27342 res!70227) b!85577))

(assert (=> d!27342 m!131677))

(declare-fun m!131697 () Bool)

(assert (=> b!85577 m!131697))

(assert (=> b!85552 d!27342))

(declare-fun d!27344 () Bool)

(assert (=> d!27344 (= (array_inv!1683 (buf!2227 thiss!1152)) (bvsge (size!1837 (buf!2227 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!85551 d!27344))

(declare-fun d!27346 () Bool)

(assert (=> d!27346 (= (invariant!0 (currentBit!4419 thiss!1151) (currentByte!4424 thiss!1151) (size!1837 (buf!2227 thiss!1151))) (and (bvsge (currentBit!4419 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4419 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4424 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4424 thiss!1151) (size!1837 (buf!2227 thiss!1151))) (and (= (currentBit!4419 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4424 thiss!1151) (size!1837 (buf!2227 thiss!1151)))))))))

(assert (=> b!85540 d!27346))

(declare-fun d!27348 () Bool)

(declare-fun e!56988 () Bool)

(assert (=> d!27348 e!56988))

(declare-fun res!70228 () Bool)

(assert (=> d!27348 (=> (not res!70228) (not e!56988))))

(declare-fun lt!134726 () (_ BitVec 64))

(declare-fun lt!134727 () (_ BitVec 64))

(declare-fun lt!134730 () (_ BitVec 64))

(assert (=> d!27348 (= res!70228 (= lt!134730 (bvsub lt!134726 lt!134727)))))

(assert (=> d!27348 (or (= (bvand lt!134726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134727 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134726 lt!134727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27348 (= lt!134727 (remainingBits!0 ((_ sign_extend 32) (size!1837 (buf!2227 (_1!3852 lt!134687)))) ((_ sign_extend 32) (currentByte!4424 (_1!3852 lt!134687))) ((_ sign_extend 32) (currentBit!4419 (_1!3852 lt!134687)))))))

(declare-fun lt!134729 () (_ BitVec 64))

(declare-fun lt!134725 () (_ BitVec 64))

(assert (=> d!27348 (= lt!134726 (bvmul lt!134729 lt!134725))))

(assert (=> d!27348 (or (= lt!134729 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134725 (bvsdiv (bvmul lt!134729 lt!134725) lt!134729)))))

(assert (=> d!27348 (= lt!134725 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27348 (= lt!134729 ((_ sign_extend 32) (size!1837 (buf!2227 (_1!3852 lt!134687)))))))

(assert (=> d!27348 (= lt!134730 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4424 (_1!3852 lt!134687))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4419 (_1!3852 lt!134687)))))))

(assert (=> d!27348 (invariant!0 (currentBit!4419 (_1!3852 lt!134687)) (currentByte!4424 (_1!3852 lt!134687)) (size!1837 (buf!2227 (_1!3852 lt!134687))))))

(assert (=> d!27348 (= (bitIndex!0 (size!1837 (buf!2227 (_1!3852 lt!134687))) (currentByte!4424 (_1!3852 lt!134687)) (currentBit!4419 (_1!3852 lt!134687))) lt!134730)))

(declare-fun b!85578 () Bool)

(declare-fun res!70229 () Bool)

(assert (=> b!85578 (=> (not res!70229) (not e!56988))))

(assert (=> b!85578 (= res!70229 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134730))))

(declare-fun b!85579 () Bool)

(declare-fun lt!134728 () (_ BitVec 64))

(assert (=> b!85579 (= e!56988 (bvsle lt!134730 (bvmul lt!134728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85579 (or (= lt!134728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134728)))))

(assert (=> b!85579 (= lt!134728 ((_ sign_extend 32) (size!1837 (buf!2227 (_1!3852 lt!134687)))))))

(assert (= (and d!27348 res!70228) b!85578))

(assert (= (and b!85578 res!70229) b!85579))

(declare-fun m!131699 () Bool)

(assert (=> d!27348 m!131699))

(declare-fun m!131701 () Bool)

(assert (=> d!27348 m!131701))

(assert (=> b!85550 d!27348))

(declare-fun d!27350 () Bool)

(assert (=> d!27350 (= (invariant!0 (currentBit!4419 (_2!3851 lt!134690)) (currentByte!4424 (_2!3851 lt!134690)) (size!1837 (buf!2227 (_2!3851 lt!134690)))) (and (bvsge (currentBit!4419 (_2!3851 lt!134690)) #b00000000000000000000000000000000) (bvslt (currentBit!4419 (_2!3851 lt!134690)) #b00000000000000000000000000001000) (bvsge (currentByte!4424 (_2!3851 lt!134690)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4424 (_2!3851 lt!134690)) (size!1837 (buf!2227 (_2!3851 lt!134690)))) (and (= (currentBit!4419 (_2!3851 lt!134690)) #b00000000000000000000000000000000) (= (currentByte!4424 (_2!3851 lt!134690)) (size!1837 (buf!2227 (_2!3851 lt!134690))))))))))

(assert (=> b!85539 d!27350))

(declare-fun b!85602 () Bool)

(declare-fun res!70250 () Bool)

(declare-fun e!57000 () Bool)

(assert (=> b!85602 (=> (not res!70250) (not e!57000))))

(declare-fun lt!134777 () tuple2!7272)

(assert (=> b!85602 (= res!70250 (isPrefixOf!0 thiss!1152 (_2!3851 lt!134777)))))

(declare-fun b!85601 () Bool)

(declare-fun res!70253 () Bool)

(assert (=> b!85601 (=> (not res!70253) (not e!57000))))

(declare-fun lt!134775 () (_ BitVec 64))

(declare-fun lt!134778 () (_ BitVec 64))

(assert (=> b!85601 (= res!70253 (= (bitIndex!0 (size!1837 (buf!2227 (_2!3851 lt!134777))) (currentByte!4424 (_2!3851 lt!134777)) (currentBit!4419 (_2!3851 lt!134777))) (bvadd lt!134775 lt!134778)))))

(assert (=> b!85601 (or (not (= (bvand lt!134775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134778 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134775 lt!134778) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!85601 (= lt!134778 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!85601 (= lt!134775 (bitIndex!0 (size!1837 (buf!2227 thiss!1152)) (currentByte!4424 thiss!1152) (currentBit!4419 thiss!1152)))))

(declare-fun b!85604 () Bool)

(declare-fun e!56999 () Bool)

(declare-fun lt!134776 () tuple2!7274)

(assert (=> b!85604 (= e!56999 (= (bitIndex!0 (size!1837 (buf!2227 (_1!3852 lt!134776))) (currentByte!4424 (_1!3852 lt!134776)) (currentBit!4419 (_1!3852 lt!134776))) (bitIndex!0 (size!1837 (buf!2227 (_2!3851 lt!134777))) (currentByte!4424 (_2!3851 lt!134777)) (currentBit!4419 (_2!3851 lt!134777)))))))

(declare-fun d!27352 () Bool)

(assert (=> d!27352 e!57000))

(declare-fun res!70252 () Bool)

(assert (=> d!27352 (=> (not res!70252) (not e!57000))))

(assert (=> d!27352 (= res!70252 (= (size!1837 (buf!2227 thiss!1152)) (size!1837 (buf!2227 (_2!3851 lt!134777)))))))

(declare-fun choose!16 (BitStream!3236 Bool) tuple2!7272)

(assert (=> d!27352 (= lt!134777 (choose!16 thiss!1152 lt!134688))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27352 (validate_offset_bit!0 ((_ sign_extend 32) (size!1837 (buf!2227 thiss!1152))) ((_ sign_extend 32) (currentByte!4424 thiss!1152)) ((_ sign_extend 32) (currentBit!4419 thiss!1152)))))

(assert (=> d!27352 (= (appendBit!0 thiss!1152 lt!134688) lt!134777)))

(declare-fun b!85603 () Bool)

(assert (=> b!85603 (= e!57000 e!56999)))

(declare-fun res!70251 () Bool)

(assert (=> b!85603 (=> (not res!70251) (not e!56999))))

(assert (=> b!85603 (= res!70251 (and (= (_2!3852 lt!134776) lt!134688) (= (_1!3852 lt!134776) (_2!3851 lt!134777))))))

(assert (=> b!85603 (= lt!134776 (readBitPure!0 (readerFrom!0 (_2!3851 lt!134777) (currentBit!4419 thiss!1152) (currentByte!4424 thiss!1152))))))

(assert (= (and d!27352 res!70252) b!85601))

(assert (= (and b!85601 res!70253) b!85602))

(assert (= (and b!85602 res!70250) b!85603))

(assert (= (and b!85603 res!70251) b!85604))

(declare-fun m!131715 () Bool)

(assert (=> b!85602 m!131715))

(declare-fun m!131717 () Bool)

(assert (=> d!27352 m!131717))

(declare-fun m!131719 () Bool)

(assert (=> d!27352 m!131719))

(declare-fun m!131721 () Bool)

(assert (=> b!85601 m!131721))

(assert (=> b!85601 m!131673))

(declare-fun m!131723 () Bool)

(assert (=> b!85603 m!131723))

(assert (=> b!85603 m!131723))

(declare-fun m!131725 () Bool)

(assert (=> b!85603 m!131725))

(declare-fun m!131727 () Bool)

(assert (=> b!85604 m!131727))

(assert (=> b!85604 m!131721))

(assert (=> b!85539 d!27352))

(push 1)

(assert (not b!85602))

(assert (not d!27334))

(assert (not d!27318))

(assert (not b!85572))

(assert (not d!27352))

(assert (not b!85577))

(assert (not b!85603))

(assert (not b!85601))

(assert (not b!85604))

(assert (not d!27342))

(assert (not d!27348))

(assert (not d!27326))

(assert (not d!27324))

(assert (not d!27320))

(assert (not b!85574))

(assert (not d!27316))

(assert (not d!27340))

(assert (not d!27322))

(assert (not d!27336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

