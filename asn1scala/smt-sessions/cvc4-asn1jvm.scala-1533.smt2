; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42772 () Bool)

(assert start!42772)

(declare-fun b!201595 () Bool)

(declare-fun res!168781 () Bool)

(declare-fun e!138256 () Bool)

(assert (=> b!201595 (=> (not res!168781) (not e!138256))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!201595 (= res!168781 (not (= i!590 nBits!348)))))

(declare-fun b!201596 () Bool)

(declare-fun res!168788 () Bool)

(declare-fun e!138257 () Bool)

(assert (=> b!201596 (=> (not res!168788) (not e!138257))))

(declare-datatypes ((array!10248 0))(
  ( (array!10249 (arr!5442 (Array (_ BitVec 32) (_ BitVec 8))) (size!4512 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8132 0))(
  ( (BitStream!8133 (buf!5017 array!10248) (currentByte!9430 (_ BitVec 32)) (currentBit!9425 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8132)

(declare-datatypes ((Unit!14317 0))(
  ( (Unit!14318) )
))
(declare-datatypes ((tuple2!17236 0))(
  ( (tuple2!17237 (_1!9270 Unit!14317) (_2!9270 BitStream!8132)) )
))
(declare-fun lt!314410 () tuple2!17236)

(declare-fun isPrefixOf!0 (BitStream!8132 BitStream!8132) Bool)

(assert (=> b!201596 (= res!168788 (isPrefixOf!0 thiss!1204 (_2!9270 lt!314410)))))

(declare-fun res!168786 () Bool)

(assert (=> start!42772 (=> (not res!168786) (not e!138256))))

(assert (=> start!42772 (= res!168786 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42772 e!138256))

(assert (=> start!42772 true))

(declare-fun e!138260 () Bool)

(declare-fun inv!12 (BitStream!8132) Bool)

(assert (=> start!42772 (and (inv!12 thiss!1204) e!138260)))

(declare-fun b!201597 () Bool)

(declare-fun array_inv!4253 (array!10248) Bool)

(assert (=> b!201597 (= e!138260 (array_inv!4253 (buf!5017 thiss!1204)))))

(declare-fun b!201598 () Bool)

(declare-fun res!168784 () Bool)

(assert (=> b!201598 (=> (not res!168784) (not e!138256))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201598 (= res!168784 (validate_offset_bits!1 ((_ sign_extend 32) (size!4512 (buf!5017 thiss!1204))) ((_ sign_extend 32) (currentByte!9430 thiss!1204)) ((_ sign_extend 32) (currentBit!9425 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201599 () Bool)

(declare-fun e!138261 () Bool)

(assert (=> b!201599 (= e!138261 e!138257)))

(declare-fun res!168782 () Bool)

(assert (=> b!201599 (=> (not res!168782) (not e!138257))))

(declare-fun lt!314411 () (_ BitVec 64))

(declare-fun lt!314412 () (_ BitVec 64))

(assert (=> b!201599 (= res!168782 (= lt!314411 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314412)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201599 (= lt!314411 (bitIndex!0 (size!4512 (buf!5017 (_2!9270 lt!314410))) (currentByte!9430 (_2!9270 lt!314410)) (currentBit!9425 (_2!9270 lt!314410))))))

(assert (=> b!201599 (= lt!314412 (bitIndex!0 (size!4512 (buf!5017 thiss!1204)) (currentByte!9430 thiss!1204) (currentBit!9425 thiss!1204)))))

(declare-fun b!201600 () Bool)

(declare-fun e!138258 () Bool)

(declare-datatypes ((tuple2!17238 0))(
  ( (tuple2!17239 (_1!9271 BitStream!8132) (_2!9271 Bool)) )
))
(declare-fun lt!314413 () tuple2!17238)

(assert (=> b!201600 (= e!138258 (= (bitIndex!0 (size!4512 (buf!5017 (_1!9271 lt!314413))) (currentByte!9430 (_1!9271 lt!314413)) (currentBit!9425 (_1!9271 lt!314413))) lt!314411))))

(declare-fun b!201601 () Bool)

(declare-fun res!168785 () Bool)

(assert (=> b!201601 (=> (not res!168785) (not e!138256))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201601 (= res!168785 (invariant!0 (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204) (size!4512 (buf!5017 thiss!1204))))))

(declare-fun b!201602 () Bool)

(assert (=> b!201602 (= e!138257 e!138258)))

(declare-fun res!168783 () Bool)

(assert (=> b!201602 (=> (not res!168783) (not e!138258))))

(declare-fun lt!314408 () Bool)

(assert (=> b!201602 (= res!168783 (and (= (_2!9271 lt!314413) lt!314408) (= (_1!9271 lt!314413) (_2!9270 lt!314410))))))

(declare-fun readBitPure!0 (BitStream!8132) tuple2!17238)

(declare-fun readerFrom!0 (BitStream!8132 (_ BitVec 32) (_ BitVec 32)) BitStream!8132)

(assert (=> b!201602 (= lt!314413 (readBitPure!0 (readerFrom!0 (_2!9270 lt!314410) (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204))))))

(declare-fun b!201603 () Bool)

(declare-fun lt!314409 () (_ BitVec 64))

(declare-fun lt!314414 () (_ BitVec 64))

(assert (=> b!201603 (= e!138256 (not (or (not (= lt!314409 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!314409 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314414) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!201603 (= lt!314409 (bvand lt!314414 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!201603 (= lt!314414 (bitIndex!0 (size!4512 (buf!5017 thiss!1204)) (currentByte!9430 thiss!1204) (currentBit!9425 thiss!1204)))))

(assert (=> b!201603 e!138261))

(declare-fun res!168787 () Bool)

(assert (=> b!201603 (=> (not res!168787) (not e!138261))))

(assert (=> b!201603 (= res!168787 (= (size!4512 (buf!5017 thiss!1204)) (size!4512 (buf!5017 (_2!9270 lt!314410)))))))

(declare-fun appendBit!0 (BitStream!8132 Bool) tuple2!17236)

(assert (=> b!201603 (= lt!314410 (appendBit!0 thiss!1204 lt!314408))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!201603 (= lt!314408 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!42772 res!168786) b!201598))

(assert (= (and b!201598 res!168784) b!201601))

(assert (= (and b!201601 res!168785) b!201595))

(assert (= (and b!201595 res!168781) b!201603))

(assert (= (and b!201603 res!168787) b!201599))

(assert (= (and b!201599 res!168782) b!201596))

(assert (= (and b!201596 res!168788) b!201602))

(assert (= (and b!201602 res!168783) b!201600))

(assert (= start!42772 b!201597))

(declare-fun m!312167 () Bool)

(assert (=> b!201600 m!312167))

(declare-fun m!312169 () Bool)

(assert (=> b!201601 m!312169))

(declare-fun m!312171 () Bool)

(assert (=> b!201598 m!312171))

(declare-fun m!312173 () Bool)

(assert (=> b!201603 m!312173))

(declare-fun m!312175 () Bool)

(assert (=> b!201603 m!312175))

(declare-fun m!312177 () Bool)

(assert (=> start!42772 m!312177))

(declare-fun m!312179 () Bool)

(assert (=> b!201602 m!312179))

(assert (=> b!201602 m!312179))

(declare-fun m!312181 () Bool)

(assert (=> b!201602 m!312181))

(declare-fun m!312183 () Bool)

(assert (=> b!201596 m!312183))

(declare-fun m!312185 () Bool)

(assert (=> b!201597 m!312185))

(declare-fun m!312187 () Bool)

(assert (=> b!201599 m!312187))

(assert (=> b!201599 m!312173))

(push 1)

(assert (not b!201598))

(assert (not b!201600))

(assert (not b!201599))

(assert (not b!201603))

(assert (not start!42772))

(assert (not b!201596))

(assert (not b!201602))

(assert (not b!201597))

(assert (not b!201601))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69077 () Bool)

(declare-datatypes ((tuple2!17242 0))(
  ( (tuple2!17243 (_1!9273 Bool) (_2!9273 BitStream!8132)) )
))
(declare-fun lt!314435 () tuple2!17242)

(declare-fun readBit!0 (BitStream!8132) tuple2!17242)

(assert (=> d!69077 (= lt!314435 (readBit!0 (readerFrom!0 (_2!9270 lt!314410) (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204))))))

(assert (=> d!69077 (= (readBitPure!0 (readerFrom!0 (_2!9270 lt!314410) (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204))) (tuple2!17239 (_2!9273 lt!314435) (_1!9273 lt!314435)))))

(declare-fun bs!17050 () Bool)

(assert (= bs!17050 d!69077))

(assert (=> bs!17050 m!312179))

(declare-fun m!312195 () Bool)

(assert (=> bs!17050 m!312195))

(assert (=> b!201602 d!69077))

(declare-fun d!69081 () Bool)

(declare-fun e!138276 () Bool)

(assert (=> d!69081 e!138276))

(declare-fun res!168814 () Bool)

(assert (=> d!69081 (=> (not res!168814) (not e!138276))))

(assert (=> d!69081 (= res!168814 (invariant!0 (currentBit!9425 (_2!9270 lt!314410)) (currentByte!9430 (_2!9270 lt!314410)) (size!4512 (buf!5017 (_2!9270 lt!314410)))))))

(assert (=> d!69081 (= (readerFrom!0 (_2!9270 lt!314410) (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204)) (BitStream!8133 (buf!5017 (_2!9270 lt!314410)) (currentByte!9430 thiss!1204) (currentBit!9425 thiss!1204)))))

(declare-fun b!201627 () Bool)

(assert (=> b!201627 (= e!138276 (invariant!0 (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204) (size!4512 (buf!5017 (_2!9270 lt!314410)))))))

(assert (= (and d!69081 res!168814) b!201627))

(declare-fun m!312199 () Bool)

(assert (=> d!69081 m!312199))

(declare-fun m!312203 () Bool)

(assert (=> b!201627 m!312203))

(assert (=> b!201602 d!69081))

(declare-fun d!69085 () Bool)

(assert (=> d!69085 (= (array_inv!4253 (buf!5017 thiss!1204)) (bvsge (size!4512 (buf!5017 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201597 d!69085))

(declare-fun d!69089 () Bool)

(declare-fun res!168830 () Bool)

(declare-fun e!138288 () Bool)

(assert (=> d!69089 (=> (not res!168830) (not e!138288))))

(assert (=> d!69089 (= res!168830 (= (size!4512 (buf!5017 thiss!1204)) (size!4512 (buf!5017 (_2!9270 lt!314410)))))))

(assert (=> d!69089 (= (isPrefixOf!0 thiss!1204 (_2!9270 lt!314410)) e!138288)))

(declare-fun b!201643 () Bool)

(declare-fun res!168831 () Bool)

(assert (=> b!201643 (=> (not res!168831) (not e!138288))))

(assert (=> b!201643 (= res!168831 (bvsle (bitIndex!0 (size!4512 (buf!5017 thiss!1204)) (currentByte!9430 thiss!1204) (currentBit!9425 thiss!1204)) (bitIndex!0 (size!4512 (buf!5017 (_2!9270 lt!314410))) (currentByte!9430 (_2!9270 lt!314410)) (currentBit!9425 (_2!9270 lt!314410)))))))

(declare-fun b!201644 () Bool)

(declare-fun e!138287 () Bool)

(assert (=> b!201644 (= e!138288 e!138287)))

(declare-fun res!168832 () Bool)

(assert (=> b!201644 (=> res!168832 e!138287)))

(assert (=> b!201644 (= res!168832 (= (size!4512 (buf!5017 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!201645 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10248 array!10248 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201645 (= e!138287 (arrayBitRangesEq!0 (buf!5017 thiss!1204) (buf!5017 (_2!9270 lt!314410)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4512 (buf!5017 thiss!1204)) (currentByte!9430 thiss!1204) (currentBit!9425 thiss!1204))))))

(assert (= (and d!69089 res!168830) b!201643))

(assert (= (and b!201643 res!168831) b!201644))

(assert (= (and b!201644 (not res!168832)) b!201645))

(assert (=> b!201643 m!312173))

(assert (=> b!201643 m!312187))

(assert (=> b!201645 m!312173))

(assert (=> b!201645 m!312173))

(declare-fun m!312219 () Bool)

(assert (=> b!201645 m!312219))

(assert (=> b!201596 d!69089))

(declare-fun d!69105 () Bool)

(assert (=> d!69105 (= (invariant!0 (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204) (size!4512 (buf!5017 thiss!1204))) (and (bvsge (currentBit!9425 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9425 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9430 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9430 thiss!1204) (size!4512 (buf!5017 thiss!1204))) (and (= (currentBit!9425 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9430 thiss!1204) (size!4512 (buf!5017 thiss!1204)))))))))

(assert (=> b!201601 d!69105))

(declare-fun d!69107 () Bool)

(declare-fun e!138297 () Bool)

(assert (=> d!69107 e!138297))

(declare-fun res!168847 () Bool)

(assert (=> d!69107 (=> (not res!168847) (not e!138297))))

(declare-fun lt!314487 () (_ BitVec 64))

(declare-fun lt!314488 () (_ BitVec 64))

(declare-fun lt!314490 () (_ BitVec 64))

(assert (=> d!69107 (= res!168847 (= lt!314487 (bvsub lt!314490 lt!314488)))))

(assert (=> d!69107 (or (= (bvand lt!314490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314488 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314490 lt!314488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69107 (= lt!314488 (remainingBits!0 ((_ sign_extend 32) (size!4512 (buf!5017 (_1!9271 lt!314413)))) ((_ sign_extend 32) (currentByte!9430 (_1!9271 lt!314413))) ((_ sign_extend 32) (currentBit!9425 (_1!9271 lt!314413)))))))

(declare-fun lt!314489 () (_ BitVec 64))

(declare-fun lt!314491 () (_ BitVec 64))

(assert (=> d!69107 (= lt!314490 (bvmul lt!314489 lt!314491))))

(assert (=> d!69107 (or (= lt!314489 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314491 (bvsdiv (bvmul lt!314489 lt!314491) lt!314489)))))

(assert (=> d!69107 (= lt!314491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69107 (= lt!314489 ((_ sign_extend 32) (size!4512 (buf!5017 (_1!9271 lt!314413)))))))

(assert (=> d!69107 (= lt!314487 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9430 (_1!9271 lt!314413))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9425 (_1!9271 lt!314413)))))))

(assert (=> d!69107 (invariant!0 (currentBit!9425 (_1!9271 lt!314413)) (currentByte!9430 (_1!9271 lt!314413)) (size!4512 (buf!5017 (_1!9271 lt!314413))))))

(assert (=> d!69107 (= (bitIndex!0 (size!4512 (buf!5017 (_1!9271 lt!314413))) (currentByte!9430 (_1!9271 lt!314413)) (currentBit!9425 (_1!9271 lt!314413))) lt!314487)))

(declare-fun b!201659 () Bool)

(declare-fun res!168846 () Bool)

(assert (=> b!201659 (=> (not res!168846) (not e!138297))))

(assert (=> b!201659 (= res!168846 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314487))))

(declare-fun b!201660 () Bool)

(declare-fun lt!314492 () (_ BitVec 64))

(assert (=> b!201660 (= e!138297 (bvsle lt!314487 (bvmul lt!314492 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201660 (or (= lt!314492 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314492 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314492)))))

(assert (=> b!201660 (= lt!314492 ((_ sign_extend 32) (size!4512 (buf!5017 (_1!9271 lt!314413)))))))

(assert (= (and d!69107 res!168847) b!201659))

(assert (= (and b!201659 res!168846) b!201660))

(declare-fun m!312223 () Bool)

(assert (=> d!69107 m!312223))

(declare-fun m!312225 () Bool)

(assert (=> d!69107 m!312225))

(assert (=> b!201600 d!69107))

(declare-fun d!69113 () Bool)

(declare-fun e!138298 () Bool)

(assert (=> d!69113 e!138298))

(declare-fun res!168849 () Bool)

(assert (=> d!69113 (=> (not res!168849) (not e!138298))))

(declare-fun lt!314493 () (_ BitVec 64))

(declare-fun lt!314496 () (_ BitVec 64))

(declare-fun lt!314494 () (_ BitVec 64))

(assert (=> d!69113 (= res!168849 (= lt!314493 (bvsub lt!314496 lt!314494)))))

(assert (=> d!69113 (or (= (bvand lt!314496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314496 lt!314494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69113 (= lt!314494 (remainingBits!0 ((_ sign_extend 32) (size!4512 (buf!5017 (_2!9270 lt!314410)))) ((_ sign_extend 32) (currentByte!9430 (_2!9270 lt!314410))) ((_ sign_extend 32) (currentBit!9425 (_2!9270 lt!314410)))))))

(declare-fun lt!314495 () (_ BitVec 64))

(declare-fun lt!314497 () (_ BitVec 64))

(assert (=> d!69113 (= lt!314496 (bvmul lt!314495 lt!314497))))

(assert (=> d!69113 (or (= lt!314495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314497 (bvsdiv (bvmul lt!314495 lt!314497) lt!314495)))))

(assert (=> d!69113 (= lt!314497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69113 (= lt!314495 ((_ sign_extend 32) (size!4512 (buf!5017 (_2!9270 lt!314410)))))))

(assert (=> d!69113 (= lt!314493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9430 (_2!9270 lt!314410))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9425 (_2!9270 lt!314410)))))))

(assert (=> d!69113 (invariant!0 (currentBit!9425 (_2!9270 lt!314410)) (currentByte!9430 (_2!9270 lt!314410)) (size!4512 (buf!5017 (_2!9270 lt!314410))))))

(assert (=> d!69113 (= (bitIndex!0 (size!4512 (buf!5017 (_2!9270 lt!314410))) (currentByte!9430 (_2!9270 lt!314410)) (currentBit!9425 (_2!9270 lt!314410))) lt!314493)))

(declare-fun b!201661 () Bool)

(declare-fun res!168848 () Bool)

(assert (=> b!201661 (=> (not res!168848) (not e!138298))))

(assert (=> b!201661 (= res!168848 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314493))))

(declare-fun b!201662 () Bool)

(declare-fun lt!314498 () (_ BitVec 64))

(assert (=> b!201662 (= e!138298 (bvsle lt!314493 (bvmul lt!314498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201662 (or (= lt!314498 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314498 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314498)))))

(assert (=> b!201662 (= lt!314498 ((_ sign_extend 32) (size!4512 (buf!5017 (_2!9270 lt!314410)))))))

(assert (= (and d!69113 res!168849) b!201661))

(assert (= (and b!201661 res!168848) b!201662))

(declare-fun m!312227 () Bool)

(assert (=> d!69113 m!312227))

(assert (=> d!69113 m!312199))

(assert (=> b!201599 d!69113))

(declare-fun d!69115 () Bool)

(declare-fun e!138299 () Bool)

(assert (=> d!69115 e!138299))

(declare-fun res!168851 () Bool)

(assert (=> d!69115 (=> (not res!168851) (not e!138299))))

(declare-fun lt!314500 () (_ BitVec 64))

(declare-fun lt!314502 () (_ BitVec 64))

(declare-fun lt!314499 () (_ BitVec 64))

(assert (=> d!69115 (= res!168851 (= lt!314499 (bvsub lt!314502 lt!314500)))))

(assert (=> d!69115 (or (= (bvand lt!314502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314502 lt!314500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69115 (= lt!314500 (remainingBits!0 ((_ sign_extend 32) (size!4512 (buf!5017 thiss!1204))) ((_ sign_extend 32) (currentByte!9430 thiss!1204)) ((_ sign_extend 32) (currentBit!9425 thiss!1204))))))

(declare-fun lt!314501 () (_ BitVec 64))

(declare-fun lt!314503 () (_ BitVec 64))

(assert (=> d!69115 (= lt!314502 (bvmul lt!314501 lt!314503))))

(assert (=> d!69115 (or (= lt!314501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314503 (bvsdiv (bvmul lt!314501 lt!314503) lt!314501)))))

(assert (=> d!69115 (= lt!314503 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69115 (= lt!314501 ((_ sign_extend 32) (size!4512 (buf!5017 thiss!1204))))))

(assert (=> d!69115 (= lt!314499 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9430 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9425 thiss!1204))))))

(assert (=> d!69115 (invariant!0 (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204) (size!4512 (buf!5017 thiss!1204)))))

(assert (=> d!69115 (= (bitIndex!0 (size!4512 (buf!5017 thiss!1204)) (currentByte!9430 thiss!1204) (currentBit!9425 thiss!1204)) lt!314499)))

(declare-fun b!201663 () Bool)

(declare-fun res!168850 () Bool)

(assert (=> b!201663 (=> (not res!168850) (not e!138299))))

(assert (=> b!201663 (= res!168850 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314499))))

(declare-fun b!201664 () Bool)

(declare-fun lt!314504 () (_ BitVec 64))

(assert (=> b!201664 (= e!138299 (bvsle lt!314499 (bvmul lt!314504 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201664 (or (= lt!314504 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314504 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314504)))))

(assert (=> b!201664 (= lt!314504 ((_ sign_extend 32) (size!4512 (buf!5017 thiss!1204))))))

(assert (= (and d!69115 res!168851) b!201663))

(assert (= (and b!201663 res!168850) b!201664))

(declare-fun m!312229 () Bool)

(assert (=> d!69115 m!312229))

(assert (=> d!69115 m!312169))

(assert (=> b!201599 d!69115))

(declare-fun d!69117 () Bool)

(assert (=> d!69117 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4512 (buf!5017 thiss!1204))) ((_ sign_extend 32) (currentByte!9430 thiss!1204)) ((_ sign_extend 32) (currentBit!9425 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4512 (buf!5017 thiss!1204))) ((_ sign_extend 32) (currentByte!9430 thiss!1204)) ((_ sign_extend 32) (currentBit!9425 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17054 () Bool)

(assert (= bs!17054 d!69117))

(assert (=> bs!17054 m!312229))

(assert (=> b!201598 d!69117))

(declare-fun d!69119 () Bool)

(assert (=> d!69119 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204) (size!4512 (buf!5017 thiss!1204))))))

(declare-fun bs!17055 () Bool)

(assert (= bs!17055 d!69119))

(assert (=> bs!17055 m!312169))

(assert (=> start!42772 d!69119))

(assert (=> b!201603 d!69115))

(declare-fun d!69121 () Bool)

(declare-fun e!138320 () Bool)

(assert (=> d!69121 e!138320))

(declare-fun res!168890 () Bool)

(assert (=> d!69121 (=> (not res!168890) (not e!138320))))

(declare-fun lt!314546 () tuple2!17236)

(assert (=> d!69121 (= res!168890 (= (size!4512 (buf!5017 thiss!1204)) (size!4512 (buf!5017 (_2!9270 lt!314546)))))))

(declare-fun choose!16 (BitStream!8132 Bool) tuple2!17236)

(assert (=> d!69121 (= lt!314546 (choose!16 thiss!1204 lt!314408))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69121 (validate_offset_bit!0 ((_ sign_extend 32) (size!4512 (buf!5017 thiss!1204))) ((_ sign_extend 32) (currentByte!9430 thiss!1204)) ((_ sign_extend 32) (currentBit!9425 thiss!1204)))))

(assert (=> d!69121 (= (appendBit!0 thiss!1204 lt!314408) lt!314546)))

(declare-fun b!201706 () Bool)

(declare-fun res!168891 () Bool)

(assert (=> b!201706 (=> (not res!168891) (not e!138320))))

(assert (=> b!201706 (= res!168891 (isPrefixOf!0 thiss!1204 (_2!9270 lt!314546)))))

(declare-fun b!201708 () Bool)

(declare-fun e!138321 () Bool)

(declare-fun lt!314547 () tuple2!17238)

(assert (=> b!201708 (= e!138321 (= (bitIndex!0 (size!4512 (buf!5017 (_1!9271 lt!314547))) (currentByte!9430 (_1!9271 lt!314547)) (currentBit!9425 (_1!9271 lt!314547))) (bitIndex!0 (size!4512 (buf!5017 (_2!9270 lt!314546))) (currentByte!9430 (_2!9270 lt!314546)) (currentBit!9425 (_2!9270 lt!314546)))))))

(declare-fun b!201705 () Bool)

(declare-fun res!168892 () Bool)

(assert (=> b!201705 (=> (not res!168892) (not e!138320))))

(declare-fun lt!314549 () (_ BitVec 64))

(declare-fun lt!314548 () (_ BitVec 64))

(assert (=> b!201705 (= res!168892 (= (bitIndex!0 (size!4512 (buf!5017 (_2!9270 lt!314546))) (currentByte!9430 (_2!9270 lt!314546)) (currentBit!9425 (_2!9270 lt!314546))) (bvadd lt!314548 lt!314549)))))

(assert (=> b!201705 (or (not (= (bvand lt!314548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314549 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!314548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!314548 lt!314549) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201705 (= lt!314549 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!201705 (= lt!314548 (bitIndex!0 (size!4512 (buf!5017 thiss!1204)) (currentByte!9430 thiss!1204) (currentBit!9425 thiss!1204)))))

(declare-fun b!201707 () Bool)

(assert (=> b!201707 (= e!138320 e!138321)))

(declare-fun res!168893 () Bool)

(assert (=> b!201707 (=> (not res!168893) (not e!138321))))

(assert (=> b!201707 (= res!168893 (and (= (_2!9271 lt!314547) lt!314408) (= (_1!9271 lt!314547) (_2!9270 lt!314546))))))

(assert (=> b!201707 (= lt!314547 (readBitPure!0 (readerFrom!0 (_2!9270 lt!314546) (currentBit!9425 thiss!1204) (currentByte!9430 thiss!1204))))))

(assert (= (and d!69121 res!168890) b!201705))

(assert (= (and b!201705 res!168892) b!201706))

(assert (= (and b!201706 res!168891) b!201707))

(assert (= (and b!201707 res!168893) b!201708))

(declare-fun m!312265 () Bool)

(assert (=> b!201706 m!312265))

(declare-fun m!312267 () Bool)

(assert (=> b!201705 m!312267))

(assert (=> b!201705 m!312173))

(declare-fun m!312269 () Bool)

(assert (=> b!201708 m!312269))

(assert (=> b!201708 m!312267))

(declare-fun m!312271 () Bool)

(assert (=> d!69121 m!312271))

(declare-fun m!312273 () Bool)

(assert (=> d!69121 m!312273))

(declare-fun m!312275 () Bool)

(assert (=> b!201707 m!312275))

(assert (=> b!201707 m!312275))

(declare-fun m!312277 () Bool)

(assert (=> b!201707 m!312277))

(assert (=> b!201603 d!69121))

(push 1)

(assert (not d!69121))

(assert (not b!201708))

(assert (not b!201707))

(assert (not b!201627))

(assert (not d!69107))

(assert (not b!201706))

(assert (not d!69113))

(assert (not d!69119))

(assert (not d!69117))

(assert (not b!201643))

(assert (not d!69115))

(assert (not d!69081))

(assert (not b!201705))

(assert (not b!201645))

(assert (not d!69077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

