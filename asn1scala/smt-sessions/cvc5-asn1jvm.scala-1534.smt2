; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42828 () Bool)

(assert start!42828)

(declare-fun b!201729 () Bool)

(declare-fun e!138341 () Bool)

(declare-datatypes ((array!10253 0))(
  ( (array!10254 (arr!5443 (Array (_ BitVec 32) (_ BitVec 8))) (size!4513 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8134 0))(
  ( (BitStream!8135 (buf!5018 array!10253) (currentByte!9440 (_ BitVec 32)) (currentBit!9435 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8134)

(declare-fun array_inv!4254 (array!10253) Bool)

(assert (=> b!201729 (= e!138341 (array_inv!4254 (buf!5018 thiss!1204)))))

(declare-fun b!201730 () Bool)

(declare-fun e!138340 () Bool)

(declare-fun e!138338 () Bool)

(assert (=> b!201730 (= e!138340 e!138338)))

(declare-fun res!168912 () Bool)

(assert (=> b!201730 (=> (not res!168912) (not e!138338))))

(declare-fun lt!314567 () (_ BitVec 64))

(declare-fun lt!314569 () (_ BitVec 64))

(assert (=> b!201730 (= res!168912 (= lt!314567 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314569)))))

(declare-datatypes ((Unit!14319 0))(
  ( (Unit!14320) )
))
(declare-datatypes ((tuple2!17246 0))(
  ( (tuple2!17247 (_1!9275 Unit!14319) (_2!9275 BitStream!8134)) )
))
(declare-fun lt!314572 () tuple2!17246)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201730 (= lt!314567 (bitIndex!0 (size!4513 (buf!5018 (_2!9275 lt!314572))) (currentByte!9440 (_2!9275 lt!314572)) (currentBit!9435 (_2!9275 lt!314572))))))

(assert (=> b!201730 (= lt!314569 (bitIndex!0 (size!4513 (buf!5018 thiss!1204)) (currentByte!9440 thiss!1204) (currentBit!9435 thiss!1204)))))

(declare-fun b!201731 () Bool)

(declare-fun res!168916 () Bool)

(declare-fun e!138339 () Bool)

(assert (=> b!201731 (=> (not res!168916) (not e!138339))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201731 (= res!168916 (invariant!0 (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204) (size!4513 (buf!5018 thiss!1204))))))

(declare-fun b!201732 () Bool)

(declare-fun e!138337 () Bool)

(declare-datatypes ((tuple2!17248 0))(
  ( (tuple2!17249 (_1!9276 BitStream!8134) (_2!9276 Bool)) )
))
(declare-fun lt!314566 () tuple2!17248)

(assert (=> b!201732 (= e!138337 (= (bitIndex!0 (size!4513 (buf!5018 (_1!9276 lt!314566))) (currentByte!9440 (_1!9276 lt!314566)) (currentBit!9435 (_1!9276 lt!314566))) lt!314567))))

(declare-fun b!201733 () Bool)

(declare-fun res!168914 () Bool)

(assert (=> b!201733 (=> (not res!168914) (not e!138339))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201733 (= res!168914 (validate_offset_bits!1 ((_ sign_extend 32) (size!4513 (buf!5018 thiss!1204))) ((_ sign_extend 32) (currentByte!9440 thiss!1204)) ((_ sign_extend 32) (currentBit!9435 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201734 () Bool)

(assert (=> b!201734 (= e!138338 e!138337)))

(declare-fun res!168919 () Bool)

(assert (=> b!201734 (=> (not res!168919) (not e!138337))))

(declare-fun lt!314568 () Bool)

(assert (=> b!201734 (= res!168919 (and (= (_2!9276 lt!314566) lt!314568) (= (_1!9276 lt!314566) (_2!9275 lt!314572))))))

(declare-fun readBitPure!0 (BitStream!8134) tuple2!17248)

(declare-fun readerFrom!0 (BitStream!8134 (_ BitVec 32) (_ BitVec 32)) BitStream!8134)

(assert (=> b!201734 (= lt!314566 (readBitPure!0 (readerFrom!0 (_2!9275 lt!314572) (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204))))))

(declare-fun b!201735 () Bool)

(declare-fun res!168913 () Bool)

(assert (=> b!201735 (=> (not res!168913) (not e!138339))))

(assert (=> b!201735 (= res!168913 (not (= i!590 nBits!348)))))

(declare-fun b!201736 () Bool)

(declare-fun e!138342 () Bool)

(declare-fun lt!314573 () (_ BitVec 64))

(declare-fun lt!314570 () (_ BitVec 64))

(assert (=> b!201736 (= e!138342 (or (not (= lt!314573 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!314573 (bvand lt!314570 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!314571 () (_ BitVec 64))

(assert (=> b!201736 (= lt!314573 (bvand lt!314571 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!168917 () Bool)

(assert (=> start!42828 (=> (not res!168917) (not e!138339))))

(assert (=> start!42828 (= res!168917 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42828 e!138339))

(assert (=> start!42828 true))

(declare-fun inv!12 (BitStream!8134) Bool)

(assert (=> start!42828 (and (inv!12 thiss!1204) e!138341)))

(declare-fun b!201737 () Bool)

(declare-fun res!168915 () Bool)

(assert (=> b!201737 (=> (not res!168915) (not e!138338))))

(declare-fun isPrefixOf!0 (BitStream!8134 BitStream!8134) Bool)

(assert (=> b!201737 (= res!168915 (isPrefixOf!0 thiss!1204 (_2!9275 lt!314572)))))

(declare-fun b!201738 () Bool)

(assert (=> b!201738 (= e!138339 (not e!138342))))

(declare-fun res!168920 () Bool)

(assert (=> b!201738 (=> res!168920 e!138342)))

(assert (=> b!201738 (= res!168920 (not (= (bitIndex!0 (size!4513 (buf!5018 (_2!9275 lt!314572))) (currentByte!9440 (_2!9275 lt!314572)) (currentBit!9435 (_2!9275 lt!314572))) lt!314570)))))

(assert (=> b!201738 (= lt!314570 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314571))))

(assert (=> b!201738 (= lt!314571 (bitIndex!0 (size!4513 (buf!5018 thiss!1204)) (currentByte!9440 thiss!1204) (currentBit!9435 thiss!1204)))))

(assert (=> b!201738 e!138340))

(declare-fun res!168918 () Bool)

(assert (=> b!201738 (=> (not res!168918) (not e!138340))))

(assert (=> b!201738 (= res!168918 (= (size!4513 (buf!5018 thiss!1204)) (size!4513 (buf!5018 (_2!9275 lt!314572)))))))

(declare-fun appendBit!0 (BitStream!8134 Bool) tuple2!17246)

(assert (=> b!201738 (= lt!314572 (appendBit!0 thiss!1204 lt!314568))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!201738 (= lt!314568 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!42828 res!168917) b!201733))

(assert (= (and b!201733 res!168914) b!201731))

(assert (= (and b!201731 res!168916) b!201735))

(assert (= (and b!201735 res!168913) b!201738))

(assert (= (and b!201738 res!168918) b!201730))

(assert (= (and b!201730 res!168912) b!201737))

(assert (= (and b!201737 res!168915) b!201734))

(assert (= (and b!201734 res!168919) b!201732))

(assert (= (and b!201738 (not res!168920)) b!201736))

(assert (= start!42828 b!201729))

(declare-fun m!312279 () Bool)

(assert (=> b!201731 m!312279))

(declare-fun m!312281 () Bool)

(assert (=> b!201737 m!312281))

(declare-fun m!312283 () Bool)

(assert (=> start!42828 m!312283))

(declare-fun m!312285 () Bool)

(assert (=> b!201738 m!312285))

(declare-fun m!312287 () Bool)

(assert (=> b!201738 m!312287))

(declare-fun m!312289 () Bool)

(assert (=> b!201738 m!312289))

(declare-fun m!312291 () Bool)

(assert (=> b!201734 m!312291))

(assert (=> b!201734 m!312291))

(declare-fun m!312293 () Bool)

(assert (=> b!201734 m!312293))

(declare-fun m!312295 () Bool)

(assert (=> b!201732 m!312295))

(assert (=> b!201730 m!312285))

(assert (=> b!201730 m!312287))

(declare-fun m!312297 () Bool)

(assert (=> b!201729 m!312297))

(declare-fun m!312299 () Bool)

(assert (=> b!201733 m!312299))

(push 1)

(assert (not b!201729))

(assert (not start!42828))

(assert (not b!201732))

(assert (not b!201733))

(assert (not b!201738))

(assert (not b!201734))

(assert (not b!201730))

(assert (not b!201731))

(assert (not b!201737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69141 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69141 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4513 (buf!5018 thiss!1204))) ((_ sign_extend 32) (currentByte!9440 thiss!1204)) ((_ sign_extend 32) (currentBit!9435 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4513 (buf!5018 thiss!1204))) ((_ sign_extend 32) (currentByte!9440 thiss!1204)) ((_ sign_extend 32) (currentBit!9435 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17062 () Bool)

(assert (= bs!17062 d!69141))

(declare-fun m!312347 () Bool)

(assert (=> bs!17062 m!312347))

(assert (=> b!201733 d!69141))

(declare-fun d!69143 () Bool)

(declare-fun e!138392 () Bool)

(assert (=> d!69143 e!138392))

(declare-fun res!168990 () Bool)

(assert (=> d!69143 (=> (not res!168990) (not e!138392))))

(declare-fun lt!314664 () (_ BitVec 64))

(declare-fun lt!314667 () (_ BitVec 64))

(declare-fun lt!314668 () (_ BitVec 64))

(assert (=> d!69143 (= res!168990 (= lt!314668 (bvsub lt!314664 lt!314667)))))

(assert (=> d!69143 (or (= (bvand lt!314664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314664 lt!314667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69143 (= lt!314667 (remainingBits!0 ((_ sign_extend 32) (size!4513 (buf!5018 (_2!9275 lt!314572)))) ((_ sign_extend 32) (currentByte!9440 (_2!9275 lt!314572))) ((_ sign_extend 32) (currentBit!9435 (_2!9275 lt!314572)))))))

(declare-fun lt!314666 () (_ BitVec 64))

(declare-fun lt!314665 () (_ BitVec 64))

(assert (=> d!69143 (= lt!314664 (bvmul lt!314666 lt!314665))))

(assert (=> d!69143 (or (= lt!314666 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314665 (bvsdiv (bvmul lt!314666 lt!314665) lt!314666)))))

(assert (=> d!69143 (= lt!314665 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69143 (= lt!314666 ((_ sign_extend 32) (size!4513 (buf!5018 (_2!9275 lt!314572)))))))

(assert (=> d!69143 (= lt!314668 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9440 (_2!9275 lt!314572))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9435 (_2!9275 lt!314572)))))))

(assert (=> d!69143 (invariant!0 (currentBit!9435 (_2!9275 lt!314572)) (currentByte!9440 (_2!9275 lt!314572)) (size!4513 (buf!5018 (_2!9275 lt!314572))))))

(assert (=> d!69143 (= (bitIndex!0 (size!4513 (buf!5018 (_2!9275 lt!314572))) (currentByte!9440 (_2!9275 lt!314572)) (currentBit!9435 (_2!9275 lt!314572))) lt!314668)))

(declare-fun b!201813 () Bool)

(declare-fun res!168989 () Bool)

(assert (=> b!201813 (=> (not res!168989) (not e!138392))))

(assert (=> b!201813 (= res!168989 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314668))))

(declare-fun b!201814 () Bool)

(declare-fun lt!314669 () (_ BitVec 64))

(assert (=> b!201814 (= e!138392 (bvsle lt!314668 (bvmul lt!314669 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201814 (or (= lt!314669 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314669 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314669)))))

(assert (=> b!201814 (= lt!314669 ((_ sign_extend 32) (size!4513 (buf!5018 (_2!9275 lt!314572)))))))

(assert (= (and d!69143 res!168990) b!201813))

(assert (= (and b!201813 res!168989) b!201814))

(declare-fun m!312357 () Bool)

(assert (=> d!69143 m!312357))

(declare-fun m!312359 () Bool)

(assert (=> d!69143 m!312359))

(assert (=> b!201738 d!69143))

(declare-fun d!69155 () Bool)

(declare-fun e!138393 () Bool)

(assert (=> d!69155 e!138393))

(declare-fun res!168992 () Bool)

(assert (=> d!69155 (=> (not res!168992) (not e!138393))))

(declare-fun lt!314673 () (_ BitVec 64))

(declare-fun lt!314674 () (_ BitVec 64))

(declare-fun lt!314670 () (_ BitVec 64))

(assert (=> d!69155 (= res!168992 (= lt!314674 (bvsub lt!314670 lt!314673)))))

(assert (=> d!69155 (or (= (bvand lt!314670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314673 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314670 lt!314673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69155 (= lt!314673 (remainingBits!0 ((_ sign_extend 32) (size!4513 (buf!5018 thiss!1204))) ((_ sign_extend 32) (currentByte!9440 thiss!1204)) ((_ sign_extend 32) (currentBit!9435 thiss!1204))))))

(declare-fun lt!314672 () (_ BitVec 64))

(declare-fun lt!314671 () (_ BitVec 64))

(assert (=> d!69155 (= lt!314670 (bvmul lt!314672 lt!314671))))

(assert (=> d!69155 (or (= lt!314672 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314671 (bvsdiv (bvmul lt!314672 lt!314671) lt!314672)))))

(assert (=> d!69155 (= lt!314671 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69155 (= lt!314672 ((_ sign_extend 32) (size!4513 (buf!5018 thiss!1204))))))

(assert (=> d!69155 (= lt!314674 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9440 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9435 thiss!1204))))))

(assert (=> d!69155 (invariant!0 (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204) (size!4513 (buf!5018 thiss!1204)))))

(assert (=> d!69155 (= (bitIndex!0 (size!4513 (buf!5018 thiss!1204)) (currentByte!9440 thiss!1204) (currentBit!9435 thiss!1204)) lt!314674)))

(declare-fun b!201815 () Bool)

(declare-fun res!168991 () Bool)

(assert (=> b!201815 (=> (not res!168991) (not e!138393))))

(assert (=> b!201815 (= res!168991 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314674))))

(declare-fun b!201816 () Bool)

(declare-fun lt!314675 () (_ BitVec 64))

(assert (=> b!201816 (= e!138393 (bvsle lt!314674 (bvmul lt!314675 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201816 (or (= lt!314675 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314675 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314675)))))

(assert (=> b!201816 (= lt!314675 ((_ sign_extend 32) (size!4513 (buf!5018 thiss!1204))))))

(assert (= (and d!69155 res!168992) b!201815))

(assert (= (and b!201815 res!168991) b!201816))

(assert (=> d!69155 m!312347))

(assert (=> d!69155 m!312279))

(assert (=> b!201738 d!69155))

(declare-fun b!201853 () Bool)

(declare-fun e!138412 () Bool)

(declare-fun lt!314724 () tuple2!17248)

(declare-fun lt!314726 () tuple2!17246)

(assert (=> b!201853 (= e!138412 (= (bitIndex!0 (size!4513 (buf!5018 (_1!9276 lt!314724))) (currentByte!9440 (_1!9276 lt!314724)) (currentBit!9435 (_1!9276 lt!314724))) (bitIndex!0 (size!4513 (buf!5018 (_2!9275 lt!314726))) (currentByte!9440 (_2!9275 lt!314726)) (currentBit!9435 (_2!9275 lt!314726)))))))

(declare-fun b!201851 () Bool)

(declare-fun res!169028 () Bool)

(declare-fun e!138411 () Bool)

(assert (=> b!201851 (=> (not res!169028) (not e!138411))))

(assert (=> b!201851 (= res!169028 (isPrefixOf!0 thiss!1204 (_2!9275 lt!314726)))))

(declare-fun d!69157 () Bool)

(assert (=> d!69157 e!138411))

(declare-fun res!169027 () Bool)

(assert (=> d!69157 (=> (not res!169027) (not e!138411))))

(assert (=> d!69157 (= res!169027 (= (size!4513 (buf!5018 thiss!1204)) (size!4513 (buf!5018 (_2!9275 lt!314726)))))))

(declare-fun choose!16 (BitStream!8134 Bool) tuple2!17246)

(assert (=> d!69157 (= lt!314726 (choose!16 thiss!1204 lt!314568))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69157 (validate_offset_bit!0 ((_ sign_extend 32) (size!4513 (buf!5018 thiss!1204))) ((_ sign_extend 32) (currentByte!9440 thiss!1204)) ((_ sign_extend 32) (currentBit!9435 thiss!1204)))))

(assert (=> d!69157 (= (appendBit!0 thiss!1204 lt!314568) lt!314726)))

(declare-fun b!201850 () Bool)

(declare-fun res!169025 () Bool)

(assert (=> b!201850 (=> (not res!169025) (not e!138411))))

(declare-fun lt!314723 () (_ BitVec 64))

(declare-fun lt!314725 () (_ BitVec 64))

(assert (=> b!201850 (= res!169025 (= (bitIndex!0 (size!4513 (buf!5018 (_2!9275 lt!314726))) (currentByte!9440 (_2!9275 lt!314726)) (currentBit!9435 (_2!9275 lt!314726))) (bvadd lt!314725 lt!314723)))))

(assert (=> b!201850 (or (not (= (bvand lt!314725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314723 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!314725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!314725 lt!314723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201850 (= lt!314723 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!201850 (= lt!314725 (bitIndex!0 (size!4513 (buf!5018 thiss!1204)) (currentByte!9440 thiss!1204) (currentBit!9435 thiss!1204)))))

(declare-fun b!201852 () Bool)

(assert (=> b!201852 (= e!138411 e!138412)))

(declare-fun res!169026 () Bool)

(assert (=> b!201852 (=> (not res!169026) (not e!138412))))

(assert (=> b!201852 (= res!169026 (and (= (_2!9276 lt!314724) lt!314568) (= (_1!9276 lt!314724) (_2!9275 lt!314726))))))

(assert (=> b!201852 (= lt!314724 (readBitPure!0 (readerFrom!0 (_2!9275 lt!314726) (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204))))))

(assert (= (and d!69157 res!169027) b!201850))

(assert (= (and b!201850 res!169025) b!201851))

(assert (= (and b!201851 res!169028) b!201852))

(assert (= (and b!201852 res!169026) b!201853))

(declare-fun m!312385 () Bool)

(assert (=> b!201850 m!312385))

(assert (=> b!201850 m!312287))

(declare-fun m!312387 () Bool)

(assert (=> b!201853 m!312387))

(assert (=> b!201853 m!312385))

(declare-fun m!312389 () Bool)

(assert (=> b!201852 m!312389))

(assert (=> b!201852 m!312389))

(declare-fun m!312391 () Bool)

(assert (=> b!201852 m!312391))

(declare-fun m!312393 () Bool)

(assert (=> d!69157 m!312393))

(declare-fun m!312395 () Bool)

(assert (=> d!69157 m!312395))

(declare-fun m!312397 () Bool)

(assert (=> b!201851 m!312397))

(assert (=> b!201738 d!69157))

(declare-fun d!69171 () Bool)

(assert (=> d!69171 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204) (size!4513 (buf!5018 thiss!1204))))))

(declare-fun bs!17065 () Bool)

(assert (= bs!17065 d!69171))

(assert (=> bs!17065 m!312279))

(assert (=> start!42828 d!69171))

(declare-fun d!69173 () Bool)

(declare-fun res!169056 () Bool)

(declare-fun e!138430 () Bool)

(assert (=> d!69173 (=> (not res!169056) (not e!138430))))

(assert (=> d!69173 (= res!169056 (= (size!4513 (buf!5018 thiss!1204)) (size!4513 (buf!5018 (_2!9275 lt!314572)))))))

(assert (=> d!69173 (= (isPrefixOf!0 thiss!1204 (_2!9275 lt!314572)) e!138430)))

(declare-fun b!201882 () Bool)

(declare-fun res!169057 () Bool)

(assert (=> b!201882 (=> (not res!169057) (not e!138430))))

(assert (=> b!201882 (= res!169057 (bvsle (bitIndex!0 (size!4513 (buf!5018 thiss!1204)) (currentByte!9440 thiss!1204) (currentBit!9435 thiss!1204)) (bitIndex!0 (size!4513 (buf!5018 (_2!9275 lt!314572))) (currentByte!9440 (_2!9275 lt!314572)) (currentBit!9435 (_2!9275 lt!314572)))))))

(declare-fun b!201883 () Bool)

(declare-fun e!138429 () Bool)

(assert (=> b!201883 (= e!138430 e!138429)))

(declare-fun res!169058 () Bool)

(assert (=> b!201883 (=> res!169058 e!138429)))

(assert (=> b!201883 (= res!169058 (= (size!4513 (buf!5018 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!201884 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10253 array!10253 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201884 (= e!138429 (arrayBitRangesEq!0 (buf!5018 thiss!1204) (buf!5018 (_2!9275 lt!314572)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4513 (buf!5018 thiss!1204)) (currentByte!9440 thiss!1204) (currentBit!9435 thiss!1204))))))

(assert (= (and d!69173 res!169056) b!201882))

(assert (= (and b!201882 res!169057) b!201883))

(assert (= (and b!201883 (not res!169058)) b!201884))

(assert (=> b!201882 m!312287))

(assert (=> b!201882 m!312285))

(assert (=> b!201884 m!312287))

(assert (=> b!201884 m!312287))

(declare-fun m!312415 () Bool)

(assert (=> b!201884 m!312415))

(assert (=> b!201737 d!69173))

(declare-fun d!69179 () Bool)

(declare-fun e!138431 () Bool)

(assert (=> d!69179 e!138431))

(declare-fun res!169060 () Bool)

(assert (=> d!69179 (=> (not res!169060) (not e!138431))))

(declare-fun lt!314742 () (_ BitVec 64))

(declare-fun lt!314739 () (_ BitVec 64))

(declare-fun lt!314743 () (_ BitVec 64))

(assert (=> d!69179 (= res!169060 (= lt!314743 (bvsub lt!314739 lt!314742)))))

(assert (=> d!69179 (or (= (bvand lt!314739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314742 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314739 lt!314742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69179 (= lt!314742 (remainingBits!0 ((_ sign_extend 32) (size!4513 (buf!5018 (_1!9276 lt!314566)))) ((_ sign_extend 32) (currentByte!9440 (_1!9276 lt!314566))) ((_ sign_extend 32) (currentBit!9435 (_1!9276 lt!314566)))))))

(declare-fun lt!314741 () (_ BitVec 64))

(declare-fun lt!314740 () (_ BitVec 64))

(assert (=> d!69179 (= lt!314739 (bvmul lt!314741 lt!314740))))

(assert (=> d!69179 (or (= lt!314741 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314740 (bvsdiv (bvmul lt!314741 lt!314740) lt!314741)))))

(assert (=> d!69179 (= lt!314740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69179 (= lt!314741 ((_ sign_extend 32) (size!4513 (buf!5018 (_1!9276 lt!314566)))))))

(assert (=> d!69179 (= lt!314743 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9440 (_1!9276 lt!314566))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9435 (_1!9276 lt!314566)))))))

(assert (=> d!69179 (invariant!0 (currentBit!9435 (_1!9276 lt!314566)) (currentByte!9440 (_1!9276 lt!314566)) (size!4513 (buf!5018 (_1!9276 lt!314566))))))

(assert (=> d!69179 (= (bitIndex!0 (size!4513 (buf!5018 (_1!9276 lt!314566))) (currentByte!9440 (_1!9276 lt!314566)) (currentBit!9435 (_1!9276 lt!314566))) lt!314743)))

(declare-fun b!201885 () Bool)

(declare-fun res!169059 () Bool)

(assert (=> b!201885 (=> (not res!169059) (not e!138431))))

(assert (=> b!201885 (= res!169059 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314743))))

(declare-fun b!201886 () Bool)

(declare-fun lt!314744 () (_ BitVec 64))

(assert (=> b!201886 (= e!138431 (bvsle lt!314743 (bvmul lt!314744 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201886 (or (= lt!314744 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314744 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314744)))))

(assert (=> b!201886 (= lt!314744 ((_ sign_extend 32) (size!4513 (buf!5018 (_1!9276 lt!314566)))))))

(assert (= (and d!69179 res!169060) b!201885))

(assert (= (and b!201885 res!169059) b!201886))

(declare-fun m!312417 () Bool)

(assert (=> d!69179 m!312417))

(declare-fun m!312419 () Bool)

(assert (=> d!69179 m!312419))

(assert (=> b!201732 d!69179))

(assert (=> b!201730 d!69143))

(assert (=> b!201730 d!69155))

(declare-fun d!69183 () Bool)

(assert (=> d!69183 (= (invariant!0 (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204) (size!4513 (buf!5018 thiss!1204))) (and (bvsge (currentBit!9435 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9435 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9440 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9440 thiss!1204) (size!4513 (buf!5018 thiss!1204))) (and (= (currentBit!9435 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9440 thiss!1204) (size!4513 (buf!5018 thiss!1204)))))))))

(assert (=> b!201731 d!69183))

(declare-fun d!69185 () Bool)

(assert (=> d!69185 (= (array_inv!4254 (buf!5018 thiss!1204)) (bvsge (size!4513 (buf!5018 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201729 d!69185))

(declare-fun d!69187 () Bool)

(declare-datatypes ((tuple2!17260 0))(
  ( (tuple2!17261 (_1!9282 Bool) (_2!9282 BitStream!8134)) )
))
(declare-fun lt!314747 () tuple2!17260)

(declare-fun readBit!0 (BitStream!8134) tuple2!17260)

(assert (=> d!69187 (= lt!314747 (readBit!0 (readerFrom!0 (_2!9275 lt!314572) (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204))))))

(assert (=> d!69187 (= (readBitPure!0 (readerFrom!0 (_2!9275 lt!314572) (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204))) (tuple2!17249 (_2!9282 lt!314747) (_1!9282 lt!314747)))))

(declare-fun bs!17067 () Bool)

(assert (= bs!17067 d!69187))

(assert (=> bs!17067 m!312291))

(declare-fun m!312421 () Bool)

(assert (=> bs!17067 m!312421))

(assert (=> b!201734 d!69187))

(declare-fun d!69189 () Bool)

(declare-fun e!138441 () Bool)

(assert (=> d!69189 e!138441))

(declare-fun res!169075 () Bool)

(assert (=> d!69189 (=> (not res!169075) (not e!138441))))

(assert (=> d!69189 (= res!169075 (invariant!0 (currentBit!9435 (_2!9275 lt!314572)) (currentByte!9440 (_2!9275 lt!314572)) (size!4513 (buf!5018 (_2!9275 lt!314572)))))))

(assert (=> d!69189 (= (readerFrom!0 (_2!9275 lt!314572) (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204)) (BitStream!8135 (buf!5018 (_2!9275 lt!314572)) (currentByte!9440 thiss!1204) (currentBit!9435 thiss!1204)))))

(declare-fun b!201900 () Bool)

(assert (=> b!201900 (= e!138441 (invariant!0 (currentBit!9435 thiss!1204) (currentByte!9440 thiss!1204) (size!4513 (buf!5018 (_2!9275 lt!314572)))))))

(assert (= (and d!69189 res!169075) b!201900))

(assert (=> d!69189 m!312359))

(declare-fun m!312429 () Bool)

(assert (=> b!201900 m!312429))

(assert (=> b!201734 d!69189))

(push 1)

(assert (not b!201882))

(assert (not d!69187))

(assert (not d!69189))

(assert (not b!201851))

(assert (not b!201900))

(assert (not d!69179))

(assert (not b!201884))

(assert (not b!201852))

(assert (not d!69143))

(assert (not d!69155))

(assert (not d!69157))

(assert (not d!69141))

(assert (not b!201853))

(assert (not b!201850))

(assert (not d!69171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

