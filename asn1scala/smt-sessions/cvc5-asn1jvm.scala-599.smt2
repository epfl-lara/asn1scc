; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17146 () Bool)

(assert start!17146)

(declare-fun b!83621 () Bool)

(declare-fun e!55668 () Bool)

(declare-fun e!55671 () Bool)

(assert (=> b!83621 (= e!55668 (not e!55671))))

(declare-fun res!68754 () Bool)

(assert (=> b!83621 (=> res!68754 e!55671)))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!133295 () (_ BitVec 64))

(declare-fun lt!133294 () (_ BitVec 64))

(assert (=> b!83621 (= res!68754 (bvsgt lt!133295 (bvsub lt!133294 b1ValidateOffsetBits!11)))))

(declare-datatypes ((array!3857 0))(
  ( (array!3858 (arr!2391 (Array (_ BitVec 32) (_ BitVec 8))) (size!1754 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3070 0))(
  ( (BitStream!3071 (buf!2144 array!3857) (currentByte!4256 (_ BitVec 32)) (currentBit!4251 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3070)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83621 (= (remainingBits!0 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))) ((_ sign_extend 32) (currentByte!4256 b1!98)) ((_ sign_extend 32) (currentBit!4251 b1!98))) (bvsub lt!133294 lt!133295))))

(assert (=> b!83621 (= lt!133294 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98)))))))

(declare-datatypes ((Unit!5611 0))(
  ( (Unit!5612) )
))
(declare-fun lt!133298 () Unit!5611)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3070) Unit!5611)

