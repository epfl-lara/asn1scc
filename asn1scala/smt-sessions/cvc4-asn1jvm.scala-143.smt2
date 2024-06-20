; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3356 () Bool)

(assert start!3356)

(declare-fun res!13765 () Bool)

(declare-fun e!9231 () Bool)

(assert (=> start!3356 (=> (not res!13765) (not e!9231))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3356 (= res!13765 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3356 e!9231))

(assert (=> start!3356 true))

(declare-datatypes ((array!877 0))(
  ( (array!878 (arr!801 (Array (_ BitVec 32) (_ BitVec 8))) (size!372 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!704 0))(
  ( (BitStream!705 (buf!723 array!877) (currentByte!1874 (_ BitVec 32)) (currentBit!1869 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!704)

(declare-fun e!9232 () Bool)

(declare-fun inv!12 (BitStream!704) Bool)

(assert (=> start!3356 (and (inv!12 thiss!1073) e!9232)))

(declare-fun b!14727 () Bool)

(declare-fun e!9233 () Bool)

(declare-datatypes ((tuple2!1694 0))(
  ( (tuple2!1695 (_1!908 BitStream!704) (_2!908 Bool)) )
))
(declare-fun lt!22167 () tuple2!1694)

(declare-datatypes ((tuple2!1696 0))(
  ( (tuple2!1697 (_1!909 BitStream!704) (_2!909 BitStream!704)) )
))
(declare-fun lt!22168 () tuple2!1696)

(assert (=> b!14727 (= e!9233 (not (or (not (_2!908 lt!22167)) (not (= (_1!908 lt!22167) (_2!909 lt!22168))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!704 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1694)

(assert (=> b!14727 (= lt!22167 (checkBitsLoopPure!0 (_1!909 lt!22168) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1226 0))(
  ( (Unit!1227) )
))
(declare-datatypes ((tuple2!1698 0))(
  ( (tuple2!1699 (_1!910 Unit!1226) (_2!910 BitStream!704)) )
))
(declare-fun lt!22165 () tuple2!1698)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14727 (validate_offset_bits!1 ((_ sign_extend 32) (size!372 (buf!723 (_2!910 lt!22165)))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073)) nBits!313)))

(declare-fun lt!22166 () Unit!1226)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!704 array!877 (_ BitVec 64)) Unit!1226)

(assert (=> b!14727 (= lt!22166 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!723 (_2!910 lt!22165)) nBits!313))))

(declare-fun reader!0 (BitStream!704 BitStream!704) tuple2!1696)

(assert (=> b!14727 (= lt!22168 (reader!0 thiss!1073 (_2!910 lt!22165)))))

(declare-fun b!14728 () Bool)

(declare-fun array_inv!361 (array!877) Bool)

(assert (=> b!14728 (= e!9232 (array_inv!361 (buf!723 thiss!1073)))))

(declare-fun b!14729 () Bool)

(declare-fun res!13766 () Bool)

(assert (=> b!14729 (=> (not res!13766) (not e!9233))))

(declare-fun isPrefixOf!0 (BitStream!704 BitStream!704) Bool)

(assert (=> b!14729 (= res!13766 (isPrefixOf!0 thiss!1073 (_2!910 lt!22165)))))

(declare-fun b!14730 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14730 (= e!9231 (not (invariant!0 (currentBit!1869 (_2!910 lt!22165)) (currentByte!1874 (_2!910 lt!22165)) (size!372 (buf!723 (_2!910 lt!22165))))))))

(assert (=> b!14730 e!9233))

(declare-fun res!13769 () Bool)

(assert (=> b!14730 (=> (not res!13769) (not e!9233))))

(assert (=> b!14730 (= res!13769 (= (size!372 (buf!723 thiss!1073)) (size!372 (buf!723 (_2!910 lt!22165)))))))

(declare-fun appendNBits!0 (BitStream!704 (_ BitVec 64) Bool) tuple2!1698)

(assert (=> b!14730 (= lt!22165 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!14731 () Bool)

(declare-fun res!13767 () Bool)

(assert (=> b!14731 (=> (not res!13767) (not e!9233))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14731 (= res!13767 (= (bitIndex!0 (size!372 (buf!723 (_2!910 lt!22165))) (currentByte!1874 (_2!910 lt!22165)) (currentBit!1869 (_2!910 lt!22165))) (bvadd (bitIndex!0 (size!372 (buf!723 thiss!1073)) (currentByte!1874 thiss!1073) (currentBit!1869 thiss!1073)) nBits!313)))))

(declare-fun b!14732 () Bool)

(declare-fun res!13768 () Bool)

(assert (=> b!14732 (=> (not res!13768) (not e!9231))))

(assert (=> b!14732 (= res!13768 (validate_offset_bits!1 ((_ sign_extend 32) (size!372 (buf!723 thiss!1073))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073)) nBits!313))))

(assert (= (and start!3356 res!13765) b!14732))

(assert (= (and b!14732 res!13768) b!14730))

(assert (= (and b!14730 res!13769) b!14731))

(assert (= (and b!14731 res!13767) b!14729))

(assert (= (and b!14729 res!13766) b!14727))

(assert (= start!3356 b!14728))

(declare-fun m!21177 () Bool)

(assert (=> b!14728 m!21177))

(declare-fun m!21179 () Bool)

(assert (=> b!14731 m!21179))

(declare-fun m!21181 () Bool)

(assert (=> b!14731 m!21181))

(declare-fun m!21183 () Bool)

(assert (=> b!14729 m!21183))

(declare-fun m!21185 () Bool)

(assert (=> b!14730 m!21185))

(declare-fun m!21187 () Bool)

(assert (=> b!14730 m!21187))

(declare-fun m!21189 () Bool)

(assert (=> b!14732 m!21189))

(declare-fun m!21191 () Bool)

(assert (=> b!14727 m!21191))

(declare-fun m!21193 () Bool)

(assert (=> b!14727 m!21193))

(declare-fun m!21195 () Bool)

(assert (=> b!14727 m!21195))

(declare-fun m!21197 () Bool)

(assert (=> b!14727 m!21197))

(declare-fun m!21199 () Bool)

(assert (=> start!3356 m!21199))

(push 1)

(assert (not b!14730))

(assert (not b!14727))

(assert (not b!14729))

(assert (not b!14728))

(assert (not b!14732))

(assert (not b!14731))

(assert (not start!3356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4848 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4848 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!372 (buf!723 thiss!1073))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!372 (buf!723 thiss!1073))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073))) nBits!313))))

