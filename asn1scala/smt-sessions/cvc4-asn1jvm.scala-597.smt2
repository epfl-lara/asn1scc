; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17102 () Bool)

(assert start!17102)

(declare-fun res!68681 () Bool)

(declare-fun e!55577 () Bool)

(assert (=> start!17102 (=> (not res!68681) (not e!55577))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3846 0))(
  ( (array!3847 (arr!2387 (Array (_ BitVec 32) (_ BitVec 8))) (size!1750 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3062 0))(
  ( (BitStream!3063 (buf!2140 array!3846) (currentByte!4243 (_ BitVec 32)) (currentBit!4238 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3062)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!3062)

(assert (=> start!17102 (= res!68681 (and (= (size!1750 (buf!2140 b1!98)) (size!1750 (buf!2140 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17102 e!55577))

(declare-fun e!55574 () Bool)

(declare-fun inv!12 (BitStream!3062) Bool)

(assert (=> start!17102 (and (inv!12 b1!98) e!55574)))

(declare-fun e!55576 () Bool)

(assert (=> start!17102 (and (inv!12 b2!98) e!55576)))

(assert (=> start!17102 true))

(declare-fun b!83523 () Bool)

(declare-fun e!55575 () Bool)

(assert (=> b!83523 (= e!55577 e!55575)))

(declare-fun res!68683 () Bool)

(assert (=> b!83523 (=> (not res!68683) (not e!55575))))

(declare-fun lt!133107 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83523 (= res!68683 (= (bvadd lt!133107 b1b2Diff!1) (bitIndex!0 (size!1750 (buf!2140 b2!98)) (currentByte!4243 b2!98) (currentBit!4238 b2!98))))))

(assert (=> b!83523 (= lt!133107 (bitIndex!0 (size!1750 (buf!2140 b1!98)) (currentByte!4243 b1!98) (currentBit!4238 b1!98)))))

(declare-fun b!83524 () Bool)

(declare-fun res!68682 () Bool)

(assert (=> b!83524 (=> (not res!68682) (not e!55577))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83524 (= res!68682 (validate_offset_bits!1 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))) ((_ sign_extend 32) (currentByte!4243 b1!98)) ((_ sign_extend 32) (currentBit!4238 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83525 () Bool)

(declare-fun array_inv!1596 (array!3846) Bool)

(assert (=> b!83525 (= e!55576 (array_inv!1596 (buf!2140 b2!98)))))

(declare-fun b!83526 () Bool)

(assert (=> b!83526 (= e!55574 (array_inv!1596 (buf!2140 b1!98)))))

(declare-fun lt!133105 () (_ BitVec 64))

(declare-fun b!83527 () Bool)

(declare-fun lt!133104 () (_ BitVec 64))

(assert (=> b!83527 (= e!55575 (not (or (= lt!133104 (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!133104 (bvand (bvsub lt!133105 b1ValidateOffsetBits!11) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!83527 (= lt!133104 (bvand lt!133105 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83527 (= (remainingBits!0 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))) ((_ sign_extend 32) (currentByte!4243 b1!98)) ((_ sign_extend 32) (currentBit!4238 b1!98))) (bvsub lt!133105 lt!133107))))

(assert (=> b!83527 (= lt!133105 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98)))))))

(declare-datatypes ((Unit!5603 0))(
  ( (Unit!5604) )
))
(declare-fun lt!133106 () Unit!5603)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3062) Unit!5603)

(assert (=> b!83527 (= lt!133106 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!17102 res!68681) b!83524))

(assert (= (and b!83524 res!68682) b!83523))

(assert (= (and b!83523 res!68683) b!83527))

(assert (= start!17102 b!83526))

(assert (= start!17102 b!83525))

(declare-fun m!130119 () Bool)

(assert (=> b!83523 m!130119))

(declare-fun m!130121 () Bool)

(assert (=> b!83523 m!130121))

(declare-fun m!130123 () Bool)

(assert (=> b!83524 m!130123))

(declare-fun m!130125 () Bool)

(assert (=> start!17102 m!130125))

(declare-fun m!130127 () Bool)

(assert (=> start!17102 m!130127))

(declare-fun m!130129 () Bool)

(assert (=> b!83527 m!130129))

(declare-fun m!130131 () Bool)

(assert (=> b!83527 m!130131))

(declare-fun m!130133 () Bool)

(assert (=> b!83525 m!130133))

(declare-fun m!130135 () Bool)

(assert (=> b!83526 m!130135))

(push 1)

(assert (not b!83523))

(assert (not start!17102))

(assert (not b!83525))

(assert (not b!83526))

(assert (not b!83524))

(assert (not b!83527))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26718 () Bool)

(assert (=> d!26718 (= (array_inv!1596 (buf!2140 b2!98)) (bvsge (size!1750 (buf!2140 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83525 d!26718))

(declare-fun d!26720 () Bool)

(assert (=> d!26720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))) ((_ sign_extend 32) (currentByte!4243 b1!98)) ((_ sign_extend 32) (currentBit!4238 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))) ((_ sign_extend 32) (currentByte!4243 b1!98)) ((_ sign_extend 32) (currentBit!4238 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6577 () Bool)

(assert (= bs!6577 d!26720))

(assert (=> bs!6577 m!130129))

(assert (=> b!83524 d!26720))

(declare-fun d!26722 () Bool)

(declare-fun e!55589 () Bool)

(assert (=> d!26722 e!55589))

(declare-fun res!68705 () Bool)

(assert (=> d!26722 (=> (not res!68705) (not e!55589))))

(declare-fun lt!133198 () (_ BitVec 64))

(declare-fun lt!133197 () (_ BitVec 64))

(declare-fun lt!133195 () (_ BitVec 64))

(assert (=> d!26722 (= res!68705 (= lt!133195 (bvsub lt!133197 lt!133198)))))

(assert (=> d!26722 (or (= (bvand lt!133197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133198 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133197 lt!133198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26722 (= lt!133198 (remainingBits!0 ((_ sign_extend 32) (size!1750 (buf!2140 b2!98))) ((_ sign_extend 32) (currentByte!4243 b2!98)) ((_ sign_extend 32) (currentBit!4238 b2!98))))))

(declare-fun lt!133193 () (_ BitVec 64))

(declare-fun lt!133194 () (_ BitVec 64))

(assert (=> d!26722 (= lt!133197 (bvmul lt!133193 lt!133194))))

(assert (=> d!26722 (or (= lt!133193 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133194 (bvsdiv (bvmul lt!133193 lt!133194) lt!133193)))))

(assert (=> d!26722 (= lt!133194 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26722 (= lt!133193 ((_ sign_extend 32) (size!1750 (buf!2140 b2!98))))))

(assert (=> d!26722 (= lt!133195 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4243 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4238 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26722 (invariant!0 (currentBit!4238 b2!98) (currentByte!4243 b2!98) (size!1750 (buf!2140 b2!98)))))

(assert (=> d!26722 (= (bitIndex!0 (size!1750 (buf!2140 b2!98)) (currentByte!4243 b2!98) (currentBit!4238 b2!98)) lt!133195)))

(declare-fun b!83550 () Bool)

(declare-fun res!68704 () Bool)

(assert (=> b!83550 (=> (not res!68704) (not e!55589))))

(assert (=> b!83550 (= res!68704 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133195))))

(declare-fun b!83551 () Bool)

(declare-fun lt!133196 () (_ BitVec 64))

(assert (=> b!83551 (= e!55589 (bvsle lt!133195 (bvmul lt!133196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83551 (or (= lt!133196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133196)))))

(assert (=> b!83551 (= lt!133196 ((_ sign_extend 32) (size!1750 (buf!2140 b2!98))))))

(assert (= (and d!26722 res!68705) b!83550))

(assert (= (and b!83550 res!68704) b!83551))

(declare-fun m!130151 () Bool)

(assert (=> d!26722 m!130151))

(declare-fun m!130153 () Bool)

(assert (=> d!26722 m!130153))

(assert (=> b!83523 d!26722))

(declare-fun d!26736 () Bool)

(declare-fun e!55590 () Bool)

(assert (=> d!26736 e!55590))

(declare-fun res!68707 () Bool)

(assert (=> d!26736 (=> (not res!68707) (not e!55590))))

(declare-fun lt!133209 () (_ BitVec 64))

(declare-fun lt!133206 () (_ BitVec 64))

(declare-fun lt!133208 () (_ BitVec 64))

(assert (=> d!26736 (= res!68707 (= lt!133206 (bvsub lt!133208 lt!133209)))))

(assert (=> d!26736 (or (= (bvand lt!133208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133209 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133208 lt!133209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26736 (= lt!133209 (remainingBits!0 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))) ((_ sign_extend 32) (currentByte!4243 b1!98)) ((_ sign_extend 32) (currentBit!4238 b1!98))))))

(declare-fun lt!133204 () (_ BitVec 64))

(declare-fun lt!133205 () (_ BitVec 64))

(assert (=> d!26736 (= lt!133208 (bvmul lt!133204 lt!133205))))

(assert (=> d!26736 (or (= lt!133204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133205 (bvsdiv (bvmul lt!133204 lt!133205) lt!133204)))))

(assert (=> d!26736 (= lt!133205 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26736 (= lt!133204 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))))))

(assert (=> d!26736 (= lt!133206 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4243 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4238 b1!98))))))

(assert (=> d!26736 (invariant!0 (currentBit!4238 b1!98) (currentByte!4243 b1!98) (size!1750 (buf!2140 b1!98)))))

(assert (=> d!26736 (= (bitIndex!0 (size!1750 (buf!2140 b1!98)) (currentByte!4243 b1!98) (currentBit!4238 b1!98)) lt!133206)))

(declare-fun b!83552 () Bool)

(declare-fun res!68706 () Bool)

(assert (=> b!83552 (=> (not res!68706) (not e!55590))))

(assert (=> b!83552 (= res!68706 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133206))))

(declare-fun b!83553 () Bool)

(declare-fun lt!133207 () (_ BitVec 64))

(assert (=> b!83553 (= e!55590 (bvsle lt!133206 (bvmul lt!133207 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83553 (or (= lt!133207 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133207 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133207)))))

(assert (=> b!83553 (= lt!133207 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))))))

(assert (= (and d!26736 res!68707) b!83552))

(assert (= (and b!83552 res!68706) b!83553))

(assert (=> d!26736 m!130129))

(declare-fun m!130157 () Bool)

(assert (=> d!26736 m!130157))

(assert (=> b!83523 d!26736))

(declare-fun d!26738 () Bool)

(assert (=> d!26738 (= (inv!12 b1!98) (invariant!0 (currentBit!4238 b1!98) (currentByte!4243 b1!98) (size!1750 (buf!2140 b1!98))))))

(declare-fun bs!6580 () Bool)

(assert (= bs!6580 d!26738))

(assert (=> bs!6580 m!130157))

(assert (=> start!17102 d!26738))

(declare-fun d!26740 () Bool)

(assert (=> d!26740 (= (inv!12 b2!98) (invariant!0 (currentBit!4238 b2!98) (currentByte!4243 b2!98) (size!1750 (buf!2140 b2!98))))))

(declare-fun bs!6581 () Bool)

(assert (= bs!6581 d!26740))

(assert (=> bs!6581 m!130153))

(assert (=> start!17102 d!26740))

(declare-fun d!26742 () Bool)

(assert (=> d!26742 (= (array_inv!1596 (buf!2140 b1!98)) (bvsge (size!1750 (buf!2140 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83526 d!26742))

(declare-fun d!26744 () Bool)

(assert (=> d!26744 (= (remainingBits!0 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))) ((_ sign_extend 32) (currentByte!4243 b1!98)) ((_ sign_extend 32) (currentBit!4238 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4243 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4238 b1!98)))))))

(assert (=> b!83527 d!26744))

(declare-fun d!26746 () Bool)

(declare-fun lt!133222 () (_ BitVec 64))

(declare-fun lt!133220 () (_ BitVec 64))

(assert (=> d!26746 (= (remainingBits!0 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))) ((_ sign_extend 32) (currentByte!4243 b1!98)) ((_ sign_extend 32) (currentBit!4238 b1!98))) (bvsub lt!133222 lt!133220))))

(assert (=> d!26746 (or (= (bvand lt!133222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133220 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133222 lt!133220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26746 (= lt!133220 (bitIndex!0 (size!1750 (buf!2140 b1!98)) (currentByte!4243 b1!98) (currentBit!4238 b1!98)))))

(declare-fun lt!133221 () (_ BitVec 64))

(declare-fun lt!133223 () (_ BitVec 64))

(assert (=> d!26746 (= lt!133222 (bvmul lt!133221 lt!133223))))

(assert (=> d!26746 (or (= lt!133221 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133223 (bvsdiv (bvmul lt!133221 lt!133223) lt!133221)))))

(assert (=> d!26746 (= lt!133223 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26746 (= lt!133221 ((_ sign_extend 32) (size!1750 (buf!2140 b1!98))))))

(declare-fun lt!133224 () Unit!5603)

(declare-fun choose!23 (BitStream!3062) Unit!5603)

(assert (=> d!26746 (= lt!133224 (choose!23 b1!98))))

(assert (=> d!26746 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133224)))

(declare-fun bs!6582 () Bool)

(assert (= bs!6582 d!26746))

(assert (=> bs!6582 m!130129))

(assert (=> bs!6582 m!130121))

(declare-fun m!130159 () Bool)

(assert (=> bs!6582 m!130159))

(assert (=> b!83527 d!26746))

(push 1)

(assert (not d!26740))

(assert (not d!26720))

(assert (not d!26738))

(assert (not d!26722))

(assert (not d!26746))

(assert (not d!26736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

