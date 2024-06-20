; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53240 () Bool)

(assert start!53240)

(declare-fun b!247267 () Bool)

(declare-fun res!206926 () Bool)

(declare-fun e!171274 () Bool)

(assert (=> b!247267 (=> (not res!206926) (not e!171274))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!247267 (= res!206926 (bvsge from!289 nBits!297))))

(declare-fun b!247268 () Bool)

(declare-fun res!206927 () Bool)

(assert (=> b!247268 (=> (not res!206927) (not e!171274))))

(declare-datatypes ((array!13469 0))(
  ( (array!13470 (arr!6892 (Array (_ BitVec 32) (_ BitVec 8))) (size!5905 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10732 0))(
  ( (BitStream!10733 (buf!6389 array!13469) (currentByte!11791 (_ BitVec 32)) (currentBit!11786 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10732)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247268 (= res!206927 (validate_offset_bits!1 ((_ sign_extend 32) (size!5905 (buf!6389 thiss!1005))) ((_ sign_extend 32) (currentByte!11791 thiss!1005)) ((_ sign_extend 32) (currentBit!11786 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247269 () Bool)

(declare-fun e!171275 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247269 (= e!171275 (invariant!0 (currentBit!11786 thiss!1005) (currentByte!11791 thiss!1005) (size!5905 (buf!6389 thiss!1005))))))

(declare-fun res!206925 () Bool)

(assert (=> start!53240 (=> (not res!206925) (not e!171274))))

(assert (=> start!53240 (= res!206925 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53240 e!171274))

(assert (=> start!53240 true))

(declare-fun e!171273 () Bool)

(declare-fun inv!12 (BitStream!10732) Bool)

(assert (=> start!53240 (and (inv!12 thiss!1005) e!171273)))

(declare-fun b!247270 () Bool)

(declare-fun array_inv!5646 (array!13469) Bool)

(assert (=> b!247270 (= e!171273 (array_inv!5646 (buf!6389 thiss!1005)))))

(declare-fun b!247271 () Bool)

(assert (=> b!247271 (= e!171274 (not e!171275))))

(declare-fun res!206928 () Bool)

(assert (=> b!247271 (=> res!206928 e!171275)))

(assert (=> b!247271 (= res!206928 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10732 BitStream!10732) Bool)

(assert (=> b!247271 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17928 0))(
  ( (Unit!17929) )
))
(declare-fun lt!385803 () Unit!17928)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10732) Unit!17928)

(assert (=> b!247271 (= lt!385803 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (= (and start!53240 res!206925) b!247268))

(assert (= (and b!247268 res!206927) b!247267))

(assert (= (and b!247267 res!206926) b!247271))

(assert (= (and b!247271 (not res!206928)) b!247269))

(assert (= start!53240 b!247270))

(declare-fun m!373019 () Bool)

(assert (=> b!247269 m!373019))

(declare-fun m!373021 () Bool)

(assert (=> b!247268 m!373021))

(declare-fun m!373023 () Bool)

(assert (=> start!53240 m!373023))

(declare-fun m!373025 () Bool)

(assert (=> b!247271 m!373025))

(declare-fun m!373027 () Bool)

(assert (=> b!247271 m!373027))

(declare-fun m!373029 () Bool)

(assert (=> b!247270 m!373029))

(push 1)

(assert (not b!247268))

(assert (not b!247271))

(assert (not start!53240))

(assert (not b!247269))

(assert (not b!247270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82840 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82840 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5905 (buf!6389 thiss!1005))) ((_ sign_extend 32) (currentByte!11791 thiss!1005)) ((_ sign_extend 32) (currentBit!11786 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5905 (buf!6389 thiss!1005))) ((_ sign_extend 32) (currentByte!11791 thiss!1005)) ((_ sign_extend 32) (currentBit!11786 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20973 () Bool)

(assert (= bs!20973 d!82840))

(declare-fun m!373055 () Bool)

(assert (=> bs!20973 m!373055))

(assert (=> b!247268 d!82840))

(declare-fun d!82844 () Bool)

(assert (=> d!82844 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11786 thiss!1005) (currentByte!11791 thiss!1005) (size!5905 (buf!6389 thiss!1005))))))

(declare-fun bs!20974 () Bool)

(assert (= bs!20974 d!82844))

(assert (=> bs!20974 m!373019))

(assert (=> start!53240 d!82844))

(declare-fun d!82848 () Bool)

(declare-fun res!206968 () Bool)

(declare-fun e!171311 () Bool)

(assert (=> d!82848 (=> (not res!206968) (not e!171311))))

(assert (=> d!82848 (= res!206968 (= (size!5905 (buf!6389 thiss!1005)) (size!5905 (buf!6389 thiss!1005))))))

(assert (=> d!82848 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!171311)))

(declare-fun b!247317 () Bool)

(declare-fun res!206969 () Bool)

(assert (=> b!247317 (=> (not res!206969) (not e!171311))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247317 (= res!206969 (bvsle (bitIndex!0 (size!5905 (buf!6389 thiss!1005)) (currentByte!11791 thiss!1005) (currentBit!11786 thiss!1005)) (bitIndex!0 (size!5905 (buf!6389 thiss!1005)) (currentByte!11791 thiss!1005) (currentBit!11786 thiss!1005))))))

(declare-fun b!247318 () Bool)

(declare-fun e!171310 () Bool)

(assert (=> b!247318 (= e!171311 e!171310)))

(declare-fun res!206970 () Bool)

(assert (=> b!247318 (=> res!206970 e!171310)))

(assert (=> b!247318 (= res!206970 (= (size!5905 (buf!6389 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247319 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13469 array!13469 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247319 (= e!171310 (arrayBitRangesEq!0 (buf!6389 thiss!1005) (buf!6389 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5905 (buf!6389 thiss!1005)) (currentByte!11791 thiss!1005) (currentBit!11786 thiss!1005))))))

(assert (= (and d!82848 res!206968) b!247317))

(assert (= (and b!247317 res!206969) b!247318))

(assert (= (and b!247318 (not res!206970)) b!247319))

(declare-fun m!373059 () Bool)

(assert (=> b!247317 m!373059))

(assert (=> b!247317 m!373059))

(assert (=> b!247319 m!373059))

(assert (=> b!247319 m!373059))

(declare-fun m!373063 () Bool)

(assert (=> b!247319 m!373063))

(assert (=> b!247271 d!82848))

(declare-fun d!82860 () Bool)

(assert (=> d!82860 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!385815 () Unit!17928)

(declare-fun choose!11 (BitStream!10732) Unit!17928)

(assert (=> d!82860 (= lt!385815 (choose!11 thiss!1005))))

(assert (=> d!82860 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!385815)))

(declare-fun bs!20980 () Bool)

(assert (= bs!20980 d!82860))

(assert (=> bs!20980 m!373025))

(declare-fun m!373071 () Bool)

(assert (=> bs!20980 m!373071))

(assert (=> b!247271 d!82860))

(declare-fun d!82866 () Bool)

(assert (=> d!82866 (= (invariant!0 (currentBit!11786 thiss!1005) (currentByte!11791 thiss!1005) (size!5905 (buf!6389 thiss!1005))) (and (bvsge (currentBit!11786 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11786 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11791 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11791 thiss!1005) (size!5905 (buf!6389 thiss!1005))) (and (= (currentBit!11786 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11791 thiss!1005) (size!5905 (buf!6389 thiss!1005)))))))))

(assert (=> b!247269 d!82866))

(declare-fun d!82872 () Bool)

(assert (=> d!82872 (= (array_inv!5646 (buf!6389 thiss!1005)) (bvsge (size!5905 (buf!6389 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!247270 d!82872))

(push 1)

(assert (not b!247319))

