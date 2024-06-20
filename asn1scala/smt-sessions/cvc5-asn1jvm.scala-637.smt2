; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17866 () Bool)

(assert start!17866)

(declare-fun b!87621 () Bool)

(declare-fun e!58081 () Bool)

(declare-fun e!58082 () Bool)

(assert (=> b!87621 (= e!58081 e!58082)))

(declare-fun res!72080 () Bool)

(assert (=> b!87621 (=> (not res!72080) (not e!58082))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun lt!135699 () (_ BitVec 64))

(declare-fun lt!135698 () (_ BitVec 64))

(assert (=> b!87621 (= res!72080 (= lt!135698 (bvadd lt!135699 ((_ sign_extend 32) i!576))))))

(declare-datatypes ((array!4134 0))(
  ( (array!4135 (arr!2505 (Array (_ BitVec 32) (_ BitVec 8))) (size!1868 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3298 0))(
  ( (BitStream!3299 (buf!2258 array!4134) (currentByte!4473 (_ BitVec 32)) (currentBit!4468 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3298)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87621 (= lt!135698 (bitIndex!0 (size!1868 (buf!2258 thiss!1152)) (currentByte!4473 thiss!1152) (currentBit!4468 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3298)

(assert (=> b!87621 (= lt!135699 (bitIndex!0 (size!1868 (buf!2258 thiss!1151)) (currentByte!4473 thiss!1151) (currentBit!4468 thiss!1151)))))

(declare-fun b!87622 () Bool)

(declare-fun e!58080 () Bool)

(declare-datatypes ((tuple2!7408 0))(
  ( (tuple2!7409 (_1!3937 BitStream!3298) (_2!3937 Bool)) )
))
(declare-fun lt!135697 () tuple2!7408)

(declare-fun lt!135696 () (_ BitVec 64))

(assert (=> b!87622 (= e!58080 (= (bitIndex!0 (size!1868 (buf!2258 (_1!3937 lt!135697))) (currentByte!4473 (_1!3937 lt!135697)) (currentBit!4468 (_1!3937 lt!135697))) lt!135696))))

(declare-fun b!87623 () Bool)

(declare-fun res!72075 () Bool)

(assert (=> b!87623 (=> (not res!72075) (not e!58081))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87623 (= res!72075 (invariant!0 (currentBit!4468 thiss!1151) (currentByte!4473 thiss!1151) (size!1868 (buf!2258 thiss!1151))))))

(declare-fun b!87624 () Bool)

(declare-fun e!58086 () Bool)

(assert (=> b!87624 (= e!58086 e!58080)))

(declare-fun res!72078 () Bool)

(assert (=> b!87624 (=> (not res!72078) (not e!58080))))

(declare-fun lt!135695 () Bool)

(declare-datatypes ((Unit!5755 0))(
  ( (Unit!5756) )
))
(declare-datatypes ((tuple2!7410 0))(
  ( (tuple2!7411 (_1!3938 Unit!5755) (_2!3938 BitStream!3298)) )
))
(declare-fun lt!135694 () tuple2!7410)

(assert (=> b!87624 (= res!72078 (and (= (_2!3937 lt!135697) lt!135695) (= (_1!3937 lt!135697) (_2!3938 lt!135694))))))

(declare-fun readBitPure!0 (BitStream!3298) tuple2!7408)

(declare-fun readerFrom!0 (BitStream!3298 (_ BitVec 32) (_ BitVec 32)) BitStream!3298)

(assert (=> b!87624 (= lt!135697 (readBitPure!0 (readerFrom!0 (_2!3938 lt!135694) (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152))))))

(declare-fun b!87625 () Bool)

(declare-fun res!72079 () Bool)

(declare-fun e!58078 () Bool)

(assert (=> b!87625 (=> res!72079 e!58078)))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!87625 (= res!72079 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1868 (buf!2258 (_2!3938 lt!135694))) (size!1868 (buf!2258 thiss!1151))))))))

(declare-fun b!87626 () Bool)

(declare-fun e!58085 () Bool)

(declare-fun array_inv!1714 (array!4134) Bool)

(assert (=> b!87626 (= e!58085 (array_inv!1714 (buf!2258 thiss!1151)))))

(declare-fun b!87627 () Bool)

(declare-fun res!72069 () Bool)

(assert (=> b!87627 (=> (not res!72069) (not e!58081))))

(assert (=> b!87627 (= res!72069 (and (bvsle i!576 nBits!336) (= (size!1868 (buf!2258 thiss!1152)) (size!1868 (buf!2258 thiss!1151)))))))

(declare-fun b!87628 () Bool)

(declare-fun e!58083 () Bool)

(assert (=> b!87628 (= e!58083 (array_inv!1714 (buf!2258 thiss!1152)))))

(declare-fun b!87629 () Bool)

(declare-fun res!72070 () Bool)

(assert (=> b!87629 (=> res!72070 e!58078)))

(assert (=> b!87629 (= res!72070 (not (= (bitIndex!0 (size!1868 (buf!2258 (_2!3938 lt!135694))) (currentByte!4473 (_2!3938 lt!135694)) (currentBit!4468 (_2!3938 lt!135694))) (bvadd lt!135699 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!87620 () Bool)

(declare-fun e!58079 () Bool)

(assert (=> b!87620 (= e!58079 e!58086)))

(declare-fun res!72072 () Bool)

(assert (=> b!87620 (=> (not res!72072) (not e!58086))))

(assert (=> b!87620 (= res!72072 (= lt!135696 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135698)))))

(assert (=> b!87620 (= lt!135696 (bitIndex!0 (size!1868 (buf!2258 (_2!3938 lt!135694))) (currentByte!4473 (_2!3938 lt!135694)) (currentBit!4468 (_2!3938 lt!135694))))))

(declare-fun res!72081 () Bool)

(assert (=> start!17866 (=> (not res!72081) (not e!58081))))

(assert (=> start!17866 (= res!72081 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17866 e!58081))

(declare-fun inv!12 (BitStream!3298) Bool)

(assert (=> start!17866 (and (inv!12 thiss!1152) e!58083)))

(assert (=> start!17866 (and (inv!12 thiss!1151) e!58085)))

(assert (=> start!17866 true))

(declare-fun b!87630 () Bool)

(declare-fun res!72076 () Bool)

(assert (=> b!87630 (=> (not res!72076) (not e!58086))))

(declare-fun isPrefixOf!0 (BitStream!3298 BitStream!3298) Bool)

(assert (=> b!87630 (= res!72076 (isPrefixOf!0 thiss!1152 (_2!3938 lt!135694)))))

(declare-fun b!87631 () Bool)

(declare-fun res!72073 () Bool)

(assert (=> b!87631 (=> (not res!72073) (not e!58081))))

(assert (=> b!87631 (= res!72073 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87632 () Bool)

(declare-fun res!72074 () Bool)

(assert (=> b!87632 (=> (not res!72074) (not e!58081))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87632 (= res!72074 (validate_offset_bits!1 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1151))) ((_ sign_extend 32) (currentByte!4473 thiss!1151)) ((_ sign_extend 32) (currentBit!4468 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87633 () Bool)

(declare-fun res!72067 () Bool)

(assert (=> b!87633 (=> (not res!72067) (not e!58082))))

(assert (=> b!87633 (= res!72067 (validate_offset_bits!1 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1152))) ((_ sign_extend 32) (currentByte!4473 thiss!1152)) ((_ sign_extend 32) (currentBit!4468 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87634 () Bool)

(declare-fun res!72068 () Bool)

(assert (=> b!87634 (=> (not res!72068) (not e!58082))))

(assert (=> b!87634 (= res!72068 (bvslt i!576 nBits!336))))

(declare-fun b!87635 () Bool)

(declare-fun res!72082 () Bool)

(assert (=> b!87635 (=> (not res!72082) (not e!58081))))

(assert (=> b!87635 (= res!72082 (invariant!0 (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152) (size!1868 (buf!2258 thiss!1152))))))

(declare-fun b!87636 () Bool)

(assert (=> b!87636 (= e!58082 (not e!58078))))

(declare-fun res!72077 () Bool)

(assert (=> b!87636 (=> res!72077 e!58078)))

(assert (=> b!87636 (= res!72077 (not (invariant!0 (currentBit!4468 (_2!3938 lt!135694)) (currentByte!4473 (_2!3938 lt!135694)) (size!1868 (buf!2258 (_2!3938 lt!135694))))))))

(assert (=> b!87636 e!58079))

(declare-fun res!72071 () Bool)

(assert (=> b!87636 (=> (not res!72071) (not e!58079))))

(assert (=> b!87636 (= res!72071 (= (size!1868 (buf!2258 thiss!1152)) (size!1868 (buf!2258 (_2!3938 lt!135694)))))))

(declare-fun appendBit!0 (BitStream!3298 Bool) tuple2!7410)

(assert (=> b!87636 (= lt!135694 (appendBit!0 thiss!1152 lt!135695))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87636 (= lt!135695 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87637 () Bool)

(assert (=> b!87637 (= e!58078 (or (bvsgt ((_ sign_extend 32) (size!1868 (buf!2258 (_2!3938 lt!135694)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4473 (_2!3938 lt!135694))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4468 (_2!3938 lt!135694))) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1868 (buf!2258 (_2!3938 lt!135694)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4473 (_2!3938 lt!135694))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4468 (_2!3938 lt!135694))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!17866 res!72081) b!87632))

(assert (= (and b!87632 res!72074) b!87623))

(assert (= (and b!87623 res!72075) b!87631))

(assert (= (and b!87631 res!72073) b!87635))

(assert (= (and b!87635 res!72082) b!87627))

(assert (= (and b!87627 res!72069) b!87621))

(assert (= (and b!87621 res!72080) b!87633))

(assert (= (and b!87633 res!72067) b!87634))

(assert (= (and b!87634 res!72068) b!87636))

(assert (= (and b!87636 res!72071) b!87620))

(assert (= (and b!87620 res!72072) b!87630))

(assert (= (and b!87630 res!72076) b!87624))

(assert (= (and b!87624 res!72078) b!87622))

(assert (= (and b!87636 (not res!72077)) b!87625))

(assert (= (and b!87625 (not res!72079)) b!87629))

(assert (= (and b!87629 (not res!72070)) b!87637))

(assert (= start!17866 b!87628))

(assert (= start!17866 b!87626))

(declare-fun m!133037 () Bool)

(assert (=> b!87624 m!133037))

(assert (=> b!87624 m!133037))

(declare-fun m!133039 () Bool)

(assert (=> b!87624 m!133039))

(declare-fun m!133041 () Bool)

(assert (=> b!87623 m!133041))

(declare-fun m!133043 () Bool)

(assert (=> b!87622 m!133043))

(declare-fun m!133045 () Bool)

(assert (=> b!87626 m!133045))

(declare-fun m!133047 () Bool)

(assert (=> b!87630 m!133047))

(declare-fun m!133049 () Bool)

(assert (=> b!87633 m!133049))

(declare-fun m!133051 () Bool)

(assert (=> b!87635 m!133051))

(declare-fun m!133053 () Bool)

(assert (=> b!87628 m!133053))

(declare-fun m!133055 () Bool)

(assert (=> b!87620 m!133055))

(declare-fun m!133057 () Bool)

(assert (=> b!87621 m!133057))

(declare-fun m!133059 () Bool)

(assert (=> b!87621 m!133059))

(declare-fun m!133061 () Bool)

(assert (=> b!87636 m!133061))

(declare-fun m!133063 () Bool)

(assert (=> b!87636 m!133063))

(assert (=> b!87629 m!133055))

(declare-fun m!133065 () Bool)

(assert (=> b!87632 m!133065))

(declare-fun m!133067 () Bool)

(assert (=> start!17866 m!133067))

(declare-fun m!133069 () Bool)

(assert (=> start!17866 m!133069))

(push 1)

(assert (not b!87623))

(assert (not start!17866))

(assert (not b!87635))

(assert (not b!87632))

(assert (not b!87624))

(assert (not b!87628))

(assert (not b!87636))

(assert (not b!87626))

(assert (not b!87621))

(assert (not b!87629))

(assert (not b!87630))

(assert (not b!87620))

(assert (not b!87633))

(assert (not b!87622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27588 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27588 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1152))) ((_ sign_extend 32) (currentByte!4473 thiss!1152)) ((_ sign_extend 32) (currentBit!4468 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1152))) ((_ sign_extend 32) (currentByte!4473 thiss!1152)) ((_ sign_extend 32) (currentBit!4468 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6839 () Bool)

(assert (= bs!6839 d!27588))

(declare-fun m!133167 () Bool)

(assert (=> bs!6839 m!133167))

(assert (=> b!87633 d!27588))

(declare-fun d!27590 () Bool)

(declare-fun e!58170 () Bool)

(assert (=> d!27590 e!58170))

(declare-fun res!72221 () Bool)

(assert (=> d!27590 (=> (not res!72221) (not e!58170))))

(declare-fun lt!135802 () (_ BitVec 64))

(declare-fun lt!135800 () (_ BitVec 64))

(declare-fun lt!135803 () (_ BitVec 64))

(assert (=> d!27590 (= res!72221 (= lt!135800 (bvsub lt!135802 lt!135803)))))

(assert (=> d!27590 (or (= (bvand lt!135802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135803 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135802 lt!135803) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27590 (= lt!135803 (remainingBits!0 ((_ sign_extend 32) (size!1868 (buf!2258 (_1!3937 lt!135697)))) ((_ sign_extend 32) (currentByte!4473 (_1!3937 lt!135697))) ((_ sign_extend 32) (currentBit!4468 (_1!3937 lt!135697)))))))

(declare-fun lt!135799 () (_ BitVec 64))

(declare-fun lt!135804 () (_ BitVec 64))

(assert (=> d!27590 (= lt!135802 (bvmul lt!135799 lt!135804))))

(assert (=> d!27590 (or (= lt!135799 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135804 (bvsdiv (bvmul lt!135799 lt!135804) lt!135799)))))

(assert (=> d!27590 (= lt!135804 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27590 (= lt!135799 ((_ sign_extend 32) (size!1868 (buf!2258 (_1!3937 lt!135697)))))))

(assert (=> d!27590 (= lt!135800 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4473 (_1!3937 lt!135697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4468 (_1!3937 lt!135697)))))))

(assert (=> d!27590 (invariant!0 (currentBit!4468 (_1!3937 lt!135697)) (currentByte!4473 (_1!3937 lt!135697)) (size!1868 (buf!2258 (_1!3937 lt!135697))))))

(assert (=> d!27590 (= (bitIndex!0 (size!1868 (buf!2258 (_1!3937 lt!135697))) (currentByte!4473 (_1!3937 lt!135697)) (currentBit!4468 (_1!3937 lt!135697))) lt!135800)))

(declare-fun b!87787 () Bool)

(declare-fun res!72220 () Bool)

(assert (=> b!87787 (=> (not res!72220) (not e!58170))))

(assert (=> b!87787 (= res!72220 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135800))))

(declare-fun b!87788 () Bool)

(declare-fun lt!135801 () (_ BitVec 64))

(assert (=> b!87788 (= e!58170 (bvsle lt!135800 (bvmul lt!135801 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87788 (or (= lt!135801 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135801 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135801)))))

(assert (=> b!87788 (= lt!135801 ((_ sign_extend 32) (size!1868 (buf!2258 (_1!3937 lt!135697)))))))

(assert (= (and d!27590 res!72221) b!87787))

(assert (= (and b!87787 res!72220) b!87788))

(declare-fun m!133171 () Bool)

(assert (=> d!27590 m!133171))

(declare-fun m!133173 () Bool)

(assert (=> d!27590 m!133173))

(assert (=> b!87622 d!27590))

(declare-fun d!27604 () Bool)

(assert (=> d!27604 (= (invariant!0 (currentBit!4468 thiss!1151) (currentByte!4473 thiss!1151) (size!1868 (buf!2258 thiss!1151))) (and (bvsge (currentBit!4468 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4468 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4473 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4473 thiss!1151) (size!1868 (buf!2258 thiss!1151))) (and (= (currentBit!4468 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4473 thiss!1151) (size!1868 (buf!2258 thiss!1151)))))))))

(assert (=> b!87623 d!27604))

(declare-fun d!27606 () Bool)

(declare-fun e!58171 () Bool)

(assert (=> d!27606 e!58171))

(declare-fun res!72223 () Bool)

(assert (=> d!27606 (=> (not res!72223) (not e!58171))))

(declare-fun lt!135808 () (_ BitVec 64))

(declare-fun lt!135809 () (_ BitVec 64))

(declare-fun lt!135806 () (_ BitVec 64))

(assert (=> d!27606 (= res!72223 (= lt!135806 (bvsub lt!135808 lt!135809)))))

(assert (=> d!27606 (or (= (bvand lt!135808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135809 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135808 lt!135809) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27606 (= lt!135809 (remainingBits!0 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1152))) ((_ sign_extend 32) (currentByte!4473 thiss!1152)) ((_ sign_extend 32) (currentBit!4468 thiss!1152))))))

(declare-fun lt!135805 () (_ BitVec 64))

(declare-fun lt!135810 () (_ BitVec 64))

(assert (=> d!27606 (= lt!135808 (bvmul lt!135805 lt!135810))))

(assert (=> d!27606 (or (= lt!135805 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135810 (bvsdiv (bvmul lt!135805 lt!135810) lt!135805)))))

(assert (=> d!27606 (= lt!135810 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27606 (= lt!135805 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1152))))))

(assert (=> d!27606 (= lt!135806 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4473 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4468 thiss!1152))))))

(assert (=> d!27606 (invariant!0 (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152) (size!1868 (buf!2258 thiss!1152)))))

(assert (=> d!27606 (= (bitIndex!0 (size!1868 (buf!2258 thiss!1152)) (currentByte!4473 thiss!1152) (currentBit!4468 thiss!1152)) lt!135806)))

(declare-fun b!87789 () Bool)

(declare-fun res!72222 () Bool)

(assert (=> b!87789 (=> (not res!72222) (not e!58171))))

(assert (=> b!87789 (= res!72222 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135806))))

(declare-fun b!87790 () Bool)

(declare-fun lt!135807 () (_ BitVec 64))

(assert (=> b!87790 (= e!58171 (bvsle lt!135806 (bvmul lt!135807 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87790 (or (= lt!135807 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135807 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135807)))))

(assert (=> b!87790 (= lt!135807 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1152))))))

(assert (= (and d!27606 res!72223) b!87789))

(assert (= (and b!87789 res!72222) b!87790))

(assert (=> d!27606 m!133167))

(assert (=> d!27606 m!133051))

(assert (=> b!87621 d!27606))

(declare-fun d!27608 () Bool)

(declare-fun e!58172 () Bool)

(assert (=> d!27608 e!58172))

(declare-fun res!72225 () Bool)

(assert (=> d!27608 (=> (not res!72225) (not e!58172))))

(declare-fun lt!135812 () (_ BitVec 64))

(declare-fun lt!135814 () (_ BitVec 64))

(declare-fun lt!135815 () (_ BitVec 64))

(assert (=> d!27608 (= res!72225 (= lt!135812 (bvsub lt!135814 lt!135815)))))

(assert (=> d!27608 (or (= (bvand lt!135814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135814 lt!135815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27608 (= lt!135815 (remainingBits!0 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1151))) ((_ sign_extend 32) (currentByte!4473 thiss!1151)) ((_ sign_extend 32) (currentBit!4468 thiss!1151))))))

(declare-fun lt!135811 () (_ BitVec 64))

(declare-fun lt!135816 () (_ BitVec 64))

(assert (=> d!27608 (= lt!135814 (bvmul lt!135811 lt!135816))))

(assert (=> d!27608 (or (= lt!135811 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135816 (bvsdiv (bvmul lt!135811 lt!135816) lt!135811)))))

(assert (=> d!27608 (= lt!135816 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27608 (= lt!135811 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1151))))))

(assert (=> d!27608 (= lt!135812 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4473 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4468 thiss!1151))))))

(assert (=> d!27608 (invariant!0 (currentBit!4468 thiss!1151) (currentByte!4473 thiss!1151) (size!1868 (buf!2258 thiss!1151)))))

(assert (=> d!27608 (= (bitIndex!0 (size!1868 (buf!2258 thiss!1151)) (currentByte!4473 thiss!1151) (currentBit!4468 thiss!1151)) lt!135812)))

(declare-fun b!87791 () Bool)

(declare-fun res!72224 () Bool)

(assert (=> b!87791 (=> (not res!72224) (not e!58172))))

(assert (=> b!87791 (= res!72224 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135812))))

(declare-fun b!87792 () Bool)

(declare-fun lt!135813 () (_ BitVec 64))

(assert (=> b!87792 (= e!58172 (bvsle lt!135812 (bvmul lt!135813 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87792 (or (= lt!135813 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135813 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135813)))))

(assert (=> b!87792 (= lt!135813 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1151))))))

(assert (= (and d!27608 res!72225) b!87791))

(assert (= (and b!87791 res!72224) b!87792))

(declare-fun m!133175 () Bool)

(assert (=> d!27608 m!133175))

(assert (=> d!27608 m!133041))

(assert (=> b!87621 d!27608))

(declare-fun d!27610 () Bool)

(assert (=> d!27610 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1151))) ((_ sign_extend 32) (currentByte!4473 thiss!1151)) ((_ sign_extend 32) (currentBit!4468 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1151))) ((_ sign_extend 32) (currentByte!4473 thiss!1151)) ((_ sign_extend 32) (currentBit!4468 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6842 () Bool)

(assert (= bs!6842 d!27610))

(assert (=> bs!6842 m!133175))

(assert (=> b!87632 d!27610))

(declare-fun d!27612 () Bool)

(assert (=> d!27612 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152) (size!1868 (buf!2258 thiss!1152))))))