(declare-fun bs!1341 () Bool)

(assert (= bs!1341 d!4848))

(declare-fun m!21201 () Bool)

(assert (=> bs!1341 m!21201))

(assert (=> b!14732 d!4848))

(declare-fun d!4850 () Bool)

(declare-fun e!9239 () Bool)

(assert (=> d!4850 e!9239))

(declare-fun res!13778 () Bool)

(assert (=> d!4850 (=> (not res!13778) (not e!9239))))

(declare-fun lt!22194 () (_ BitVec 64))

(declare-fun lt!22195 () (_ BitVec 64))

(declare-fun lt!22198 () (_ BitVec 64))

(assert (=> d!4850 (= res!13778 (= lt!22195 (bvsub lt!22194 lt!22198)))))

(assert (=> d!4850 (or (= (bvand lt!22194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22198 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22194 lt!22198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4850 (= lt!22198 (remainingBits!0 ((_ sign_extend 32) (size!372 (buf!723 (_2!910 lt!22165)))) ((_ sign_extend 32) (currentByte!1874 (_2!910 lt!22165))) ((_ sign_extend 32) (currentBit!1869 (_2!910 lt!22165)))))))

(declare-fun lt!22193 () (_ BitVec 64))

(declare-fun lt!22197 () (_ BitVec 64))

(assert (=> d!4850 (= lt!22194 (bvmul lt!22193 lt!22197))))

(assert (=> d!4850 (or (= lt!22193 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22197 (bvsdiv (bvmul lt!22193 lt!22197) lt!22193)))))

(assert (=> d!4850 (= lt!22197 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4850 (= lt!22193 ((_ sign_extend 32) (size!372 (buf!723 (_2!910 lt!22165)))))))

(assert (=> d!4850 (= lt!22195 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1874 (_2!910 lt!22165))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1869 (_2!910 lt!22165)))))))