(assert (=> b!83621 (= lt!133298 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun lt!133293 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!133299 () (_ BitVec 64))

(declare-fun b!83622 () Bool)

(assert (=> b!83622 (= e!55671 (or (not (= lt!133293 (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!133293 (bvand lt!133299 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!83622 (= lt!133293 (bvand lt!133295 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b2!98 () BitStream!3070)

(declare-fun lt!133297 () (_ BitVec 64))

(assert (=> b!83622 (= (remainingBits!0 ((_ sign_extend 32) (size!1754 (buf!2144 b2!98))) ((_ sign_extend 32) (currentByte!4256 b2!98)) ((_ sign_extend 32) (currentBit!4251 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1754 (buf!2144 b2!98)))) lt!133297))))

(declare-fun lt!133296 () Unit!5611)

(assert (=> b!83622 (= lt!133296 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83623 () Bool)

(declare-fun res!68752 () Bool)

(declare-fun e!55673 () Bool)

(assert (=> b!83623 (=> (not res!68752) (not e!55673))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83623 (= res!68752 (validate_offset_bits!1 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))) ((_ sign_extend 32) (currentByte!4256 b1!98)) ((_ sign_extend 32) (currentBit!4251 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83624 () Bool)

(declare-fun e!55672 () Bool)

(declare-fun array_inv!1600 (array!3857) Bool)

(assert (=> b!83624 (= e!55672 (array_inv!1600 (buf!2144 b2!98)))))

(declare-fun res!68755 () Bool)

(assert (=> start!17146 (=> (not res!68755) (not e!55673))))

(assert (=> start!17146 (= res!68755 (and (= (size!1754 (buf!2144 b1!98)) (size!1754 (buf!2144 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17146 e!55673))

(declare-fun e!55669 () Bool)

(declare-fun inv!12 (BitStream!3070) Bool)

(assert (=> start!17146 (and (inv!12 b1!98) e!55669)))

(assert (=> start!17146 (and (inv!12 b2!98) e!55672)))

(assert (=> start!17146 true))

(declare-fun b!83625 () Bool)

(assert (=> b!83625 (= e!55669 (array_inv!1600 (buf!2144 b1!98)))))

(declare-fun b!83626 () Bool)

(assert (=> b!83626 (= e!55673 e!55668)))

(declare-fun res!68753 () Bool)

(assert (=> b!83626 (=> (not res!68753) (not e!55668))))

(assert (=> b!83626 (= res!68753 (= lt!133299 lt!133297))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83626 (= lt!133297 (bitIndex!0 (size!1754 (buf!2144 b2!98)) (currentByte!4256 b2!98) (currentBit!4251 b2!98)))))

(assert (=> b!83626 (= lt!133299 (bvadd lt!133295 b1b2Diff!1))))

(assert (=> b!83626 (= lt!133295 (bitIndex!0 (size!1754 (buf!2144 b1!98)) (currentByte!4256 b1!98) (currentBit!4251 b1!98)))))

(assert (= (and start!17146 res!68755) b!83623))

(assert (= (and b!83623 res!68752) b!83626))

(assert (= (and b!83626 res!68753) b!83621))

(assert (= (and b!83621 (not res!68754)) b!83622))

(assert (= start!17146 b!83625))

(assert (= start!17146 b!83624))

(declare-fun m!130227 () Bool)

(assert (=> start!17146 m!130227))

(declare-fun m!130229 () Bool)

(assert (=> start!17146 m!130229))

(declare-fun m!130231 () Bool)

(assert (=> b!83622 m!130231))

(declare-fun m!130233 () Bool)

(assert (=> b!83622 m!130233))

(declare-fun m!130235 () Bool)

(assert (=> b!83623 m!130235))

(declare-fun m!130237 () Bool)

(assert (=> b!83624 m!130237))

(declare-fun m!130239 () Bool)

(assert (=> b!83626 m!130239))

(declare-fun m!130241 () Bool)

(assert (=> b!83626 m!130241))

(declare-fun m!130243 () Bool)

(assert (=> b!83625 m!130243))

(declare-fun m!130245 () Bool)

(assert (=> b!83621 m!130245))

(declare-fun m!130247 () Bool)

(assert (=> b!83621 m!130247))

(push 1)

(assert (not b!83622))

(assert (not b!83625))

(assert (not b!83624))

(assert (not b!83626))

(assert (not start!17146))

(assert (not b!83623))

(assert (not b!83621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26778 () Bool)

(assert (=> d!26778 (= (array_inv!1600 (buf!2144 b1!98)) (bvsge (size!1754 (buf!2144 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83625 d!26778))

(declare-fun d!26780 () Bool)

(assert (=> d!26780 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))) ((_ sign_extend 32) (currentByte!4256 b1!98)) ((_ sign_extend 32) (currentBit!4251 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))) ((_ sign_extend 32) (currentByte!4256 b1!98)) ((_ sign_extend 32) (currentBit!4251 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6594 () Bool)

(assert (= bs!6594 d!26780))

(assert (=> bs!6594 m!130245))

(assert (=> b!83623 d!26780))

(declare-fun d!26782 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26782 (= (inv!12 b1!98) (invariant!0 (currentBit!4251 b1!98) (currentByte!4256 b1!98) (size!1754 (buf!2144 b1!98))))))

(declare-fun bs!6595 () Bool)

(assert (= bs!6595 d!26782))

(declare-fun m!130301 () Bool)

(assert (=> bs!6595 m!130301))

(assert (=> start!17146 d!26782))

(declare-fun d!26784 () Bool)

(assert (=> d!26784 (= (inv!12 b2!98) (invariant!0 (currentBit!4251 b2!98) (currentByte!4256 b2!98) (size!1754 (buf!2144 b2!98))))))

(declare-fun bs!6596 () Bool)

(assert (= bs!6596 d!26784))

(declare-fun m!130303 () Bool)

(assert (=> bs!6596 m!130303))

(assert (=> start!17146 d!26784))

(declare-fun d!26786 () Bool)

(assert (=> d!26786 (= (array_inv!1600 (buf!2144 b2!98)) (bvsge (size!1754 (buf!2144 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83624 d!26786))

(declare-fun d!26788 () Bool)

(assert (=> d!26788 (= (remainingBits!0 ((_ sign_extend 32) (size!1754 (buf!2144 b2!98))) ((_ sign_extend 32) (currentByte!4256 b2!98)) ((_ sign_extend 32) (currentBit!4251 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1754 (buf!2144 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4256 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4251 b2!98)))))))

(assert (=> b!83622 d!26788))

(declare-fun d!26790 () Bool)

(declare-fun lt!133424 () (_ BitVec 64))

(declare-fun lt!133421 () (_ BitVec 64))

(assert (=> d!26790 (= (remainingBits!0 ((_ sign_extend 32) (size!1754 (buf!2144 b2!98))) ((_ sign_extend 32) (currentByte!4256 b2!98)) ((_ sign_extend 32) (currentBit!4251 b2!98))) (bvsub lt!133424 lt!133421))))

(assert (=> d!26790 (or (= (bvand lt!133424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133424 lt!133421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26790 (= lt!133421 (bitIndex!0 (size!1754 (buf!2144 b2!98)) (currentByte!4256 b2!98) (currentBit!4251 b2!98)))))

(declare-fun lt!133422 () (_ BitVec 64))

(declare-fun lt!133420 () (_ BitVec 64))

(assert (=> d!26790 (= lt!133424 (bvmul lt!133422 lt!133420))))

(assert (=> d!26790 (or (= lt!133422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133420 (bvsdiv (bvmul lt!133422 lt!133420) lt!133422)))))

(assert (=> d!26790 (= lt!133420 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26790 (= lt!133422 ((_ sign_extend 32) (size!1754 (buf!2144 b2!98))))))

(declare-fun lt!133423 () Unit!5611)

(declare-fun choose!23 (BitStream!3070) Unit!5611)

(assert (=> d!26790 (= lt!133423 (choose!23 b2!98))))

(assert (=> d!26790 (= (remainingBitsBitIndexLemma!0 b2!98) lt!133423)))

(declare-fun bs!6597 () Bool)

(assert (= bs!6597 d!26790))

(assert (=> bs!6597 m!130231))

(assert (=> bs!6597 m!130239))

(declare-fun m!130309 () Bool)

(assert (=> bs!6597 m!130309))

(assert (=> b!83622 d!26790))

(declare-fun d!26800 () Bool)

(declare-fun e!55727 () Bool)

(assert (=> d!26800 e!55727))

(declare-fun res!68800 () Bool)

(assert (=> d!26800 (=> (not res!68800) (not e!55727))))

(declare-fun lt!133461 () (_ BitVec 64))

(declare-fun lt!133460 () (_ BitVec 64))

(declare-fun lt!133459 () (_ BitVec 64))

(assert (=> d!26800 (= res!68800 (= lt!133460 (bvsub lt!133461 lt!133459)))))

(assert (=> d!26800 (or (= (bvand lt!133461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133461 lt!133459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26800 (= lt!133459 (remainingBits!0 ((_ sign_extend 32) (size!1754 (buf!2144 b2!98))) ((_ sign_extend 32) (currentByte!4256 b2!98)) ((_ sign_extend 32) (currentBit!4251 b2!98))))))

(declare-fun lt!133458 () (_ BitVec 64))

(declare-fun lt!133462 () (_ BitVec 64))

(assert (=> d!26800 (= lt!133461 (bvmul lt!133458 lt!133462))))

(assert (=> d!26800 (or (= lt!133458 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133462 (bvsdiv (bvmul lt!133458 lt!133462) lt!133458)))))

(assert (=> d!26800 (= lt!133462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26800 (= lt!133458 ((_ sign_extend 32) (size!1754 (buf!2144 b2!98))))))

(assert (=> d!26800 (= lt!133460 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4256 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4251 b2!98))))))

(assert (=> d!26800 (invariant!0 (currentBit!4251 b2!98) (currentByte!4256 b2!98) (size!1754 (buf!2144 b2!98)))))

(assert (=> d!26800 (= (bitIndex!0 (size!1754 (buf!2144 b2!98)) (currentByte!4256 b2!98) (currentBit!4251 b2!98)) lt!133460)))

(declare-fun b!83686 () Bool)

(declare-fun res!68801 () Bool)

(assert (=> b!83686 (=> (not res!68801) (not e!55727))))

(assert (=> b!83686 (= res!68801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133460))))

(declare-fun b!83687 () Bool)

(declare-fun lt!133457 () (_ BitVec 64))

(assert (=> b!83687 (= e!55727 (bvsle lt!133460 (bvmul lt!133457 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83687 (or (= lt!133457 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133457 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133457)))))

(assert (=> b!83687 (= lt!133457 ((_ sign_extend 32) (size!1754 (buf!2144 b2!98))))))

(assert (= (and d!26800 res!68800) b!83686))

(assert (= (and b!83686 res!68801) b!83687))

(assert (=> d!26800 m!130231))

(assert (=> d!26800 m!130303))

(assert (=> b!83626 d!26800))

(declare-fun d!26812 () Bool)

(declare-fun e!55728 () Bool)

(assert (=> d!26812 e!55728))

(declare-fun res!68802 () Bool)

(assert (=> d!26812 (=> (not res!68802) (not e!55728))))

(declare-fun lt!133466 () (_ BitVec 64))

(declare-fun lt!133467 () (_ BitVec 64))

(declare-fun lt!133465 () (_ BitVec 64))

(assert (=> d!26812 (= res!68802 (= lt!133466 (bvsub lt!133467 lt!133465)))))

(assert (=> d!26812 (or (= (bvand lt!133467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133465 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133467 lt!133465) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26812 (= lt!133465 (remainingBits!0 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))) ((_ sign_extend 32) (currentByte!4256 b1!98)) ((_ sign_extend 32) (currentBit!4251 b1!98))))))

(declare-fun lt!133464 () (_ BitVec 64))

(declare-fun lt!133468 () (_ BitVec 64))

(assert (=> d!26812 (= lt!133467 (bvmul lt!133464 lt!133468))))

(assert (=> d!26812 (or (= lt!133464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133468 (bvsdiv (bvmul lt!133464 lt!133468) lt!133464)))))

(assert (=> d!26812 (= lt!133468 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26812 (= lt!133464 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))))))

(assert (=> d!26812 (= lt!133466 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4256 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4251 b1!98))))))

(assert (=> d!26812 (invariant!0 (currentBit!4251 b1!98) (currentByte!4256 b1!98) (size!1754 (buf!2144 b1!98)))))

(assert (=> d!26812 (= (bitIndex!0 (size!1754 (buf!2144 b1!98)) (currentByte!4256 b1!98) (currentBit!4251 b1!98)) lt!133466)))

(declare-fun b!83688 () Bool)

(declare-fun res!68803 () Bool)

(assert (=> b!83688 (=> (not res!68803) (not e!55728))))

(assert (=> b!83688 (= res!68803 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133466))))

(declare-fun b!83689 () Bool)

(declare-fun lt!133463 () (_ BitVec 64))

(assert (=> b!83689 (= e!55728 (bvsle lt!133466 (bvmul lt!133463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83689 (or (= lt!133463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133463)))))

(assert (=> b!83689 (= lt!133463 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))))))

(assert (= (and d!26812 res!68802) b!83688))

(assert (= (and b!83688 res!68803) b!83689))

(assert (=> d!26812 m!130245))

(assert (=> d!26812 m!130301))

(assert (=> b!83626 d!26812))

(declare-fun d!26814 () Bool)

(assert (=> d!26814 (= (remainingBits!0 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))) ((_ sign_extend 32) (currentByte!4256 b1!98)) ((_ sign_extend 32) (currentBit!4251 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4256 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4251 b1!98)))))))

(assert (=> b!83621 d!26814))

(declare-fun d!26816 () Bool)

(declare-fun lt!133473 () (_ BitVec 64))

(declare-fun lt!133470 () (_ BitVec 64))

(assert (=> d!26816 (= (remainingBits!0 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))) ((_ sign_extend 32) (currentByte!4256 b1!98)) ((_ sign_extend 32) (currentBit!4251 b1!98))) (bvsub lt!133473 lt!133470))))

(assert (=> d!26816 (or (= (bvand lt!133473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133473 lt!133470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26816 (= lt!133470 (bitIndex!0 (size!1754 (buf!2144 b1!98)) (currentByte!4256 b1!98) (currentBit!4251 b1!98)))))

(declare-fun lt!133471 () (_ BitVec 64))

(declare-fun lt!133469 () (_ BitVec 64))

(assert (=> d!26816 (= lt!133473 (bvmul lt!133471 lt!133469))))

(assert (=> d!26816 (or (= lt!133471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133469 (bvsdiv (bvmul lt!133471 lt!133469) lt!133471)))))

(assert (=> d!26816 (= lt!133469 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26816 (= lt!133471 ((_ sign_extend 32) (size!1754 (buf!2144 b1!98))))))

(declare-fun lt!133472 () Unit!5611)

(assert (=> d!26816 (= lt!133472 (choose!23 b1!98))))

(assert (=> d!26816 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133472)))

(declare-fun bs!6603 () Bool)

(assert (= bs!6603 d!26816))

(assert (=> bs!6603 m!130245))

(assert (=> bs!6603 m!130241))

(declare-fun m!130315 () Bool)

(assert (=> bs!6603 m!130315))

(assert (=> b!83621 d!26816))

(push 1)

(assert (not d!26780))

(assert (not d!26784))

(assert (not d!26800))

(assert (not d!26812))

(assert (not d!26816))

(assert (not d!26790))

(assert (not d!26782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

