; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42832 () Bool)

(assert start!42832)

(declare-fun b!201789 () Bool)

(declare-fun e!138381 () Bool)

(declare-fun e!138379 () Bool)

(assert (=> b!201789 (= e!138381 (not e!138379))))

(declare-fun res!168974 () Bool)

(assert (=> b!201789 (=> res!168974 e!138379)))

(declare-datatypes ((array!10257 0))(
  ( (array!10258 (arr!5445 (Array (_ BitVec 32) (_ BitVec 8))) (size!4515 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8138 0))(
  ( (BitStream!8139 (buf!5020 array!10257) (currentByte!9442 (_ BitVec 32)) (currentBit!9437 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14323 0))(
  ( (Unit!14324) )
))
(declare-datatypes ((tuple2!17254 0))(
  ( (tuple2!17255 (_1!9279 Unit!14323) (_2!9279 BitStream!8138)) )
))
(declare-fun lt!314620 () tuple2!17254)

(declare-fun lt!314618 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201789 (= res!168974 (not (= (bitIndex!0 (size!4515 (buf!5020 (_2!9279 lt!314620))) (currentByte!9442 (_2!9279 lt!314620)) (currentBit!9437 (_2!9279 lt!314620))) lt!314618)))))

(declare-fun lt!314614 () (_ BitVec 64))

(assert (=> b!201789 (= lt!314618 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314614))))

(declare-fun thiss!1204 () BitStream!8138)

(assert (=> b!201789 (= lt!314614 (bitIndex!0 (size!4515 (buf!5020 thiss!1204)) (currentByte!9442 thiss!1204) (currentBit!9437 thiss!1204)))))

(declare-fun e!138380 () Bool)

(assert (=> b!201789 e!138380))

(declare-fun res!168971 () Bool)

(assert (=> b!201789 (=> (not res!168971) (not e!138380))))

(assert (=> b!201789 (= res!168971 (= (size!4515 (buf!5020 thiss!1204)) (size!4515 (buf!5020 (_2!9279 lt!314620)))))))

(declare-fun lt!314615 () Bool)

(declare-fun appendBit!0 (BitStream!8138 Bool) tuple2!17254)

(assert (=> b!201789 (= lt!314620 (appendBit!0 thiss!1204 lt!314615))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!201789 (= lt!314615 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!201790 () Bool)

(declare-fun res!168969 () Bool)

(assert (=> b!201790 (=> (not res!168969) (not e!138381))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!201790 (= res!168969 (not (= i!590 nBits!348)))))

(declare-fun b!201791 () Bool)

(declare-fun e!138383 () Bool)

(declare-fun e!138378 () Bool)

(assert (=> b!201791 (= e!138383 e!138378)))

(declare-fun res!168973 () Bool)

(assert (=> b!201791 (=> (not res!168973) (not e!138378))))

(declare-datatypes ((tuple2!17256 0))(
  ( (tuple2!17257 (_1!9280 BitStream!8138) (_2!9280 Bool)) )
))
(declare-fun lt!314621 () tuple2!17256)

(assert (=> b!201791 (= res!168973 (and (= (_2!9280 lt!314621) lt!314615) (= (_1!9280 lt!314621) (_2!9279 lt!314620))))))

(declare-fun readBitPure!0 (BitStream!8138) tuple2!17256)

(declare-fun readerFrom!0 (BitStream!8138 (_ BitVec 32) (_ BitVec 32)) BitStream!8138)

(assert (=> b!201791 (= lt!314621 (readBitPure!0 (readerFrom!0 (_2!9279 lt!314620) (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204))))))

(declare-fun b!201792 () Bool)

(declare-fun res!168967 () Bool)

(assert (=> b!201792 (=> (not res!168967) (not e!138381))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201792 (= res!168967 (invariant!0 (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204) (size!4515 (buf!5020 thiss!1204))))))

(declare-fun b!201793 () Bool)

(declare-fun res!168970 () Bool)

(assert (=> b!201793 (=> (not res!168970) (not e!138383))))

(declare-fun isPrefixOf!0 (BitStream!8138 BitStream!8138) Bool)

(assert (=> b!201793 (= res!168970 (isPrefixOf!0 thiss!1204 (_2!9279 lt!314620)))))

(declare-fun b!201794 () Bool)

(declare-fun res!168968 () Bool)

(assert (=> b!201794 (=> (not res!168968) (not e!138381))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201794 (= res!168968 (validate_offset_bits!1 ((_ sign_extend 32) (size!4515 (buf!5020 thiss!1204))) ((_ sign_extend 32) (currentByte!9442 thiss!1204)) ((_ sign_extend 32) (currentBit!9437 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201795 () Bool)

(declare-fun e!138382 () Bool)

(declare-fun array_inv!4256 (array!10257) Bool)

(assert (=> b!201795 (= e!138382 (array_inv!4256 (buf!5020 thiss!1204)))))

(declare-fun b!201796 () Bool)

(assert (=> b!201796 (= e!138380 e!138383)))

(declare-fun res!168966 () Bool)

(assert (=> b!201796 (=> (not res!168966) (not e!138383))))

(declare-fun lt!314619 () (_ BitVec 64))

(declare-fun lt!314616 () (_ BitVec 64))

(assert (=> b!201796 (= res!168966 (= lt!314619 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314616)))))

(assert (=> b!201796 (= lt!314619 (bitIndex!0 (size!4515 (buf!5020 (_2!9279 lt!314620))) (currentByte!9442 (_2!9279 lt!314620)) (currentBit!9437 (_2!9279 lt!314620))))))

(assert (=> b!201796 (= lt!314616 (bitIndex!0 (size!4515 (buf!5020 thiss!1204)) (currentByte!9442 thiss!1204) (currentBit!9437 thiss!1204)))))

(declare-fun res!168972 () Bool)

(assert (=> start!42832 (=> (not res!168972) (not e!138381))))

(assert (=> start!42832 (= res!168972 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42832 e!138381))

(assert (=> start!42832 true))

(declare-fun inv!12 (BitStream!8138) Bool)

(assert (=> start!42832 (and (inv!12 thiss!1204) e!138382)))

(declare-fun b!201797 () Bool)

(declare-fun lt!314617 () (_ BitVec 64))

(assert (=> b!201797 (= e!138379 (or (not (= lt!314617 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!314617 (bvand lt!314618 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!201797 (= lt!314617 (bvand lt!314614 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!201798 () Bool)

(assert (=> b!201798 (= e!138378 (= (bitIndex!0 (size!4515 (buf!5020 (_1!9280 lt!314621))) (currentByte!9442 (_1!9280 lt!314621)) (currentBit!9437 (_1!9280 lt!314621))) lt!314619))))

(assert (= (and start!42832 res!168972) b!201794))

(assert (= (and b!201794 res!168968) b!201792))

(assert (= (and b!201792 res!168967) b!201790))

(assert (= (and b!201790 res!168969) b!201789))

(assert (= (and b!201789 res!168971) b!201796))

(assert (= (and b!201796 res!168966) b!201793))

(assert (= (and b!201793 res!168970) b!201791))

(assert (= (and b!201791 res!168973) b!201798))

(assert (= (and b!201789 (not res!168974)) b!201797))

(assert (= start!42832 b!201795))

(declare-fun m!312323 () Bool)

(assert (=> start!42832 m!312323))

(declare-fun m!312325 () Bool)

(assert (=> b!201791 m!312325))

(assert (=> b!201791 m!312325))

(declare-fun m!312327 () Bool)

(assert (=> b!201791 m!312327))

(declare-fun m!312329 () Bool)

(assert (=> b!201796 m!312329))

(declare-fun m!312331 () Bool)

(assert (=> b!201796 m!312331))

(declare-fun m!312333 () Bool)

(assert (=> b!201795 m!312333))

(declare-fun m!312335 () Bool)

(assert (=> b!201792 m!312335))

(assert (=> b!201789 m!312329))

(assert (=> b!201789 m!312331))

(declare-fun m!312337 () Bool)

(assert (=> b!201789 m!312337))

(declare-fun m!312339 () Bool)

(assert (=> b!201793 m!312339))

(declare-fun m!312341 () Bool)

(assert (=> b!201794 m!312341))

(declare-fun m!312343 () Bool)

(assert (=> b!201798 m!312343))

(push 1)

(assert (not b!201792))

(assert (not b!201796))

(assert (not b!201789))

(assert (not b!201793))

(assert (not b!201791))

(assert (not b!201795))

(assert (not b!201794))

(assert (not b!201798))

(assert (not start!42832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69149 () Bool)

(declare-fun e!138396 () Bool)

(assert (=> d!69149 e!138396))

(declare-fun res!168997 () Bool)

(assert (=> d!69149 (=> (not res!168997) (not e!138396))))

(declare-fun lt!314693 () (_ BitVec 64))

(declare-fun lt!314691 () (_ BitVec 64))

(declare-fun lt!314689 () (_ BitVec 64))

(assert (=> d!69149 (= res!168997 (= lt!314691 (bvsub lt!314689 lt!314693)))))

(assert (=> d!69149 (or (= (bvand lt!314689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314693 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314689 lt!314693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69149 (= lt!314693 (remainingBits!0 ((_ sign_extend 32) (size!4515 (buf!5020 (_2!9279 lt!314620)))) ((_ sign_extend 32) (currentByte!9442 (_2!9279 lt!314620))) ((_ sign_extend 32) (currentBit!9437 (_2!9279 lt!314620)))))))

(declare-fun lt!314690 () (_ BitVec 64))

(declare-fun lt!314688 () (_ BitVec 64))

(assert (=> d!69149 (= lt!314689 (bvmul lt!314690 lt!314688))))

(assert (=> d!69149 (or (= lt!314690 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314688 (bvsdiv (bvmul lt!314690 lt!314688) lt!314690)))))

(assert (=> d!69149 (= lt!314688 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69149 (= lt!314690 ((_ sign_extend 32) (size!4515 (buf!5020 (_2!9279 lt!314620)))))))

(assert (=> d!69149 (= lt!314691 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9442 (_2!9279 lt!314620))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9437 (_2!9279 lt!314620)))))))

(assert (=> d!69149 (invariant!0 (currentBit!9437 (_2!9279 lt!314620)) (currentByte!9442 (_2!9279 lt!314620)) (size!4515 (buf!5020 (_2!9279 lt!314620))))))

(assert (=> d!69149 (= (bitIndex!0 (size!4515 (buf!5020 (_2!9279 lt!314620))) (currentByte!9442 (_2!9279 lt!314620)) (currentBit!9437 (_2!9279 lt!314620))) lt!314691)))

(declare-fun b!201821 () Bool)

(declare-fun res!168998 () Bool)

(assert (=> b!201821 (=> (not res!168998) (not e!138396))))

(assert (=> b!201821 (= res!168998 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314691))))

(declare-fun b!201822 () Bool)

(declare-fun lt!314692 () (_ BitVec 64))

(assert (=> b!201822 (= e!138396 (bvsle lt!314691 (bvmul lt!314692 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201822 (or (= lt!314692 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314692 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314692)))))

(assert (=> b!201822 (= lt!314692 ((_ sign_extend 32) (size!4515 (buf!5020 (_2!9279 lt!314620)))))))

(assert (= (and d!69149 res!168997) b!201821))

(assert (= (and b!201821 res!168998) b!201822))

(declare-fun m!312361 () Bool)

(assert (=> d!69149 m!312361))

(declare-fun m!312363 () Bool)

(assert (=> d!69149 m!312363))

(assert (=> b!201789 d!69149))

(declare-fun d!69159 () Bool)

(declare-fun e!138397 () Bool)

(assert (=> d!69159 e!138397))

(declare-fun res!168999 () Bool)

(assert (=> d!69159 (=> (not res!168999) (not e!138397))))

(declare-fun lt!314695 () (_ BitVec 64))

(declare-fun lt!314697 () (_ BitVec 64))

(declare-fun lt!314699 () (_ BitVec 64))

(assert (=> d!69159 (= res!168999 (= lt!314697 (bvsub lt!314695 lt!314699)))))

(assert (=> d!69159 (or (= (bvand lt!314695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314695 lt!314699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69159 (= lt!314699 (remainingBits!0 ((_ sign_extend 32) (size!4515 (buf!5020 thiss!1204))) ((_ sign_extend 32) (currentByte!9442 thiss!1204)) ((_ sign_extend 32) (currentBit!9437 thiss!1204))))))

(declare-fun lt!314696 () (_ BitVec 64))

(declare-fun lt!314694 () (_ BitVec 64))

(assert (=> d!69159 (= lt!314695 (bvmul lt!314696 lt!314694))))

(assert (=> d!69159 (or (= lt!314696 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314694 (bvsdiv (bvmul lt!314696 lt!314694) lt!314696)))))

(assert (=> d!69159 (= lt!314694 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69159 (= lt!314696 ((_ sign_extend 32) (size!4515 (buf!5020 thiss!1204))))))

(assert (=> d!69159 (= lt!314697 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9442 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9437 thiss!1204))))))

(assert (=> d!69159 (invariant!0 (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204) (size!4515 (buf!5020 thiss!1204)))))

(assert (=> d!69159 (= (bitIndex!0 (size!4515 (buf!5020 thiss!1204)) (currentByte!9442 thiss!1204) (currentBit!9437 thiss!1204)) lt!314697)))

(declare-fun b!201823 () Bool)

(declare-fun res!169000 () Bool)

(assert (=> b!201823 (=> (not res!169000) (not e!138397))))

(assert (=> b!201823 (= res!169000 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314697))))

(declare-fun b!201824 () Bool)

(declare-fun lt!314698 () (_ BitVec 64))

(assert (=> b!201824 (= e!138397 (bvsle lt!314697 (bvmul lt!314698 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201824 (or (= lt!314698 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314698 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314698)))))

(assert (=> b!201824 (= lt!314698 ((_ sign_extend 32) (size!4515 (buf!5020 thiss!1204))))))

(assert (= (and d!69159 res!168999) b!201823))

(assert (= (and b!201823 res!169000) b!201824))

(declare-fun m!312365 () Bool)

(assert (=> d!69159 m!312365))

(assert (=> d!69159 m!312335))

(assert (=> b!201789 d!69159))

(declare-fun b!201878 () Bool)

(declare-fun res!169053 () Bool)

(declare-fun e!138427 () Bool)

(assert (=> b!201878 (=> (not res!169053) (not e!138427))))

(declare-fun lt!314735 () tuple2!17254)

(declare-fun lt!314737 () (_ BitVec 64))

(declare-fun lt!314738 () (_ BitVec 64))

(assert (=> b!201878 (= res!169053 (= (bitIndex!0 (size!4515 (buf!5020 (_2!9279 lt!314735))) (currentByte!9442 (_2!9279 lt!314735)) (currentBit!9437 (_2!9279 lt!314735))) (bvadd lt!314738 lt!314737)))))

(assert (=> b!201878 (or (not (= (bvand lt!314738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314737 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!314738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!314738 lt!314737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201878 (= lt!314737 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!201878 (= lt!314738 (bitIndex!0 (size!4515 (buf!5020 thiss!1204)) (currentByte!9442 thiss!1204) (currentBit!9437 thiss!1204)))))

(declare-fun b!201881 () Bool)

(declare-fun e!138428 () Bool)

(declare-fun lt!314736 () tuple2!17256)

(assert (=> b!201881 (= e!138428 (= (bitIndex!0 (size!4515 (buf!5020 (_1!9280 lt!314736))) (currentByte!9442 (_1!9280 lt!314736)) (currentBit!9437 (_1!9280 lt!314736))) (bitIndex!0 (size!4515 (buf!5020 (_2!9279 lt!314735))) (currentByte!9442 (_2!9279 lt!314735)) (currentBit!9437 (_2!9279 lt!314735)))))))

(declare-fun b!201880 () Bool)

(assert (=> b!201880 (= e!138427 e!138428)))

(declare-fun res!169054 () Bool)

(assert (=> b!201880 (=> (not res!169054) (not e!138428))))

(assert (=> b!201880 (= res!169054 (and (= (_2!9280 lt!314736) lt!314615) (= (_1!9280 lt!314736) (_2!9279 lt!314735))))))

(assert (=> b!201880 (= lt!314736 (readBitPure!0 (readerFrom!0 (_2!9279 lt!314735) (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204))))))

(declare-fun b!201879 () Bool)

(declare-fun res!169052 () Bool)

(assert (=> b!201879 (=> (not res!169052) (not e!138427))))

(assert (=> b!201879 (= res!169052 (isPrefixOf!0 thiss!1204 (_2!9279 lt!314735)))))

(declare-fun d!69161 () Bool)

(assert (=> d!69161 e!138427))

(declare-fun res!169055 () Bool)

(assert (=> d!69161 (=> (not res!169055) (not e!138427))))

(assert (=> d!69161 (= res!169055 (= (size!4515 (buf!5020 thiss!1204)) (size!4515 (buf!5020 (_2!9279 lt!314735)))))))

(declare-fun choose!16 (BitStream!8138 Bool) tuple2!17254)

(assert (=> d!69161 (= lt!314735 (choose!16 thiss!1204 lt!314615))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69161 (validate_offset_bit!0 ((_ sign_extend 32) (size!4515 (buf!5020 thiss!1204))) ((_ sign_extend 32) (currentByte!9442 thiss!1204)) ((_ sign_extend 32) (currentBit!9437 thiss!1204)))))

(assert (=> d!69161 (= (appendBit!0 thiss!1204 lt!314615) lt!314735)))

(assert (= (and d!69161 res!169055) b!201878))

(assert (= (and b!201878 res!169053) b!201879))

(assert (= (and b!201879 res!169052) b!201880))

(assert (= (and b!201880 res!169054) b!201881))

(declare-fun m!312401 () Bool)

(assert (=> d!69161 m!312401))

(declare-fun m!312403 () Bool)

(assert (=> d!69161 m!312403))

(declare-fun m!312405 () Bool)

(assert (=> b!201879 m!312405))

(declare-fun m!312407 () Bool)

(assert (=> b!201881 m!312407))

(declare-fun m!312409 () Bool)

(assert (=> b!201881 m!312409))

(declare-fun m!312411 () Bool)

(assert (=> b!201880 m!312411))

(assert (=> b!201880 m!312411))

(declare-fun m!312413 () Bool)

(assert (=> b!201880 m!312413))

(assert (=> b!201878 m!312409))

(assert (=> b!201878 m!312331))

(assert (=> b!201789 d!69161))

(declare-fun d!69175 () Bool)

(assert (=> d!69175 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4515 (buf!5020 thiss!1204))) ((_ sign_extend 32) (currentByte!9442 thiss!1204)) ((_ sign_extend 32) (currentBit!9437 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4515 (buf!5020 thiss!1204))) ((_ sign_extend 32) (currentByte!9442 thiss!1204)) ((_ sign_extend 32) (currentBit!9437 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17066 () Bool)

(assert (= bs!17066 d!69175))

(assert (=> bs!17066 m!312365))

(assert (=> b!201794 d!69175))

(declare-fun d!69177 () Bool)

(assert (=> d!69177 (= (array_inv!4256 (buf!5020 thiss!1204)) (bvsge (size!4515 (buf!5020 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201795 d!69177))

(declare-fun d!69181 () Bool)

(declare-fun res!169068 () Bool)

(declare-fun e!138437 () Bool)

(assert (=> d!69181 (=> (not res!169068) (not e!138437))))

(assert (=> d!69181 (= res!169068 (= (size!4515 (buf!5020 thiss!1204)) (size!4515 (buf!5020 (_2!9279 lt!314620)))))))

(assert (=> d!69181 (= (isPrefixOf!0 thiss!1204 (_2!9279 lt!314620)) e!138437)))

(declare-fun b!201893 () Bool)

(declare-fun res!169069 () Bool)

(assert (=> b!201893 (=> (not res!169069) (not e!138437))))

(assert (=> b!201893 (= res!169069 (bvsle (bitIndex!0 (size!4515 (buf!5020 thiss!1204)) (currentByte!9442 thiss!1204) (currentBit!9437 thiss!1204)) (bitIndex!0 (size!4515 (buf!5020 (_2!9279 lt!314620))) (currentByte!9442 (_2!9279 lt!314620)) (currentBit!9437 (_2!9279 lt!314620)))))))

(declare-fun b!201894 () Bool)

(declare-fun e!138436 () Bool)

(assert (=> b!201894 (= e!138437 e!138436)))

(declare-fun res!169067 () Bool)

(assert (=> b!201894 (=> res!169067 e!138436)))

(assert (=> b!201894 (= res!169067 (= (size!4515 (buf!5020 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!201895 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10257 array!10257 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201895 (= e!138436 (arrayBitRangesEq!0 (buf!5020 thiss!1204) (buf!5020 (_2!9279 lt!314620)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4515 (buf!5020 thiss!1204)) (currentByte!9442 thiss!1204) (currentBit!9437 thiss!1204))))))

(assert (= (and d!69181 res!169068) b!201893))

(assert (= (and b!201893 res!169069) b!201894))

(assert (= (and b!201894 (not res!169067)) b!201895))

(assert (=> b!201893 m!312331))

(assert (=> b!201893 m!312329))

(assert (=> b!201895 m!312331))

(assert (=> b!201895 m!312331))

(declare-fun m!312423 () Bool)

(assert (=> b!201895 m!312423))

(assert (=> b!201793 d!69181))

(declare-fun d!69191 () Bool)

(declare-fun e!138438 () Bool)

(assert (=> d!69191 e!138438))

(declare-fun res!169070 () Bool)

(assert (=> d!69191 (=> (not res!169070) (not e!138438))))

(declare-fun lt!314753 () (_ BitVec 64))

(declare-fun lt!314751 () (_ BitVec 64))

(declare-fun lt!314749 () (_ BitVec 64))

(assert (=> d!69191 (= res!169070 (= lt!314751 (bvsub lt!314749 lt!314753)))))

(assert (=> d!69191 (or (= (bvand lt!314749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314753 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314749 lt!314753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69191 (= lt!314753 (remainingBits!0 ((_ sign_extend 32) (size!4515 (buf!5020 (_1!9280 lt!314621)))) ((_ sign_extend 32) (currentByte!9442 (_1!9280 lt!314621))) ((_ sign_extend 32) (currentBit!9437 (_1!9280 lt!314621)))))))

(declare-fun lt!314750 () (_ BitVec 64))

(declare-fun lt!314748 () (_ BitVec 64))

(assert (=> d!69191 (= lt!314749 (bvmul lt!314750 lt!314748))))

(assert (=> d!69191 (or (= lt!314750 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314748 (bvsdiv (bvmul lt!314750 lt!314748) lt!314750)))))

(assert (=> d!69191 (= lt!314748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69191 (= lt!314750 ((_ sign_extend 32) (size!4515 (buf!5020 (_1!9280 lt!314621)))))))

(assert (=> d!69191 (= lt!314751 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9442 (_1!9280 lt!314621))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9437 (_1!9280 lt!314621)))))))

(assert (=> d!69191 (invariant!0 (currentBit!9437 (_1!9280 lt!314621)) (currentByte!9442 (_1!9280 lt!314621)) (size!4515 (buf!5020 (_1!9280 lt!314621))))))

(assert (=> d!69191 (= (bitIndex!0 (size!4515 (buf!5020 (_1!9280 lt!314621))) (currentByte!9442 (_1!9280 lt!314621)) (currentBit!9437 (_1!9280 lt!314621))) lt!314751)))

(declare-fun b!201896 () Bool)

(declare-fun res!169071 () Bool)

(assert (=> b!201896 (=> (not res!169071) (not e!138438))))

(assert (=> b!201896 (= res!169071 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314751))))

(declare-fun b!201897 () Bool)

(declare-fun lt!314752 () (_ BitVec 64))

(assert (=> b!201897 (= e!138438 (bvsle lt!314751 (bvmul lt!314752 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201897 (or (= lt!314752 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314752 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314752)))))

(assert (=> b!201897 (= lt!314752 ((_ sign_extend 32) (size!4515 (buf!5020 (_1!9280 lt!314621)))))))

(assert (= (and d!69191 res!169070) b!201896))

(assert (= (and b!201896 res!169071) b!201897))

(declare-fun m!312425 () Bool)

(assert (=> d!69191 m!312425))

(declare-fun m!312427 () Bool)

(assert (=> d!69191 m!312427))

(assert (=> b!201798 d!69191))

(declare-fun d!69193 () Bool)

(assert (=> d!69193 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204) (size!4515 (buf!5020 thiss!1204))))))

(declare-fun bs!17068 () Bool)

(assert (= bs!17068 d!69193))

(assert (=> bs!17068 m!312335))

(assert (=> start!42832 d!69193))

(declare-fun d!69195 () Bool)

(assert (=> d!69195 (= (invariant!0 (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204) (size!4515 (buf!5020 thiss!1204))) (and (bvsge (currentBit!9437 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9437 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9442 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9442 thiss!1204) (size!4515 (buf!5020 thiss!1204))) (and (= (currentBit!9437 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9442 thiss!1204) (size!4515 (buf!5020 thiss!1204)))))))))

(assert (=> b!201792 d!69195))

(declare-fun d!69197 () Bool)

(declare-datatypes ((tuple2!17262 0))(
  ( (tuple2!17263 (_1!9283 Bool) (_2!9283 BitStream!8138)) )
))
(declare-fun lt!314756 () tuple2!17262)

(declare-fun readBit!0 (BitStream!8138) tuple2!17262)

(assert (=> d!69197 (= lt!314756 (readBit!0 (readerFrom!0 (_2!9279 lt!314620) (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204))))))

(assert (=> d!69197 (= (readBitPure!0 (readerFrom!0 (_2!9279 lt!314620) (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204))) (tuple2!17257 (_2!9283 lt!314756) (_1!9283 lt!314756)))))

(declare-fun bs!17069 () Bool)

(assert (= bs!17069 d!69197))

(assert (=> bs!17069 m!312325))

(declare-fun m!312431 () Bool)

(assert (=> bs!17069 m!312431))

(assert (=> b!201791 d!69197))

(declare-fun d!69199 () Bool)

(declare-fun e!138444 () Bool)

(assert (=> d!69199 e!138444))

(declare-fun res!169079 () Bool)

(assert (=> d!69199 (=> (not res!169079) (not e!138444))))

(assert (=> d!69199 (= res!169079 (invariant!0 (currentBit!9437 (_2!9279 lt!314620)) (currentByte!9442 (_2!9279 lt!314620)) (size!4515 (buf!5020 (_2!9279 lt!314620)))))))

(assert (=> d!69199 (= (readerFrom!0 (_2!9279 lt!314620) (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204)) (BitStream!8139 (buf!5020 (_2!9279 lt!314620)) (currentByte!9442 thiss!1204) (currentBit!9437 thiss!1204)))))

(declare-fun b!201903 () Bool)

(assert (=> b!201903 (= e!138444 (invariant!0 (currentBit!9437 thiss!1204) (currentByte!9442 thiss!1204) (size!4515 (buf!5020 (_2!9279 lt!314620)))))))

(assert (= (and d!69199 res!169079) b!201903))

(assert (=> d!69199 m!312363))

(declare-fun m!312433 () Bool)

(assert (=> b!201903 m!312433))

(assert (=> b!201791 d!69199))

(assert (=> b!201796 d!69149))

(assert (=> b!201796 d!69159))

(push 1)

(assert (not d!69175))

(assert (not b!201893))

(assert (not b!201878))

(assert (not b!201895))

(assert (not b!201903))

(assert (not d!69149))

(assert (not d!69197))

(assert (not d!69191))

(assert (not b!201881))

(assert (not d!69161))

(assert (not b!201879))

(assert (not d!69193))

(assert (not d!69199))

(assert (not d!69159))

(assert (not b!201880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