(assert (=> d!4850 (invariant!0 (currentBit!1869 (_2!910 lt!22165)) (currentByte!1874 (_2!910 lt!22165)) (size!372 (buf!723 (_2!910 lt!22165))))))

(assert (=> d!4850 (= (bitIndex!0 (size!372 (buf!723 (_2!910 lt!22165))) (currentByte!1874 (_2!910 lt!22165)) (currentBit!1869 (_2!910 lt!22165))) lt!22195)))

(declare-fun b!14741 () Bool)

(declare-fun res!13779 () Bool)

(assert (=> b!14741 (=> (not res!13779) (not e!9239))))

(assert (=> b!14741 (= res!13779 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22195))))

(declare-fun b!14742 () Bool)

(declare-fun lt!22196 () (_ BitVec 64))

(assert (=> b!14742 (= e!9239 (bvsle lt!22195 (bvmul lt!22196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14742 (or (= lt!22196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22196)))))

(assert (=> b!14742 (= lt!22196 ((_ sign_extend 32) (size!372 (buf!723 (_2!910 lt!22165)))))))

(assert (= (and d!4850 res!13778) b!14741))

(assert (= (and b!14741 res!13779) b!14742))

(declare-fun m!21203 () Bool)

(assert (=> d!4850 m!21203))

(assert (=> d!4850 m!21185))

(assert (=> b!14731 d!4850))

(declare-fun d!4856 () Bool)

(declare-fun e!9241 () Bool)

(assert (=> d!4856 e!9241))

(declare-fun res!13782 () Bool)

(assert (=> d!4856 (=> (not res!13782) (not e!9241))))

(declare-fun lt!22207 () (_ BitVec 64))

(declare-fun lt!22210 () (_ BitVec 64))

(declare-fun lt!22206 () (_ BitVec 64))

(assert (=> d!4856 (= res!13782 (= lt!22207 (bvsub lt!22206 lt!22210)))))

(assert (=> d!4856 (or (= (bvand lt!22206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22210 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22206 lt!22210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4856 (= lt!22210 (remainingBits!0 ((_ sign_extend 32) (size!372 (buf!723 thiss!1073))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073))))))

(declare-fun lt!22205 () (_ BitVec 64))

(declare-fun lt!22209 () (_ BitVec 64))

(assert (=> d!4856 (= lt!22206 (bvmul lt!22205 lt!22209))))

(assert (=> d!4856 (or (= lt!22205 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22209 (bvsdiv (bvmul lt!22205 lt!22209) lt!22205)))))

(assert (=> d!4856 (= lt!22209 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4856 (= lt!22205 ((_ sign_extend 32) (size!372 (buf!723 thiss!1073))))))

(assert (=> d!4856 (= lt!22207 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1874 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1869 thiss!1073))))))

(assert (=> d!4856 (invariant!0 (currentBit!1869 thiss!1073) (currentByte!1874 thiss!1073) (size!372 (buf!723 thiss!1073)))))

(assert (=> d!4856 (= (bitIndex!0 (size!372 (buf!723 thiss!1073)) (currentByte!1874 thiss!1073) (currentBit!1869 thiss!1073)) lt!22207)))

(declare-fun b!14745 () Bool)

(declare-fun res!13783 () Bool)

(assert (=> b!14745 (=> (not res!13783) (not e!9241))))

(assert (=> b!14745 (= res!13783 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22207))))

(declare-fun b!14746 () Bool)

(declare-fun lt!22208 () (_ BitVec 64))

(assert (=> b!14746 (= e!9241 (bvsle lt!22207 (bvmul lt!22208 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14746 (or (= lt!22208 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22208 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22208)))))

(assert (=> b!14746 (= lt!22208 ((_ sign_extend 32) (size!372 (buf!723 thiss!1073))))))

(assert (= (and d!4856 res!13782) b!14745))

(assert (= (and b!14745 res!13783) b!14746))

(assert (=> d!4856 m!21201))

(declare-fun m!21207 () Bool)

(assert (=> d!4856 m!21207))

(assert (=> b!14731 d!4856))

(declare-fun d!4860 () Bool)

(assert (=> d!4860 (= (invariant!0 (currentBit!1869 (_2!910 lt!22165)) (currentByte!1874 (_2!910 lt!22165)) (size!372 (buf!723 (_2!910 lt!22165)))) (and (bvsge (currentBit!1869 (_2!910 lt!22165)) #b00000000000000000000000000000000) (bvslt (currentBit!1869 (_2!910 lt!22165)) #b00000000000000000000000000001000) (bvsge (currentByte!1874 (_2!910 lt!22165)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1874 (_2!910 lt!22165)) (size!372 (buf!723 (_2!910 lt!22165)))) (and (= (currentBit!1869 (_2!910 lt!22165)) #b00000000000000000000000000000000) (= (currentByte!1874 (_2!910 lt!22165)) (size!372 (buf!723 (_2!910 lt!22165))))))))))

(assert (=> b!14730 d!4860))

(declare-fun b!14787 () Bool)

(declare-fun e!9259 () Bool)

(assert (=> b!14787 (= e!9259 (validate_offset_bits!1 ((_ sign_extend 32) (size!372 (buf!723 thiss!1073))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073)) nBits!313))))

(declare-fun b!14786 () Bool)

(declare-fun e!9264 () Bool)

(declare-fun lt!22253 () tuple2!1694)

(declare-fun lt!22259 () tuple2!1696)

(assert (=> b!14786 (= e!9264 (and (_2!908 lt!22253) (= (_1!908 lt!22253) (_2!909 lt!22259))))))

(assert (=> b!14786 (= lt!22253 (checkBitsLoopPure!0 (_1!909 lt!22259) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!22258 () Unit!1226)

(declare-fun lt!22251 () Unit!1226)

(assert (=> b!14786 (= lt!22258 lt!22251)))

(declare-fun lt!22255 () tuple2!1698)

(assert (=> b!14786 (validate_offset_bits!1 ((_ sign_extend 32) (size!372 (buf!723 (_2!910 lt!22255)))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073)) nBits!313)))

(assert (=> b!14786 (= lt!22251 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!723 (_2!910 lt!22255)) nBits!313))))

(assert (=> b!14786 e!9259))

(declare-fun res!13819 () Bool)

(assert (=> b!14786 (=> (not res!13819) (not e!9259))))

(assert (=> b!14786 (= res!13819 (and (= (size!372 (buf!723 thiss!1073)) (size!372 (buf!723 (_2!910 lt!22255)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14786 (= lt!22259 (reader!0 thiss!1073 (_2!910 lt!22255)))))

(declare-fun b!14785 () Bool)

(declare-fun res!13824 () Bool)

(assert (=> b!14785 (=> (not res!13824) (not e!9264))))

(assert (=> b!14785 (= res!13824 (isPrefixOf!0 thiss!1073 (_2!910 lt!22255)))))

(declare-fun d!4866 () Bool)

(assert (=> d!4866 e!9264))

(declare-fun res!13823 () Bool)

(assert (=> d!4866 (=> (not res!13823) (not e!9264))))

(assert (=> d!4866 (= res!13823 (= (size!372 (buf!723 thiss!1073)) (size!372 (buf!723 (_2!910 lt!22255)))))))

(declare-fun choose!36 (BitStream!704 (_ BitVec 64) Bool) tuple2!1698)

(assert (=> d!4866 (= lt!22255 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!4866 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4866 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!22255)))

(declare-fun b!14783 () Bool)

(declare-fun res!13821 () Bool)

(assert (=> b!14783 (=> (not res!13821) (not e!9264))))

(declare-fun lt!22257 () (_ BitVec 64))

(assert (=> b!14783 (= res!13821 (= (bitIndex!0 (size!372 (buf!723 (_2!910 lt!22255))) (currentByte!1874 (_2!910 lt!22255)) (currentBit!1869 (_2!910 lt!22255))) (bvadd lt!22257 nBits!313)))))

(assert (=> b!14783 (or (not (= (bvand lt!22257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!22257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!22257 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14783 (= lt!22257 (bitIndex!0 (size!372 (buf!723 thiss!1073)) (currentByte!1874 thiss!1073) (currentBit!1869 thiss!1073)))))

(assert (= (and d!4866 res!13823) b!14783))

(assert (= (and b!14783 res!13821) b!14785))

(assert (= (and b!14785 res!13824) b!14786))

(assert (= (and b!14786 res!13819) b!14787))

(declare-fun m!21215 () Bool)

(assert (=> b!14785 m!21215))

(declare-fun m!21219 () Bool)

(assert (=> b!14786 m!21219))

(declare-fun m!21223 () Bool)

(assert (=> b!14786 m!21223))

(declare-fun m!21227 () Bool)

(assert (=> b!14786 m!21227))

(declare-fun m!21231 () Bool)

(assert (=> b!14786 m!21231))

(declare-fun m!21237 () Bool)

(assert (=> b!14783 m!21237))

(assert (=> b!14783 m!21181))

(assert (=> b!14787 m!21189))

(declare-fun m!21241 () Bool)

(assert (=> d!4866 m!21241))

(assert (=> b!14730 d!4866))

(declare-fun d!4876 () Bool)

(declare-fun res!13838 () Bool)

(declare-fun e!9271 () Bool)

(assert (=> d!4876 (=> (not res!13838) (not e!9271))))

(assert (=> d!4876 (= res!13838 (= (size!372 (buf!723 thiss!1073)) (size!372 (buf!723 (_2!910 lt!22165)))))))

(assert (=> d!4876 (= (isPrefixOf!0 thiss!1073 (_2!910 lt!22165)) e!9271)))

(declare-fun b!14800 () Bool)

(declare-fun res!13837 () Bool)

(assert (=> b!14800 (=> (not res!13837) (not e!9271))))

(assert (=> b!14800 (= res!13837 (bvsle (bitIndex!0 (size!372 (buf!723 thiss!1073)) (currentByte!1874 thiss!1073) (currentBit!1869 thiss!1073)) (bitIndex!0 (size!372 (buf!723 (_2!910 lt!22165))) (currentByte!1874 (_2!910 lt!22165)) (currentBit!1869 (_2!910 lt!22165)))))))

(declare-fun b!14801 () Bool)

(declare-fun e!9272 () Bool)

(assert (=> b!14801 (= e!9271 e!9272)))

(declare-fun res!13839 () Bool)

(assert (=> b!14801 (=> res!13839 e!9272)))

(assert (=> b!14801 (= res!13839 (= (size!372 (buf!723 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!14802 () Bool)

(declare-fun arrayBitRangesEq!0 (array!877 array!877 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14802 (= e!9272 (arrayBitRangesEq!0 (buf!723 thiss!1073) (buf!723 (_2!910 lt!22165)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!372 (buf!723 thiss!1073)) (currentByte!1874 thiss!1073) (currentBit!1869 thiss!1073))))))

(assert (= (and d!4876 res!13838) b!14800))

(assert (= (and b!14800 res!13837) b!14801))

(assert (= (and b!14801 (not res!13839)) b!14802))

(assert (=> b!14800 m!21181))

(assert (=> b!14800 m!21179))

(assert (=> b!14802 m!21181))

(assert (=> b!14802 m!21181))

(declare-fun m!21261 () Bool)

(assert (=> b!14802 m!21261))

(assert (=> b!14729 d!4876))

(declare-fun d!4886 () Bool)

(assert (=> d!4886 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1869 thiss!1073) (currentByte!1874 thiss!1073) (size!372 (buf!723 thiss!1073))))))

(declare-fun bs!1346 () Bool)

(assert (= bs!1346 d!4886))

(assert (=> bs!1346 m!21207))

(assert (=> start!3356 d!4886))

(declare-fun d!4888 () Bool)

(assert (=> d!4888 (= (array_inv!361 (buf!723 thiss!1073)) (bvsge (size!372 (buf!723 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14728 d!4888))

(declare-fun d!4890 () Bool)

(declare-datatypes ((tuple2!1704 0))(
  ( (tuple2!1705 (_1!913 Bool) (_2!913 BitStream!704)) )
))
(declare-fun lt!22284 () tuple2!1704)

(declare-fun checkBitsLoop!0 (BitStream!704 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1704)

(assert (=> d!4890 (= lt!22284 (checkBitsLoop!0 (_1!909 lt!22168) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4890 (= (checkBitsLoopPure!0 (_1!909 lt!22168) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1695 (_2!913 lt!22284) (_1!913 lt!22284)))))

(declare-fun bs!1350 () Bool)

(assert (= bs!1350 d!4890))

(declare-fun m!21269 () Bool)

(assert (=> bs!1350 m!21269))

(assert (=> b!14727 d!4890))

(declare-fun d!4898 () Bool)

(assert (=> d!4898 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!372 (buf!723 (_2!910 lt!22165)))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!372 (buf!723 (_2!910 lt!22165)))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073))) nBits!313))))

(declare-fun bs!1351 () Bool)

(assert (= bs!1351 d!4898))

(declare-fun m!21271 () Bool)

(assert (=> bs!1351 m!21271))

(assert (=> b!14727 d!4898))

(declare-fun d!4900 () Bool)

(assert (=> d!4900 (validate_offset_bits!1 ((_ sign_extend 32) (size!372 (buf!723 (_2!910 lt!22165)))) ((_ sign_extend 32) (currentByte!1874 thiss!1073)) ((_ sign_extend 32) (currentBit!1869 thiss!1073)) nBits!313)))

(declare-fun lt!22288 () Unit!1226)

(declare-fun choose!9 (BitStream!704 array!877 (_ BitVec 64) BitStream!704) Unit!1226)

(assert (=> d!4900 (= lt!22288 (choose!9 thiss!1073 (buf!723 (_2!910 lt!22165)) nBits!313 (BitStream!705 (buf!723 (_2!910 lt!22165)) (currentByte!1874 thiss!1073) (currentBit!1869 thiss!1073))))))

(assert (=> d!4900 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!723 (_2!910 lt!22165)) nBits!313) lt!22288)))

(declare-fun bs!1353 () Bool)

(assert (= bs!1353 d!4900))

(assert (=> bs!1353 m!21193))

(declare-fun m!21275 () Bool)

(assert (=> bs!1353 m!21275))

(assert (=> b!14727 d!4900))

(declare-fun lt!22454 () (_ BitVec 64))

(declare-fun lt!22462 () tuple2!1696)

(declare-fun e!9289 () Bool)

(declare-fun b!14843 () Bool)

(declare-fun lt!22464 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!704 (_ BitVec 64)) BitStream!704)

(assert (=> b!14843 (= e!9289 (= (_1!909 lt!22462) (withMovedBitIndex!0 (_2!909 lt!22462) (bvsub lt!22464 lt!22454))))))

(assert (=> b!14843 (or (= (bvand lt!22464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22454 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22464 lt!22454) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14843 (= lt!22454 (bitIndex!0 (size!372 (buf!723 (_2!910 lt!22165))) (currentByte!1874 (_2!910 lt!22165)) (currentBit!1869 (_2!910 lt!22165))))))

(assert (=> b!14843 (= lt!22464 (bitIndex!0 (size!372 (buf!723 thiss!1073)) (currentByte!1874 thiss!1073) (currentBit!1869 thiss!1073)))))

(declare-fun b!14844 () Bool)

(declare-fun e!9290 () Unit!1226)

(declare-fun lt!22467 () Unit!1226)

(assert (=> b!14844 (= e!9290 lt!22467)))

(declare-fun lt!22460 () (_ BitVec 64))

(assert (=> b!14844 (= lt!22460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22457 () (_ BitVec 64))

(assert (=> b!14844 (= lt!22457 (bitIndex!0 (size!372 (buf!723 thiss!1073)) (currentByte!1874 thiss!1073) (currentBit!1869 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!877 array!877 (_ BitVec 64) (_ BitVec 64)) Unit!1226)

(assert (=> b!14844 (= lt!22467 (arrayBitRangesEqSymmetric!0 (buf!723 thiss!1073) (buf!723 (_2!910 lt!22165)) lt!22460 lt!22457))))

(assert (=> b!14844 (arrayBitRangesEq!0 (buf!723 (_2!910 lt!22165)) (buf!723 thiss!1073) lt!22460 lt!22457)))

(declare-fun b!14845 () Bool)

(declare-fun res!13864 () Bool)

(assert (=> b!14845 (=> (not res!13864) (not e!9289))))

(assert (=> b!14845 (= res!13864 (isPrefixOf!0 (_2!909 lt!22462) (_2!910 lt!22165)))))

(declare-fun d!4904 () Bool)

(assert (=> d!4904 e!9289))

(declare-fun res!13866 () Bool)

(assert (=> d!4904 (=> (not res!13866) (not e!9289))))

(assert (=> d!4904 (= res!13866 (isPrefixOf!0 (_1!909 lt!22462) (_2!909 lt!22462)))))

(declare-fun lt!22461 () BitStream!704)

(assert (=> d!4904 (= lt!22462 (tuple2!1697 lt!22461 (_2!910 lt!22165)))))

(declare-fun lt!22455 () Unit!1226)

(declare-fun lt!22453 () Unit!1226)

(assert (=> d!4904 (= lt!22455 lt!22453)))

(assert (=> d!4904 (isPrefixOf!0 lt!22461 (_2!910 lt!22165))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!704 BitStream!704 BitStream!704) Unit!1226)

(assert (=> d!4904 (= lt!22453 (lemmaIsPrefixTransitive!0 lt!22461 (_2!910 lt!22165) (_2!910 lt!22165)))))

(declare-fun lt!22459 () Unit!1226)

(declare-fun lt!22466 () Unit!1226)

(assert (=> d!4904 (= lt!22459 lt!22466)))

(assert (=> d!4904 (isPrefixOf!0 lt!22461 (_2!910 lt!22165))))

(assert (=> d!4904 (= lt!22466 (lemmaIsPrefixTransitive!0 lt!22461 thiss!1073 (_2!910 lt!22165)))))

(declare-fun lt!22451 () Unit!1226)

(assert (=> d!4904 (= lt!22451 e!9290)))

(declare-fun c!1030 () Bool)

(assert (=> d!4904 (= c!1030 (not (= (size!372 (buf!723 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!22463 () Unit!1226)

(declare-fun lt!22449 () Unit!1226)

(assert (=> d!4904 (= lt!22463 lt!22449)))

(assert (=> d!4904 (isPrefixOf!0 (_2!910 lt!22165) (_2!910 lt!22165))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!704) Unit!1226)

(assert (=> d!4904 (= lt!22449 (lemmaIsPrefixRefl!0 (_2!910 lt!22165)))))

(declare-fun lt!22458 () Unit!1226)

(declare-fun lt!22468 () Unit!1226)

(assert (=> d!4904 (= lt!22458 lt!22468)))

(assert (=> d!4904 (= lt!22468 (lemmaIsPrefixRefl!0 (_2!910 lt!22165)))))

(declare-fun lt!22452 () Unit!1226)

(declare-fun lt!22456 () Unit!1226)

(assert (=> d!4904 (= lt!22452 lt!22456)))

(assert (=> d!4904 (isPrefixOf!0 lt!22461 lt!22461)))

(assert (=> d!4904 (= lt!22456 (lemmaIsPrefixRefl!0 lt!22461))))

(declare-fun lt!22465 () Unit!1226)

(declare-fun lt!22450 () Unit!1226)

(assert (=> d!4904 (= lt!22465 lt!22450)))

(assert (=> d!4904 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!4904 (= lt!22450 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!4904 (= lt!22461 (BitStream!705 (buf!723 (_2!910 lt!22165)) (currentByte!1874 thiss!1073) (currentBit!1869 thiss!1073)))))

(assert (=> d!4904 (isPrefixOf!0 thiss!1073 (_2!910 lt!22165))))

(assert (=> d!4904 (= (reader!0 thiss!1073 (_2!910 lt!22165)) lt!22462)))

(declare-fun b!14846 () Bool)

(declare-fun Unit!1230 () Unit!1226)

(assert (=> b!14846 (= e!9290 Unit!1230)))

(declare-fun b!14847 () Bool)

(declare-fun res!13865 () Bool)

(assert (=> b!14847 (=> (not res!13865) (not e!9289))))

(assert (=> b!14847 (= res!13865 (isPrefixOf!0 (_1!909 lt!22462) thiss!1073))))

(assert (= (and d!4904 c!1030) b!14844))

(assert (= (and d!4904 (not c!1030)) b!14846))

(assert (= (and d!4904 res!13866) b!14847))

(assert (= (and b!14847 res!13865) b!14845))

(assert (= (and b!14845 res!13864) b!14843))

(assert (=> b!14844 m!21181))

(declare-fun m!21337 () Bool)

(assert (=> b!14844 m!21337))

(declare-fun m!21339 () Bool)

(assert (=> b!14844 m!21339))

(declare-fun m!21341 () Bool)

(assert (=> b!14845 m!21341))

(declare-fun m!21343 () Bool)

(assert (=> b!14843 m!21343))

(assert (=> b!14843 m!21179))

(assert (=> b!14843 m!21181))

(declare-fun m!21345 () Bool)

(assert (=> b!14847 m!21345))

(declare-fun m!21347 () Bool)

(assert (=> d!4904 m!21347))

(declare-fun m!21349 () Bool)

(assert (=> d!4904 m!21349))

(declare-fun m!21351 () Bool)

(assert (=> d!4904 m!21351))

(declare-fun m!21353 () Bool)

(assert (=> d!4904 m!21353))

(assert (=> d!4904 m!21183))

(declare-fun m!21355 () Bool)

(assert (=> d!4904 m!21355))

(declare-fun m!21357 () Bool)

(assert (=> d!4904 m!21357))

(declare-fun m!21359 () Bool)

(assert (=> d!4904 m!21359))

(declare-fun m!21361 () Bool)

(assert (=> d!4904 m!21361))

(declare-fun m!21363 () Bool)

(assert (=> d!4904 m!21363))

(declare-fun m!21365 () Bool)

(assert (=> d!4904 m!21365))

(assert (=> b!14727 d!4904))

(push 1)

(assert (not d!4856))

(assert (not b!14845))

(assert (not b!14843))

(assert (not d!4850))

(assert (not b!14783))

(assert (not d!4904))

(assert (not b!14847))

(assert (not d!4848))

(assert (not b!14785))

(assert (not b!14786))

(assert (not d!4900))

(assert (not d!4886))

(assert (not d!4898))

(assert (not b!14800))

(assert (not b!14844))

(assert (not d!4890))

(assert (not b!14802))

