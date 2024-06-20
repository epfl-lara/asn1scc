; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55928 () Bool)

(assert start!55928)

(declare-fun b!259823 () Bool)

(declare-fun res!217613 () Bool)

(declare-fun e!180314 () Bool)

(assert (=> b!259823 (=> (not res!217613) (not e!180314))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14218 0))(
  ( (array!14219 (arr!7212 (Array (_ BitVec 32) (_ BitVec 8))) (size!6225 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11372 0))(
  ( (BitStream!11373 (buf!6747 array!14218) (currentByte!12403 (_ BitVec 32)) (currentBit!12398 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11372)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259823 (= res!217613 (validate_offset_bits!1 ((_ sign_extend 32) (size!6225 (buf!6747 thiss!1754))) ((_ sign_extend 32) (currentByte!12403 thiss!1754)) ((_ sign_extend 32) (currentBit!12398 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259824 () Bool)

(declare-fun res!217615 () Bool)

(assert (=> b!259824 (=> (not res!217615) (not e!180314))))

(assert (=> b!259824 (= res!217615 (not (= from!526 nBits!535)))))

(declare-fun lt!401832 () (_ BitVec 64))

(declare-fun lt!401830 () (_ BitVec 64))

(declare-fun b!259825 () Bool)

(declare-fun e!180312 () Bool)

(declare-datatypes ((tuple2!22278 0))(
  ( (tuple2!22279 (_1!12075 Bool) (_2!12075 BitStream!11372)) )
))
(declare-fun lt!401834 () tuple2!22278)

(assert (=> b!259825 (= e!180312 (or (not (= (buf!6747 thiss!1754) (buf!6747 (_2!12075 lt!401834)))) (not (_1!12075 lt!401834)) (let ((bdg!16202 (bvand lt!401832 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!16202 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!16202 (bvand lt!401830 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!217611 () Bool)

(assert (=> start!55928 (=> (not res!217611) (not e!180314))))

(assert (=> start!55928 (= res!217611 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55928 e!180314))

(assert (=> start!55928 true))

(declare-fun e!180313 () Bool)

(declare-fun inv!12 (BitStream!11372) Bool)

(assert (=> start!55928 (and (inv!12 thiss!1754) e!180313)))

(declare-fun b!259826 () Bool)

(declare-fun e!180315 () Bool)

(assert (=> b!259826 (= e!180315 (not e!180312))))

(declare-fun res!217612 () Bool)

(assert (=> b!259826 (=> res!217612 e!180312)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259826 (= res!217612 (bvslt (bvsub lt!401830 from!526) (bitIndex!0 (size!6225 (buf!6747 (_2!12075 lt!401834))) (currentByte!12403 (_2!12075 lt!401834)) (currentBit!12398 (_2!12075 lt!401834)))))))

(assert (=> b!259826 (= lt!401830 (bvadd lt!401832 nBits!535))))

(assert (=> b!259826 (= lt!401832 (bitIndex!0 (size!6225 (buf!6747 thiss!1754)) (currentByte!12403 thiss!1754) (currentBit!12398 thiss!1754)))))

(declare-fun expected!109 () Bool)

(declare-fun lt!401833 () tuple2!22278)

(declare-fun checkBitsLoop!0 (BitStream!11372 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22278)

(assert (=> b!259826 (= lt!401834 (checkBitsLoop!0 (_2!12075 lt!401833) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259826 (validate_offset_bits!1 ((_ sign_extend 32) (size!6225 (buf!6747 (_2!12075 lt!401833)))) ((_ sign_extend 32) (currentByte!12403 (_2!12075 lt!401833))) ((_ sign_extend 32) (currentBit!12398 (_2!12075 lt!401833))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18493 0))(
  ( (Unit!18494) )
))
(declare-fun lt!401831 () Unit!18493)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11372 BitStream!11372 (_ BitVec 64) (_ BitVec 64)) Unit!18493)

(assert (=> b!259826 (= lt!401831 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12075 lt!401833) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259827 () Bool)

(assert (=> b!259827 (= e!180314 e!180315)))

(declare-fun res!217614 () Bool)

(assert (=> b!259827 (=> (not res!217614) (not e!180315))))

(assert (=> b!259827 (= res!217614 (= (_1!12075 lt!401833) expected!109))))

(declare-fun readBit!0 (BitStream!11372) tuple2!22278)

(assert (=> b!259827 (= lt!401833 (readBit!0 thiss!1754))))

(declare-fun b!259828 () Bool)

(declare-fun array_inv!5966 (array!14218) Bool)

(assert (=> b!259828 (= e!180313 (array_inv!5966 (buf!6747 thiss!1754)))))

(assert (= (and start!55928 res!217611) b!259823))

(assert (= (and b!259823 res!217613) b!259824))

(assert (= (and b!259824 res!217615) b!259827))

(assert (= (and b!259827 res!217614) b!259826))

(assert (= (and b!259826 (not res!217612)) b!259825))

(assert (= start!55928 b!259828))

(declare-fun m!389099 () Bool)

(assert (=> start!55928 m!389099))

(declare-fun m!389101 () Bool)

(assert (=> b!259826 m!389101))

(declare-fun m!389103 () Bool)

(assert (=> b!259826 m!389103))

(declare-fun m!389105 () Bool)

(assert (=> b!259826 m!389105))

(declare-fun m!389107 () Bool)

(assert (=> b!259826 m!389107))

(declare-fun m!389109 () Bool)

(assert (=> b!259826 m!389109))

(declare-fun m!389111 () Bool)

(assert (=> b!259828 m!389111))

(declare-fun m!389113 () Bool)

(assert (=> b!259827 m!389113))

(declare-fun m!389115 () Bool)

(assert (=> b!259823 m!389115))

(push 1)

(assert (not b!259823))

(assert (not b!259826))

(assert (not start!55928))

(assert (not b!259828))

(assert (not b!259827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87142 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87142 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6225 (buf!6747 thiss!1754))) ((_ sign_extend 32) (currentByte!12403 thiss!1754)) ((_ sign_extend 32) (currentBit!12398 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6225 (buf!6747 thiss!1754))) ((_ sign_extend 32) (currentByte!12403 thiss!1754)) ((_ sign_extend 32) (currentBit!12398 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22077 () Bool)

(assert (= bs!22077 d!87142))

(declare-fun m!389127 () Bool)

(assert (=> bs!22077 m!389127))

(assert (=> b!259823 d!87142))

(declare-fun d!87146 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87146 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12398 thiss!1754) (currentByte!12403 thiss!1754) (size!6225 (buf!6747 thiss!1754))))))

(declare-fun bs!22078 () Bool)

(assert (= bs!22078 d!87146))

(declare-fun m!389129 () Bool)

(assert (=> bs!22078 m!389129))

(assert (=> start!55928 d!87146))

(declare-fun d!87148 () Bool)

(declare-fun e!180327 () Bool)

(assert (=> d!87148 e!180327))

(declare-fun res!217623 () Bool)

(assert (=> d!87148 (=> (not res!217623) (not e!180327))))

(declare-fun lt!401870 () (_ BitVec 64))

(declare-fun lt!401868 () (_ BitVec 64))

(declare-fun lt!401871 () (_ BitVec 64))

(assert (=> d!87148 (= res!217623 (= lt!401871 (bvsub lt!401868 lt!401870)))))

(assert (=> d!87148 (or (= (bvand lt!401868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401870 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401868 lt!401870) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87148 (= lt!401870 (remainingBits!0 ((_ sign_extend 32) (size!6225 (buf!6747 thiss!1754))) ((_ sign_extend 32) (currentByte!12403 thiss!1754)) ((_ sign_extend 32) (currentBit!12398 thiss!1754))))))

(declare-fun lt!401873 () (_ BitVec 64))

(declare-fun lt!401869 () (_ BitVec 64))

(assert (=> d!87148 (= lt!401868 (bvmul lt!401873 lt!401869))))

(assert (=> d!87148 (or (= lt!401873 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401869 (bvsdiv (bvmul lt!401873 lt!401869) lt!401873)))))

(assert (=> d!87148 (= lt!401869 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87148 (= lt!401873 ((_ sign_extend 32) (size!6225 (buf!6747 thiss!1754))))))

(assert (=> d!87148 (= lt!401871 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12403 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12398 thiss!1754))))))

(assert (=> d!87148 (invariant!0 (currentBit!12398 thiss!1754) (currentByte!12403 thiss!1754) (size!6225 (buf!6747 thiss!1754)))))

(assert (=> d!87148 (= (bitIndex!0 (size!6225 (buf!6747 thiss!1754)) (currentByte!12403 thiss!1754) (currentBit!12398 thiss!1754)) lt!401871)))

(declare-fun b!259836 () Bool)

(declare-fun res!217624 () Bool)

(assert (=> b!259836 (=> (not res!217624) (not e!180327))))

(assert (=> b!259836 (= res!217624 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401871))))

(declare-fun b!259837 () Bool)

(declare-fun lt!401872 () (_ BitVec 64))

(assert (=> b!259837 (= e!180327 (bvsle lt!401871 (bvmul lt!401872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259837 (or (= lt!401872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401872)))))

(assert (=> b!259837 (= lt!401872 ((_ sign_extend 32) (size!6225 (buf!6747 thiss!1754))))))

(assert (= (and d!87148 res!217623) b!259836))

(assert (= (and b!259836 res!217624) b!259837))

(assert (=> d!87148 m!389127))

(assert (=> d!87148 m!389129))

(assert (=> b!259826 d!87148))

(declare-fun d!87158 () Bool)

(assert (=> d!87158 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6225 (buf!6747 (_2!12075 lt!401833)))) ((_ sign_extend 32) (currentByte!12403 (_2!12075 lt!401833))) ((_ sign_extend 32) (currentBit!12398 (_2!12075 lt!401833))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6225 (buf!6747 (_2!12075 lt!401833)))) ((_ sign_extend 32) (currentByte!12403 (_2!12075 lt!401833))) ((_ sign_extend 32) (currentBit!12398 (_2!12075 lt!401833)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22081 () Bool)

(assert (= bs!22081 d!87158))

(declare-fun m!389135 () Bool)

(assert (=> bs!22081 m!389135))

(assert (=> b!259826 d!87158))

(declare-fun d!87160 () Bool)

(declare-fun e!180331 () Bool)

(assert (=> d!87160 e!180331))

(declare-fun res!217625 () Bool)

(assert (=> d!87160 (=> (not res!217625) (not e!180331))))

(declare-fun lt!401874 () (_ BitVec 64))

(declare-fun lt!401876 () (_ BitVec 64))

(declare-fun lt!401877 () (_ BitVec 64))

(assert (=> d!87160 (= res!217625 (= lt!401877 (bvsub lt!401874 lt!401876)))))

(assert (=> d!87160 (or (= (bvand lt!401874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401876 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401874 lt!401876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87160 (= lt!401876 (remainingBits!0 ((_ sign_extend 32) (size!6225 (buf!6747 (_2!12075 lt!401834)))) ((_ sign_extend 32) (currentByte!12403 (_2!12075 lt!401834))) ((_ sign_extend 32) (currentBit!12398 (_2!12075 lt!401834)))))))

(declare-fun lt!401879 () (_ BitVec 64))

(declare-fun lt!401875 () (_ BitVec 64))

(assert (=> d!87160 (= lt!401874 (bvmul lt!401879 lt!401875))))

(assert (=> d!87160 (or (= lt!401879 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401875 (bvsdiv (bvmul lt!401879 lt!401875) lt!401879)))))

(assert (=> d!87160 (= lt!401875 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87160 (= lt!401879 ((_ sign_extend 32) (size!6225 (buf!6747 (_2!12075 lt!401834)))))))

(assert (=> d!87160 (= lt!401877 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12403 (_2!12075 lt!401834))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12398 (_2!12075 lt!401834)))))))

(assert (=> d!87160 (invariant!0 (currentBit!12398 (_2!12075 lt!401834)) (currentByte!12403 (_2!12075 lt!401834)) (size!6225 (buf!6747 (_2!12075 lt!401834))))))

(assert (=> d!87160 (= (bitIndex!0 (size!6225 (buf!6747 (_2!12075 lt!401834))) (currentByte!12403 (_2!12075 lt!401834)) (currentBit!12398 (_2!12075 lt!401834))) lt!401877)))

(declare-fun b!259838 () Bool)

(declare-fun res!217626 () Bool)

(assert (=> b!259838 (=> (not res!217626) (not e!180331))))

(assert (=> b!259838 (= res!217626 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401877))))

(declare-fun b!259839 () Bool)

(declare-fun lt!401878 () (_ BitVec 64))

(assert (=> b!259839 (= e!180331 (bvsle lt!401877 (bvmul lt!401878 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259839 (or (= lt!401878 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401878 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401878)))))

(assert (=> b!259839 (= lt!401878 ((_ sign_extend 32) (size!6225 (buf!6747 (_2!12075 lt!401834)))))))

(assert (= (and d!87160 res!217625) b!259838))

(assert (= (and b!259838 res!217626) b!259839))

(declare-fun m!389137 () Bool)

(assert (=> d!87160 m!389137))

(declare-fun m!389139 () Bool)

(assert (=> d!87160 m!389139))

(assert (=> b!259826 d!87160))

(declare-fun d!87162 () Bool)

(declare-fun e!180334 () Bool)

(assert (=> d!87162 e!180334))

(declare-fun res!217629 () Bool)

(assert (=> d!87162 (=> (not res!217629) (not e!180334))))

(assert (=> d!87162 (= res!217629 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401882 () Unit!18493)

(declare-fun choose!27 (BitStream!11372 BitStream!11372 (_ BitVec 64) (_ BitVec 64)) Unit!18493)

(assert (=> d!87162 (= lt!401882 (choose!27 thiss!1754 (_2!12075 lt!401833) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87162 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87162 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12075 lt!401833) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!401882)))

(declare-fun b!259842 () Bool)

(assert (=> b!259842 (= e!180334 (validate_offset_bits!1 ((_ sign_extend 32) (size!6225 (buf!6747 (_2!12075 lt!401833)))) ((_ sign_extend 32) (currentByte!12403 (_2!12075 lt!401833))) ((_ sign_extend 32) (currentBit!12398 (_2!12075 lt!401833))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87162 res!217629) b!259842))

(declare-fun m!389141 () Bool)

(assert (=> d!87162 m!389141))

(assert (=> b!259842 m!389101))

(assert (=> b!259826 d!87162))

(declare-fun b!259911 () Bool)

(declare-fun e!180378 () tuple2!22278)

(declare-fun e!180377 () tuple2!22278)

(assert (=> b!259911 (= e!180378 e!180377)))

(declare-fun lt!402010 () tuple2!22278)

(assert (=> b!259911 (= lt!402010 (readBit!0 (_2!12075 lt!401833)))))

(declare-fun c!11943 () Bool)

(assert (=> b!259911 (= c!11943 (not (= (_1!12075 lt!402010) expected!109)))))

(declare-fun b!259912 () Bool)

(assert (=> b!259912 (= e!180378 (tuple2!22279 true (_2!12075 lt!401833)))))

(declare-fun b!259913 () Bool)

(declare-fun lt!402017 () tuple2!22278)

(assert (=> b!259913 (= lt!402017 (checkBitsLoop!0 (_2!12075 lt!402010) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!402016 () Unit!18493)

(declare-fun lt!402008 () Unit!18493)

(assert (=> b!259913 (= lt!402016 lt!402008)))

(declare-fun lt!402011 () (_ BitVec 64))

(declare-fun lt!402014 () (_ BitVec 64))

(assert (=> b!259913 (validate_offset_bits!1 ((_ sign_extend 32) (size!6225 (buf!6747 (_2!12075 lt!402010)))) ((_ sign_extend 32) (currentByte!12403 (_2!12075 lt!402010))) ((_ sign_extend 32) (currentBit!12398 (_2!12075 lt!402010))) (bvsub lt!402011 lt!402014))))

(assert (=> b!259913 (= lt!402008 (validateOffsetBitsIneqLemma!0 (_2!12075 lt!401833) (_2!12075 lt!402010) lt!402011 lt!402014))))

(assert (=> b!259913 (= lt!402014 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259913 (= lt!402011 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259913 (= e!180377 (tuple2!22279 (_1!12075 lt!402017) (_2!12075 lt!402017)))))

(declare-fun d!87164 () Bool)

(declare-fun e!180376 () Bool)

(assert (=> d!87164 e!180376))

(declare-fun res!217681 () Bool)

(assert (=> d!87164 (=> (not res!217681) (not e!180376))))

(declare-fun lt!402007 () (_ BitVec 64))

(declare-fun lt!402015 () tuple2!22278)

(assert (=> d!87164 (= res!217681 (bvsge (bvsub lt!402007 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6225 (buf!6747 (_2!12075 lt!402015))) (currentByte!12403 (_2!12075 lt!402015)) (currentBit!12398 (_2!12075 lt!402015)))))))

(assert (=> d!87164 (or (= (bvand lt!402007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402007 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402013 () (_ BitVec 64))

(assert (=> d!87164 (= lt!402007 (bvadd lt!402013 nBits!535))))

(assert (=> d!87164 (or (not (= (bvand lt!402013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402013 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87164 (= lt!402013 (bitIndex!0 (size!6225 (buf!6747 (_2!12075 lt!401833))) (currentByte!12403 (_2!12075 lt!401833)) (currentBit!12398 (_2!12075 lt!401833))))))

(assert (=> d!87164 (= lt!402015 e!180378)))

(declare-fun c!11942 () Bool)

(assert (=> d!87164 (= c!11942 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87164 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87164 (= (checkBitsLoop!0 (_2!12075 lt!401833) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!402015)))

(declare-fun b!259914 () Bool)

(declare-fun e!180379 () Bool)

(assert (=> b!259914 (= e!180376 e!180379)))

(declare-fun res!217682 () Bool)

(assert (=> b!259914 (=> res!217682 e!180379)))

(assert (=> b!259914 (= res!217682 (or (not (_1!12075 lt!402015)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!259915 () Bool)

(declare-datatypes ((tuple2!22288 0))(
  ( (tuple2!22289 (_1!12080 BitStream!11372) (_2!12080 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11372) tuple2!22288)

(assert (=> b!259915 (= e!180379 (= expected!109 (_2!12080 (readBitPure!0 (_2!12075 lt!401833)))))))

(declare-fun b!259916 () Bool)

(declare-fun res!217679 () Bool)

(assert (=> b!259916 (=> (not res!217679) (not e!180376))))

(assert (=> b!259916 (= res!217679 (and (= (buf!6747 (_2!12075 lt!401833)) (buf!6747 (_2!12075 lt!402015))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12075 lt!402015))))))

(declare-fun b!259917 () Bool)

(declare-fun res!217678 () Bool)

(assert (=> b!259917 (=> (not res!217678) (not e!180376))))

(declare-fun e!180380 () Bool)

(assert (=> b!259917 (= res!217678 e!180380)))

(declare-fun res!217680 () Bool)

(assert (=> b!259917 (=> res!217680 e!180380)))

(assert (=> b!259917 (= res!217680 (not (_1!12075 lt!402015)))))

(declare-fun lt!402012 () (_ BitVec 64))

(declare-fun b!259918 () Bool)

(assert (=> b!259918 (= e!180380 (= (bvsub lt!402012 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6225 (buf!6747 (_2!12075 lt!402015))) (currentByte!12403 (_2!12075 lt!402015)) (currentBit!12398 (_2!12075 lt!402015)))))))

(assert (=> b!259918 (or (= (bvand lt!402012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402012 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402009 () (_ BitVec 64))

(assert (=> b!259918 (= lt!402012 (bvadd lt!402009 nBits!535))))

(assert (=> b!259918 (or (not (= (bvand lt!402009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402009 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259918 (= lt!402009 (bitIndex!0 (size!6225 (buf!6747 (_2!12075 lt!401833))) (currentByte!12403 (_2!12075 lt!401833)) (currentBit!12398 (_2!12075 lt!401833))))))

(declare-fun b!259919 () Bool)

(assert (=> b!259919 (= e!180377 (tuple2!22279 false (_2!12075 lt!402010)))))

(assert (= (and d!87164 c!11942) b!259912))

(assert (= (and d!87164 (not c!11942)) b!259911))

(assert (= (and b!259911 c!11943) b!259919))

(assert (= (and b!259911 (not c!11943)) b!259913))

(assert (= (and d!87164 res!217681) b!259916))

(assert (= (and b!259916 res!217679) b!259917))

(assert (= (and b!259917 (not res!217680)) b!259918))

(assert (= (and b!259917 res!217678) b!259914))

(assert (= (and b!259914 (not res!217682)) b!259915))

(declare-fun m!389187 () Bool)

(assert (=> b!259918 m!389187))

(declare-fun m!389189 () Bool)

(assert (=> b!259918 m!389189))

(declare-fun m!389191 () Bool)

(assert (=> b!259915 m!389191))

(assert (=> d!87164 m!389187))

(assert (=> d!87164 m!389189))

(declare-fun m!389193 () Bool)

(assert (=> b!259911 m!389193))

(declare-fun m!389195 () Bool)

(assert (=> b!259913 m!389195))

(declare-fun m!389197 () Bool)

(assert (=> b!259913 m!389197))

(declare-fun m!389199 () Bool)

(assert (=> b!259913 m!389199))

(assert (=> b!259826 d!87164))

(declare-fun d!87186 () Bool)

(declare-fun e!180398 () Bool)

(assert (=> d!87186 e!180398))

(declare-fun res!217697 () Bool)

(assert (=> d!87186 (=> (not res!217697) (not e!180398))))

(declare-datatypes ((tuple2!22290 0))(
  ( (tuple2!22291 (_1!12081 Unit!18493) (_2!12081 BitStream!11372)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11372) tuple2!22290)

(assert (=> d!87186 (= res!217697 (= (buf!6747 (_2!12081 (increaseBitIndex!0 thiss!1754))) (buf!6747 thiss!1754)))))

(declare-fun lt!402066 () Bool)

(assert (=> d!87186 (= lt!402066 (not (= (bvand ((_ sign_extend 24) (select (arr!7212 (buf!6747 thiss!1754)) (currentByte!12403 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12398 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402060 () tuple2!22278)

(assert (=> d!87186 (= lt!402060 (tuple2!22279 (not (= (bvand ((_ sign_extend 24) (select (arr!7212 (buf!6747 thiss!1754)) (currentByte!12403 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12398 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12081 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87186 (validate_offset_bit!0 ((_ sign_extend 32) (size!6225 (buf!6747 thiss!1754))) ((_ sign_extend 32) (currentByte!12403 thiss!1754)) ((_ sign_extend 32) (currentBit!12398 thiss!1754)))))

(assert (=> d!87186 (= (readBit!0 thiss!1754) lt!402060)))

(declare-fun lt!402062 () (_ BitVec 64))

(declare-fun b!259942 () Bool)

(declare-fun lt!402065 () (_ BitVec 64))

(assert (=> b!259942 (= e!180398 (= (bitIndex!0 (size!6225 (buf!6747 (_2!12081 (increaseBitIndex!0 thiss!1754)))) (currentByte!12403 (_2!12081 (increaseBitIndex!0 thiss!1754))) (currentBit!12398 (_2!12081 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!402062 lt!402065)))))

(assert (=> b!259942 (or (not (= (bvand lt!402062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402065 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402062 lt!402065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259942 (= lt!402065 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259942 (= lt!402062 (bitIndex!0 (size!6225 (buf!6747 thiss!1754)) (currentByte!12403 thiss!1754) (currentBit!12398 thiss!1754)))))

(declare-fun lt!402064 () Bool)

(assert (=> b!259942 (= lt!402064 (not (= (bvand ((_ sign_extend 24) (select (arr!7212 (buf!6747 thiss!1754)) (currentByte!12403 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12398 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402061 () Bool)

(assert (=> b!259942 (= lt!402061 (not (= (bvand ((_ sign_extend 24) (select (arr!7212 (buf!6747 thiss!1754)) (currentByte!12403 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12398 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402063 () Bool)

(assert (=> b!259942 (= lt!402063 (not (= (bvand ((_ sign_extend 24) (select (arr!7212 (buf!6747 thiss!1754)) (currentByte!12403 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12398 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87186 res!217697) b!259942))

(declare-fun m!389201 () Bool)

(assert (=> d!87186 m!389201))

(declare-fun m!389203 () Bool)

(assert (=> d!87186 m!389203))

(declare-fun m!389205 () Bool)

(assert (=> d!87186 m!389205))

(declare-fun m!389207 () Bool)

(assert (=> d!87186 m!389207))

(assert (=> b!259942 m!389201))

(assert (=> b!259942 m!389105))

(assert (=> b!259942 m!389203))

(declare-fun m!389209 () Bool)

(assert (=> b!259942 m!389209))

(assert (=> b!259942 m!389205))

(assert (=> b!259827 d!87186))

(declare-fun d!87190 () Bool)

(assert (=> d!87190 (= (array_inv!5966 (buf!6747 thiss!1754)) (bvsge (size!6225 (buf!6747 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259828 d!87190))

(push 1)

(assert (not d!87158))

(assert (not b!259918))

(assert (not b!259911))

(assert (not d!87142))

(assert (not d!87186))

(assert (not b!259915))

(assert (not b!259942))

(assert (not d!87148))

(assert (not d!87146))

(assert (not b!259913))

(assert (not d!87164))

(assert (not d!87162))

(assert (not b!259842))

(assert (not d!87160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

