; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39294 () Bool)

(assert start!39294)

(declare-fun b!176673 () Bool)

(declare-fun res!146383 () Bool)

(declare-fun e!123143 () Bool)

(assert (=> b!176673 (=> (not res!146383) (not e!123143))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!176673 (= res!146383 (not (= i!590 nBits!348)))))

(declare-fun b!176674 () Bool)

(declare-fun e!123146 () Bool)

(declare-datatypes ((array!9537 0))(
  ( (array!9538 (arr!5136 (Array (_ BitVec 32) (_ BitVec 8))) (size!4206 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7520 0))(
  ( (BitStream!7521 (buf!4649 array!9537) (currentByte!8811 (_ BitVec 32)) (currentBit!8806 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15208 0))(
  ( (tuple2!15209 (_1!8249 BitStream!7520) (_2!8249 Bool)) )
))
(declare-fun lt!271865 () tuple2!15208)

(declare-fun lt!271866 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176674 (= e!123146 (= (bitIndex!0 (size!4206 (buf!4649 (_1!8249 lt!271865))) (currentByte!8811 (_1!8249 lt!271865)) (currentBit!8806 (_1!8249 lt!271865))) lt!271866))))

(declare-fun b!176675 () Bool)

(declare-fun e!123147 () Bool)

(assert (=> b!176675 (= e!123143 (not e!123147))))

(declare-fun res!146390 () Bool)

(assert (=> b!176675 (=> res!146390 e!123147)))

(declare-datatypes ((Unit!12726 0))(
  ( (Unit!12727) )
))
(declare-datatypes ((tuple2!15210 0))(
  ( (tuple2!15211 (_1!8250 Unit!12726) (_2!8250 BitStream!7520)) )
))
(declare-fun lt!271867 () tuple2!15210)

(declare-fun thiss!1204 () BitStream!7520)

(assert (=> b!176675 (= res!146390 (not (= (bitIndex!0 (size!4206 (buf!4649 (_2!8250 lt!271867))) (currentByte!8811 (_2!8250 lt!271867)) (currentBit!8806 (_2!8250 lt!271867))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4206 (buf!4649 thiss!1204)) (currentByte!8811 thiss!1204) (currentBit!8806 thiss!1204))))))))

(declare-fun e!123145 () Bool)

(assert (=> b!176675 e!123145))

(declare-fun res!146386 () Bool)

(assert (=> b!176675 (=> (not res!146386) (not e!123145))))

(assert (=> b!176675 (= res!146386 (= (size!4206 (buf!4649 thiss!1204)) (size!4206 (buf!4649 (_2!8250 lt!271867)))))))

(declare-fun lt!271864 () Bool)

(declare-fun appendBit!0 (BitStream!7520 Bool) tuple2!15210)

(assert (=> b!176675 (= lt!271867 (appendBit!0 thiss!1204 lt!271864))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176675 (= lt!271864 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176676 () Bool)

(declare-fun res!146391 () Bool)

(assert (=> b!176676 (=> (not res!146391) (not e!123143))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176676 (= res!146391 (validate_offset_bits!1 ((_ sign_extend 32) (size!4206 (buf!4649 thiss!1204))) ((_ sign_extend 32) (currentByte!8811 thiss!1204)) ((_ sign_extend 32) (currentBit!8806 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176677 () Bool)

(declare-fun res!146385 () Bool)

(assert (=> b!176677 (=> (not res!146385) (not e!123143))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176677 (= res!146385 (invariant!0 (currentBit!8806 thiss!1204) (currentByte!8811 thiss!1204) (size!4206 (buf!4649 thiss!1204))))))

(declare-fun b!176678 () Bool)

(declare-fun e!123144 () Bool)

(declare-fun array_inv!3947 (array!9537) Bool)

(assert (=> b!176678 (= e!123144 (array_inv!3947 (buf!4649 thiss!1204)))))

(declare-fun res!146387 () Bool)

(assert (=> start!39294 (=> (not res!146387) (not e!123143))))

(assert (=> start!39294 (= res!146387 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39294 e!123143))

(assert (=> start!39294 true))

(declare-fun inv!12 (BitStream!7520) Bool)

(assert (=> start!39294 (and (inv!12 thiss!1204) e!123144)))

(declare-fun b!176679 () Bool)

(declare-fun e!123142 () Bool)

(assert (=> b!176679 (= e!123145 e!123142)))

(declare-fun res!146389 () Bool)

(assert (=> b!176679 (=> (not res!146389) (not e!123142))))

(declare-fun lt!271868 () (_ BitVec 64))

(assert (=> b!176679 (= res!146389 (= lt!271866 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271868)))))

(assert (=> b!176679 (= lt!271866 (bitIndex!0 (size!4206 (buf!4649 (_2!8250 lt!271867))) (currentByte!8811 (_2!8250 lt!271867)) (currentBit!8806 (_2!8250 lt!271867))))))

(assert (=> b!176679 (= lt!271868 (bitIndex!0 (size!4206 (buf!4649 thiss!1204)) (currentByte!8811 thiss!1204) (currentBit!8806 thiss!1204)))))

(declare-fun b!176680 () Bool)

(declare-fun res!146388 () Bool)

(assert (=> b!176680 (=> (not res!146388) (not e!123142))))

(declare-fun isPrefixOf!0 (BitStream!7520 BitStream!7520) Bool)

(assert (=> b!176680 (= res!146388 (isPrefixOf!0 thiss!1204 (_2!8250 lt!271867)))))

(declare-fun b!176681 () Bool)

(assert (=> b!176681 (= e!123147 (invariant!0 (currentBit!8806 (_2!8250 lt!271867)) (currentByte!8811 (_2!8250 lt!271867)) (size!4206 (buf!4649 (_2!8250 lt!271867)))))))

(declare-fun b!176682 () Bool)

(assert (=> b!176682 (= e!123142 e!123146)))

(declare-fun res!146384 () Bool)

(assert (=> b!176682 (=> (not res!146384) (not e!123146))))

(assert (=> b!176682 (= res!146384 (and (= (_2!8249 lt!271865) lt!271864) (= (_1!8249 lt!271865) (_2!8250 lt!271867))))))

(declare-fun readBitPure!0 (BitStream!7520) tuple2!15208)

(declare-fun readerFrom!0 (BitStream!7520 (_ BitVec 32) (_ BitVec 32)) BitStream!7520)

(assert (=> b!176682 (= lt!271865 (readBitPure!0 (readerFrom!0 (_2!8250 lt!271867) (currentBit!8806 thiss!1204) (currentByte!8811 thiss!1204))))))

(assert (= (and start!39294 res!146387) b!176676))

(assert (= (and b!176676 res!146391) b!176677))

(assert (= (and b!176677 res!146385) b!176673))

(assert (= (and b!176673 res!146383) b!176675))

(assert (= (and b!176675 res!146386) b!176679))

(assert (= (and b!176679 res!146389) b!176680))

(assert (= (and b!176680 res!146388) b!176682))

(assert (= (and b!176682 res!146384) b!176674))

(assert (= (and b!176675 (not res!146390)) b!176681))

(assert (= start!39294 b!176678))

(declare-fun m!276733 () Bool)

(assert (=> b!176681 m!276733))

(declare-fun m!276735 () Bool)

(assert (=> b!176679 m!276735))

(declare-fun m!276737 () Bool)

(assert (=> b!176679 m!276737))

(declare-fun m!276739 () Bool)

(assert (=> b!176678 m!276739))

(declare-fun m!276741 () Bool)

(assert (=> start!39294 m!276741))

(declare-fun m!276743 () Bool)

(assert (=> b!176674 m!276743))

(assert (=> b!176675 m!276735))

(assert (=> b!176675 m!276737))

(declare-fun m!276745 () Bool)

(assert (=> b!176675 m!276745))

(declare-fun m!276747 () Bool)

(assert (=> b!176682 m!276747))

(assert (=> b!176682 m!276747))

(declare-fun m!276749 () Bool)

(assert (=> b!176682 m!276749))

(declare-fun m!276751 () Bool)

(assert (=> b!176677 m!276751))

(declare-fun m!276753 () Bool)

(assert (=> b!176676 m!276753))

(declare-fun m!276755 () Bool)

(assert (=> b!176680 m!276755))

(push 1)

(assert (not start!39294))

(assert (not b!176677))

(assert (not b!176681))

(assert (not b!176682))

(assert (not b!176676))

(assert (not b!176675))

(assert (not b!176678))

(assert (not b!176680))

(assert (not b!176679))

(assert (not b!176674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62329 () Bool)

(declare-fun e!123179 () Bool)

(assert (=> d!62329 e!123179))

(declare-fun res!146442 () Bool)

(assert (=> d!62329 (=> (not res!146442) (not e!123179))))

(declare-fun lt!271949 () (_ BitVec 64))

(declare-fun lt!271948 () (_ BitVec 64))

(declare-fun lt!271947 () (_ BitVec 64))

(assert (=> d!62329 (= res!146442 (= lt!271949 (bvsub lt!271947 lt!271948)))))

(assert (=> d!62329 (or (= (bvand lt!271947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271947 lt!271948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62329 (= lt!271948 (remainingBits!0 ((_ sign_extend 32) (size!4206 (buf!4649 (_2!8250 lt!271867)))) ((_ sign_extend 32) (currentByte!8811 (_2!8250 lt!271867))) ((_ sign_extend 32) (currentBit!8806 (_2!8250 lt!271867)))))))

(declare-fun lt!271950 () (_ BitVec 64))

(declare-fun lt!271952 () (_ BitVec 64))

(assert (=> d!62329 (= lt!271947 (bvmul lt!271950 lt!271952))))

(assert (=> d!62329 (or (= lt!271950 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271952 (bvsdiv (bvmul lt!271950 lt!271952) lt!271950)))))

(assert (=> d!62329 (= lt!271952 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62329 (= lt!271950 ((_ sign_extend 32) (size!4206 (buf!4649 (_2!8250 lt!271867)))))))

(assert (=> d!62329 (= lt!271949 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8811 (_2!8250 lt!271867))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8806 (_2!8250 lt!271867)))))))

(assert (=> d!62329 (invariant!0 (currentBit!8806 (_2!8250 lt!271867)) (currentByte!8811 (_2!8250 lt!271867)) (size!4206 (buf!4649 (_2!8250 lt!271867))))))

(assert (=> d!62329 (= (bitIndex!0 (size!4206 (buf!4649 (_2!8250 lt!271867))) (currentByte!8811 (_2!8250 lt!271867)) (currentBit!8806 (_2!8250 lt!271867))) lt!271949)))

(declare-fun b!176731 () Bool)

(declare-fun res!146443 () Bool)

(assert (=> b!176731 (=> (not res!146443) (not e!123179))))

(assert (=> b!176731 (= res!146443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271949))))

(declare-fun b!176732 () Bool)

(declare-fun lt!271951 () (_ BitVec 64))

(assert (=> b!176732 (= e!123179 (bvsle lt!271949 (bvmul lt!271951 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176732 (or (= lt!271951 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271951 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271951)))))

(assert (=> b!176732 (= lt!271951 ((_ sign_extend 32) (size!4206 (buf!4649 (_2!8250 lt!271867)))))))

(assert (= (and d!62329 res!146442) b!176731))

(assert (= (and b!176731 res!146443) b!176732))

(declare-fun m!276785 () Bool)

(assert (=> d!62329 m!276785))

(assert (=> d!62329 m!276733))

(assert (=> b!176679 d!62329))

(declare-fun d!62331 () Bool)

(declare-fun e!123180 () Bool)

(assert (=> d!62331 e!123180))

(declare-fun res!146444 () Bool)

(assert (=> d!62331 (=> (not res!146444) (not e!123180))))

(declare-fun lt!271955 () (_ BitVec 64))

(declare-fun lt!271953 () (_ BitVec 64))

(declare-fun lt!271954 () (_ BitVec 64))

(assert (=> d!62331 (= res!146444 (= lt!271955 (bvsub lt!271953 lt!271954)))))

(assert (=> d!62331 (or (= (bvand lt!271953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271954 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271953 lt!271954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62331 (= lt!271954 (remainingBits!0 ((_ sign_extend 32) (size!4206 (buf!4649 thiss!1204))) ((_ sign_extend 32) (currentByte!8811 thiss!1204)) ((_ sign_extend 32) (currentBit!8806 thiss!1204))))))

(declare-fun lt!271956 () (_ BitVec 64))

(declare-fun lt!271958 () (_ BitVec 64))

(assert (=> d!62331 (= lt!271953 (bvmul lt!271956 lt!271958))))

(assert (=> d!62331 (or (= lt!271956 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271958 (bvsdiv (bvmul lt!271956 lt!271958) lt!271956)))))

(assert (=> d!62331 (= lt!271958 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62331 (= lt!271956 ((_ sign_extend 32) (size!4206 (buf!4649 thiss!1204))))))

(assert (=> d!62331 (= lt!271955 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8811 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8806 thiss!1204))))))

(assert (=> d!62331 (invariant!0 (currentBit!8806 thiss!1204) (currentByte!8811 thiss!1204) (size!4206 (buf!4649 thiss!1204)))))

(assert (=> d!62331 (= (bitIndex!0 (size!4206 (buf!4649 thiss!1204)) (currentByte!8811 thiss!1204) (currentBit!8806 thiss!1204)) lt!271955)))

(declare-fun b!176733 () Bool)

(declare-fun res!146445 () Bool)

(assert (=> b!176733 (=> (not res!146445) (not e!123180))))

(assert (=> b!176733 (= res!146445 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271955))))

(declare-fun b!176734 () Bool)

(declare-fun lt!271957 () (_ BitVec 64))

(assert (=> b!176734 (= e!123180 (bvsle lt!271955 (bvmul lt!271957 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176734 (or (= lt!271957 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271957 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271957)))))

(assert (=> b!176734 (= lt!271957 ((_ sign_extend 32) (size!4206 (buf!4649 thiss!1204))))))

(assert (= (and d!62331 res!146444) b!176733))

(assert (= (and b!176733 res!146445) b!176734))

(declare-fun m!276787 () Bool)

(assert (=> d!62331 m!276787))

(assert (=> d!62331 m!276751))

(assert (=> b!176679 d!62331))

(declare-fun d!62333 () Bool)

(assert (=> d!62333 (= (array_inv!3947 (buf!4649 thiss!1204)) (bvsge (size!4206 (buf!4649 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!176678 d!62333))

(declare-fun d!62335 () Bool)

(assert (=> d!62335 (= (invariant!0 (currentBit!8806 thiss!1204) (currentByte!8811 thiss!1204) (size!4206 (buf!4649 thiss!1204))) (and (bvsge (currentBit!8806 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8806 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8811 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8811 thiss!1204) (size!4206 (buf!4649 thiss!1204))) (and (= (currentBit!8806 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8811 thiss!1204) (size!4206 (buf!4649 thiss!1204)))))))))

(assert (=> b!176677 d!62335))

(declare-fun d!62337 () Bool)

(declare-datatypes ((tuple2!15216 0))(
  ( (tuple2!15217 (_1!8253 Bool) (_2!8253 BitStream!7520)) )
))
(declare-fun lt!271977 () tuple2!15216)

(declare-fun readBit!0 (BitStream!7520) tuple2!15216)

(assert (=> d!62337 (= lt!271977 (readBit!0 (readerFrom!0 (_2!8250 lt!271867) (currentBit!8806 thiss!1204) (currentByte!8811 thiss!1204))))))

(assert (=> d!62337 (= (readBitPure!0 (readerFrom!0 (_2!8250 lt!271867) (currentBit!8806 thiss!1204) (currentByte!8811 thiss!1204))) (tuple2!15209 (_2!8253 lt!271977) (_1!8253 lt!271977)))))

(declare-fun bs!15540 () Bool)

(assert (= bs!15540 d!62337))

(assert (=> bs!15540 m!276747))

(declare-fun m!276789 () Bool)

(assert (=> bs!15540 m!276789))

(assert (=> b!176682 d!62337))

(declare-fun d!62339 () Bool)

(declare-fun e!123195 () Bool)

(assert (=> d!62339 e!123195))

(declare-fun res!146473 () Bool)

(assert (=> d!62339 (=> (not res!146473) (not e!123195))))

(assert (=> d!62339 (= res!146473 (invariant!0 (currentBit!8806 (_2!8250 lt!271867)) (currentByte!8811 (_2!8250 lt!271867)) (size!4206 (buf!4649 (_2!8250 lt!271867)))))))

(assert (=> d!62339 (= (readerFrom!0 (_2!8250 lt!271867) (currentBit!8806 thiss!1204) (currentByte!8811 thiss!1204)) (BitStream!7521 (buf!4649 (_2!8250 lt!271867)) (currentByte!8811 thiss!1204) (currentBit!8806 thiss!1204)))))

(declare-fun b!176763 () Bool)

(assert (=> b!176763 (= e!123195 (invariant!0 (currentBit!8806 thiss!1204) (currentByte!8811 thiss!1204) (size!4206 (buf!4649 (_2!8250 lt!271867)))))))

(assert (= (and d!62339 res!146473) b!176763))

(assert (=> d!62339 m!276733))

(declare-fun m!276819 () Bool)

(assert (=> b!176763 m!276819))

(assert (=> b!176682 d!62339))

(declare-fun d!62345 () Bool)

(assert (=> d!62345 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4206 (buf!4649 thiss!1204))) ((_ sign_extend 32) (currentByte!8811 thiss!1204)) ((_ sign_extend 32) (currentBit!8806 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4206 (buf!4649 thiss!1204))) ((_ sign_extend 32) (currentByte!8811 thiss!1204)) ((_ sign_extend 32) (currentBit!8806 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15541 () Bool)

(assert (= bs!15541 d!62345))

(assert (=> bs!15541 m!276787))

(assert (=> b!176676 d!62345))

(declare-fun d!62349 () Bool)

(assert (=> d!62349 (= (invariant!0 (currentBit!8806 (_2!8250 lt!271867)) (currentByte!8811 (_2!8250 lt!271867)) (size!4206 (buf!4649 (_2!8250 lt!271867)))) (and (bvsge (currentBit!8806 (_2!8250 lt!271867)) #b00000000000000000000000000000000) (bvslt (currentBit!8806 (_2!8250 lt!271867)) #b00000000000000000000000000001000) (bvsge (currentByte!8811 (_2!8250 lt!271867)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8811 (_2!8250 lt!271867)) (size!4206 (buf!4649 (_2!8250 lt!271867)))) (and (= (currentBit!8806 (_2!8250 lt!271867)) #b00000000000000000000000000000000) (= (currentByte!8811 (_2!8250 lt!271867)) (size!4206 (buf!4649 (_2!8250 lt!271867))))))))))

(assert (=> b!176681 d!62349))

(assert (=> b!176675 d!62329))

(assert (=> b!176675 d!62331))

(declare-fun b!176773 () Bool)

(declare-fun res!146484 () Bool)

(declare-fun e!123200 () Bool)

(assert (=> b!176773 (=> (not res!146484) (not e!123200))))

(declare-fun lt!271995 () (_ BitVec 64))

(declare-fun lt!271994 () tuple2!15210)

(declare-fun lt!271997 () (_ BitVec 64))

(assert (=> b!176773 (= res!146484 (= (bitIndex!0 (size!4206 (buf!4649 (_2!8250 lt!271994))) (currentByte!8811 (_2!8250 lt!271994)) (currentBit!8806 (_2!8250 lt!271994))) (bvadd lt!271995 lt!271997)))))

(assert (=> b!176773 (or (not (= (bvand lt!271995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271997 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271995 lt!271997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176773 (= lt!271997 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176773 (= lt!271995 (bitIndex!0 (size!4206 (buf!4649 thiss!1204)) (currentByte!8811 thiss!1204) (currentBit!8806 thiss!1204)))))

(declare-fun b!176776 () Bool)

(declare-fun e!123201 () Bool)

(declare-fun lt!271996 () tuple2!15208)