(declare-fun bs!6843 () Bool)

(assert (= bs!6843 d!27612))

(assert (=> bs!6843 m!133051))

(assert (=> start!17866 d!27612))

(declare-fun d!27614 () Bool)

(assert (=> d!27614 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4468 thiss!1151) (currentByte!4473 thiss!1151) (size!1868 (buf!2258 thiss!1151))))))

(declare-fun bs!6844 () Bool)

(assert (= bs!6844 d!27614))

(assert (=> bs!6844 m!133041))

(assert (=> start!17866 d!27614))

(declare-fun d!27616 () Bool)

(assert (=> d!27616 (= (invariant!0 (currentBit!4468 (_2!3938 lt!135694)) (currentByte!4473 (_2!3938 lt!135694)) (size!1868 (buf!2258 (_2!3938 lt!135694)))) (and (bvsge (currentBit!4468 (_2!3938 lt!135694)) #b00000000000000000000000000000000) (bvslt (currentBit!4468 (_2!3938 lt!135694)) #b00000000000000000000000000001000) (bvsge (currentByte!4473 (_2!3938 lt!135694)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4473 (_2!3938 lt!135694)) (size!1868 (buf!2258 (_2!3938 lt!135694)))) (and (= (currentBit!4468 (_2!3938 lt!135694)) #b00000000000000000000000000000000) (= (currentByte!4473 (_2!3938 lt!135694)) (size!1868 (buf!2258 (_2!3938 lt!135694))))))))))

(assert (=> b!87636 d!27616))

(declare-fun b!87814 () Bool)

(declare-fun e!58183 () Bool)

(declare-fun lt!135826 () tuple2!7408)

(declare-fun lt!135827 () tuple2!7410)

(assert (=> b!87814 (= e!58183 (= (bitIndex!0 (size!1868 (buf!2258 (_1!3937 lt!135826))) (currentByte!4473 (_1!3937 lt!135826)) (currentBit!4468 (_1!3937 lt!135826))) (bitIndex!0 (size!1868 (buf!2258 (_2!3938 lt!135827))) (currentByte!4473 (_2!3938 lt!135827)) (currentBit!4468 (_2!3938 lt!135827)))))))

(declare-fun b!87812 () Bool)

(declare-fun res!72244 () Bool)

(declare-fun e!58184 () Bool)

(assert (=> b!87812 (=> (not res!72244) (not e!58184))))

(assert (=> b!87812 (= res!72244 (isPrefixOf!0 thiss!1152 (_2!3938 lt!135827)))))

(declare-fun d!27618 () Bool)

(assert (=> d!27618 e!58184))

(declare-fun res!72245 () Bool)

(assert (=> d!27618 (=> (not res!72245) (not e!58184))))

(assert (=> d!27618 (= res!72245 (= (size!1868 (buf!2258 thiss!1152)) (size!1868 (buf!2258 (_2!3938 lt!135827)))))))

(declare-fun choose!16 (BitStream!3298 Bool) tuple2!7410)

(assert (=> d!27618 (= lt!135827 (choose!16 thiss!1152 lt!135695))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27618 (validate_offset_bit!0 ((_ sign_extend 32) (size!1868 (buf!2258 thiss!1152))) ((_ sign_extend 32) (currentByte!4473 thiss!1152)) ((_ sign_extend 32) (currentBit!4468 thiss!1152)))))

(assert (=> d!27618 (= (appendBit!0 thiss!1152 lt!135695) lt!135827)))

(declare-fun b!87811 () Bool)

(declare-fun res!72243 () Bool)

(assert (=> b!87811 (=> (not res!72243) (not e!58184))))

(declare-fun lt!135825 () (_ BitVec 64))

(declare-fun lt!135828 () (_ BitVec 64))

(assert (=> b!87811 (= res!72243 (= (bitIndex!0 (size!1868 (buf!2258 (_2!3938 lt!135827))) (currentByte!4473 (_2!3938 lt!135827)) (currentBit!4468 (_2!3938 lt!135827))) (bvadd lt!135828 lt!135825)))))

(assert (=> b!87811 (or (not (= (bvand lt!135828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135825 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135828 lt!135825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!87811 (= lt!135825 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!87811 (= lt!135828 (bitIndex!0 (size!1868 (buf!2258 thiss!1152)) (currentByte!4473 thiss!1152) (currentBit!4468 thiss!1152)))))

(declare-fun b!87813 () Bool)

(assert (=> b!87813 (= e!58184 e!58183)))

(declare-fun res!72246 () Bool)

(assert (=> b!87813 (=> (not res!72246) (not e!58183))))

(assert (=> b!87813 (= res!72246 (and (= (_2!3937 lt!135826) lt!135695) (= (_1!3937 lt!135826) (_2!3938 lt!135827))))))

(assert (=> b!87813 (= lt!135826 (readBitPure!0 (readerFrom!0 (_2!3938 lt!135827) (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152))))))

(assert (= (and d!27618 res!72245) b!87811))

(assert (= (and b!87811 res!72243) b!87812))

(assert (= (and b!87812 res!72244) b!87813))

(assert (= (and b!87813 res!72246) b!87814))

(declare-fun m!133181 () Bool)

(assert (=> b!87814 m!133181))

(declare-fun m!133183 () Bool)

(assert (=> b!87814 m!133183))

(declare-fun m!133185 () Bool)

(assert (=> b!87812 m!133185))

(declare-fun m!133187 () Bool)

(assert (=> d!27618 m!133187))

(declare-fun m!133189 () Bool)

(assert (=> d!27618 m!133189))

(declare-fun m!133191 () Bool)

(assert (=> b!87813 m!133191))

(assert (=> b!87813 m!133191))

(declare-fun m!133193 () Bool)

(assert (=> b!87813 m!133193))

(assert (=> b!87811 m!133183))

(assert (=> b!87811 m!133057))

(assert (=> b!87636 d!27618))

(declare-fun d!27632 () Bool)

(assert (=> d!27632 (= (invariant!0 (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152) (size!1868 (buf!2258 thiss!1152))) (and (bvsge (currentBit!4468 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4468 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4473 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4473 thiss!1152) (size!1868 (buf!2258 thiss!1152))) (and (= (currentBit!4468 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4473 thiss!1152) (size!1868 (buf!2258 thiss!1152)))))))))

(assert (=> b!87635 d!27632))

(declare-fun d!27634 () Bool)

(declare-datatypes ((tuple2!7422 0))(
  ( (tuple2!7423 (_1!3944 Bool) (_2!3944 BitStream!3298)) )
))
(declare-fun lt!135831 () tuple2!7422)

(declare-fun readBit!0 (BitStream!3298) tuple2!7422)

(assert (=> d!27634 (= lt!135831 (readBit!0 (readerFrom!0 (_2!3938 lt!135694) (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152))))))

(assert (=> d!27634 (= (readBitPure!0 (readerFrom!0 (_2!3938 lt!135694) (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152))) (tuple2!7409 (_2!3944 lt!135831) (_1!3944 lt!135831)))))

(declare-fun bs!6848 () Bool)

(assert (= bs!6848 d!27634))

(assert (=> bs!6848 m!133037))

(declare-fun m!133195 () Bool)

(assert (=> bs!6848 m!133195))

(assert (=> b!87624 d!27634))

(declare-fun d!27636 () Bool)

(declare-fun e!58189 () Bool)

(assert (=> d!27636 e!58189))

(declare-fun res!72254 () Bool)

(assert (=> d!27636 (=> (not res!72254) (not e!58189))))

(assert (=> d!27636 (= res!72254 (invariant!0 (currentBit!4468 (_2!3938 lt!135694)) (currentByte!4473 (_2!3938 lt!135694)) (size!1868 (buf!2258 (_2!3938 lt!135694)))))))

(assert (=> d!27636 (= (readerFrom!0 (_2!3938 lt!135694) (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152)) (BitStream!3299 (buf!2258 (_2!3938 lt!135694)) (currentByte!4473 thiss!1152) (currentBit!4468 thiss!1152)))))

(declare-fun b!87821 () Bool)

(assert (=> b!87821 (= e!58189 (invariant!0 (currentBit!4468 thiss!1152) (currentByte!4473 thiss!1152) (size!1868 (buf!2258 (_2!3938 lt!135694)))))))

(assert (= (and d!27636 res!72254) b!87821))

(assert (=> d!27636 m!133061))

(declare-fun m!133197 () Bool)

(assert (=> b!87821 m!133197))

(assert (=> b!87624 d!27636))

(declare-fun d!27638 () Bool)

(assert (=> d!27638 (= (array_inv!1714 (buf!2258 thiss!1152)) (bvsge (size!1868 (buf!2258 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!87628 d!27638))

(declare-fun d!27640 () Bool)

(assert (=> d!27640 (= (array_inv!1714 (buf!2258 thiss!1151)) (bvsge (size!1868 (buf!2258 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!87626 d!27640))

(declare-fun d!27642 () Bool)

(declare-fun res!72269 () Bool)

(declare-fun e!58199 () Bool)

(assert (=> d!27642 (=> (not res!72269) (not e!58199))))

(assert (=> d!27642 (= res!72269 (= (size!1868 (buf!2258 thiss!1152)) (size!1868 (buf!2258 (_2!3938 lt!135694)))))))

(assert (=> d!27642 (= (isPrefixOf!0 thiss!1152 (_2!3938 lt!135694)) e!58199)))

(declare-fun b!87836 () Bool)

(declare-fun res!72270 () Bool)

(assert (=> b!87836 (=> (not res!72270) (not e!58199))))

(assert (=> b!87836 (= res!72270 (bvsle (bitIndex!0 (size!1868 (buf!2258 thiss!1152)) (currentByte!4473 thiss!1152) (currentBit!4468 thiss!1152)) (bitIndex!0 (size!1868 (buf!2258 (_2!3938 lt!135694))) (currentByte!4473 (_2!3938 lt!135694)) (currentBit!4468 (_2!3938 lt!135694)))))))

(declare-fun b!87837 () Bool)

(declare-fun e!58198 () Bool)

(assert (=> b!87837 (= e!58199 e!58198)))

(declare-fun res!72271 () Bool)

(assert (=> b!87837 (=> res!72271 e!58198)))

(assert (=> b!87837 (= res!72271 (= (size!1868 (buf!2258 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!87838 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4134 array!4134 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87838 (= e!58198 (arrayBitRangesEq!0 (buf!2258 thiss!1152) (buf!2258 (_2!3938 lt!135694)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1868 (buf!2258 thiss!1152)) (currentByte!4473 thiss!1152) (currentBit!4468 thiss!1152))))))

(assert (= (and d!27642 res!72269) b!87836))

(assert (= (and b!87836 res!72270) b!87837))

(assert (= (and b!87837 (not res!72271)) b!87838))

(assert (=> b!87836 m!133057))

(assert (=> b!87836 m!133055))

(assert (=> b!87838 m!133057))

(assert (=> b!87838 m!133057))

(declare-fun m!133207 () Bool)

(assert (=> b!87838 m!133207))

(assert (=> b!87630 d!27642))

(declare-fun d!27654 () Bool)

(declare-fun e!58200 () Bool)

(assert (=> d!27654 e!58200))

(declare-fun res!72273 () Bool)

(assert (=> d!27654 (=> (not res!72273) (not e!58200))))

(declare-fun lt!135871 () (_ BitVec 64))

(declare-fun lt!135872 () (_ BitVec 64))

(declare-fun lt!135869 () (_ BitVec 64))

(assert (=> d!27654 (= res!72273 (= lt!135869 (bvsub lt!135871 lt!135872)))))

(assert (=> d!27654 (or (= (bvand lt!135871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135872 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135871 lt!135872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27654 (= lt!135872 (remainingBits!0 ((_ sign_extend 32) (size!1868 (buf!2258 (_2!3938 lt!135694)))) ((_ sign_extend 32) (currentByte!4473 (_2!3938 lt!135694))) ((_ sign_extend 32) (currentBit!4468 (_2!3938 lt!135694)))))))

(declare-fun lt!135868 () (_ BitVec 64))

(declare-fun lt!135873 () (_ BitVec 64))

(assert (=> d!27654 (= lt!135871 (bvmul lt!135868 lt!135873))))

(assert (=> d!27654 (or (= lt!135868 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135873 (bvsdiv (bvmul lt!135868 lt!135873) lt!135868)))))

(assert (=> d!27654 (= lt!135873 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27654 (= lt!135868 ((_ sign_extend 32) (size!1868 (buf!2258 (_2!3938 lt!135694)))))))

(assert (=> d!27654 (= lt!135869 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4473 (_2!3938 lt!135694))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4468 (_2!3938 lt!135694)))))))

(assert (=> d!27654 (invariant!0 (currentBit!4468 (_2!3938 lt!135694)) (currentByte!4473 (_2!3938 lt!135694)) (size!1868 (buf!2258 (_2!3938 lt!135694))))))

(assert (=> d!27654 (= (bitIndex!0 (size!1868 (buf!2258 (_2!3938 lt!135694))) (currentByte!4473 (_2!3938 lt!135694)) (currentBit!4468 (_2!3938 lt!135694))) lt!135869)))

(declare-fun b!87839 () Bool)

(declare-fun res!72272 () Bool)

(assert (=> b!87839 (=> (not res!72272) (not e!58200))))

(assert (=> b!87839 (= res!72272 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135869))))

(declare-fun b!87840 () Bool)

(declare-fun lt!135870 () (_ BitVec 64))

(assert (=> b!87840 (= e!58200 (bvsle lt!135869 (bvmul lt!135870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!87840 (or (= lt!135870 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135870 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135870)))))

(assert (=> b!87840 (= lt!135870 ((_ sign_extend 32) (size!1868 (buf!2258 (_2!3938 lt!135694)))))))

(assert (= (and d!27654 res!72273) b!87839))

(assert (= (and b!87839 res!72272) b!87840))

(declare-fun m!133209 () Bool)

(assert (=> d!27654 m!133209))

(assert (=> d!27654 m!133061))

(assert (=> b!87620 d!27654))

(assert (=> b!87629 d!27654))

(push 1)

(assert (not b!87821))

(assert (not b!87836))

(assert (not d!27654))

(assert (not b!87811))

(assert (not d!27612))

(assert (not d!27618))

(assert (not b!87838))

(assert (not b!87813))

(assert (not d!27606))

(assert (not d!27610))

(assert (not b!87812))

(assert (not d!27590))

(assert (not d!27608))

(assert (not b!87814))

(assert (not d!27636))

(assert (not d!27634))

(assert (not d!27588))

(assert (not d!27614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

