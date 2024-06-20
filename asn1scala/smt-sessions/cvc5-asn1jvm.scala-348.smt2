; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8200 () Bool)

(assert start!8200)

(declare-fun b!41039 () Bool)

(declare-fun e!27134 () Bool)

(declare-fun e!27136 () Bool)

(assert (=> b!41039 (= e!27134 e!27136)))

(declare-fun res!34929 () Bool)

(assert (=> b!41039 (=> res!34929 e!27136)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!41039 (= res!34929 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-datatypes ((array!2048 0))(
  ( (array!2049 (arr!1424 (Array (_ BitVec 32) (_ BitVec 8))) (size!925 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1594 0))(
  ( (BitStream!1595 (buf!1253 array!2048) (currentByte!2687 (_ BitVec 32)) (currentBit!2682 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3928 0))(
  ( (tuple2!3929 (_1!2051 BitStream!1594) (_2!2051 BitStream!1594)) )
))
(declare-fun lt!62203 () tuple2!3928)

(declare-fun thiss!1379 () BitStream!1594)

(declare-fun reader!0 (BitStream!1594 BitStream!1594) tuple2!3928)

(assert (=> b!41039 (= lt!62203 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!41040 () Bool)

(declare-fun e!27137 () Bool)

(declare-fun array_inv!850 (array!2048) Bool)

(assert (=> b!41040 (= e!27137 (array_inv!850 (buf!1253 thiss!1379)))))

(declare-fun b!41041 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41041 (= e!27136 (validate_offset_bits!1 ((_ sign_extend 32) (size!925 (buf!1253 (_1!2051 lt!62203)))) ((_ sign_extend 32) (currentByte!2687 (_1!2051 lt!62203))) ((_ sign_extend 32) (currentBit!2682 (_1!2051 lt!62203))) (bvsub to!314 i!635)))))

(declare-fun b!41042 () Bool)

(declare-fun e!27138 () Bool)

(assert (=> b!41042 (= e!27138 (not e!27134))))

(declare-fun res!34931 () Bool)

(assert (=> b!41042 (=> res!34931 e!27134)))

(declare-fun lt!62201 () (_ BitVec 64))

(assert (=> b!41042 (= res!34931 (or (bvslt i!635 to!314) (not (= lt!62201 (bvsub (bvadd lt!62201 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1594 BitStream!1594) Bool)

(assert (=> b!41042 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2895 0))(
  ( (Unit!2896) )
))
(declare-fun lt!62202 () Unit!2895)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1594) Unit!2895)

(assert (=> b!41042 (= lt!62202 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41042 (= lt!62201 (bitIndex!0 (size!925 (buf!1253 thiss!1379)) (currentByte!2687 thiss!1379) (currentBit!2682 thiss!1379)))))

(declare-fun b!41043 () Bool)

(declare-fun res!34928 () Bool)

(assert (=> b!41043 (=> (not res!34928) (not e!27138))))

(assert (=> b!41043 (= res!34928 (validate_offset_bits!1 ((_ sign_extend 32) (size!925 (buf!1253 thiss!1379))) ((_ sign_extend 32) (currentByte!2687 thiss!1379)) ((_ sign_extend 32) (currentBit!2682 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41044 () Bool)

(declare-fun res!34930 () Bool)

(assert (=> b!41044 (=> res!34930 e!27134)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41044 (= res!34930 (not (invariant!0 (currentBit!2682 thiss!1379) (currentByte!2687 thiss!1379) (size!925 (buf!1253 thiss!1379)))))))

(declare-fun res!34932 () Bool)

(assert (=> start!8200 (=> (not res!34932) (not e!27138))))

(declare-fun srcBuffer!2 () array!2048)

(assert (=> start!8200 (= res!34932 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!925 srcBuffer!2))))))))

(assert (=> start!8200 e!27138))

(assert (=> start!8200 true))

(assert (=> start!8200 (array_inv!850 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1594) Bool)

(assert (=> start!8200 (and (inv!12 thiss!1379) e!27137)))

(assert (= (and start!8200 res!34932) b!41043))

(assert (= (and b!41043 res!34928) b!41042))

(assert (= (and b!41042 (not res!34931)) b!41044))

(assert (= (and b!41044 (not res!34930)) b!41039))

(assert (= (and b!41039 (not res!34929)) b!41041))

(assert (= start!8200 b!41040))

(declare-fun m!62683 () Bool)

(assert (=> b!41042 m!62683))

(declare-fun m!62685 () Bool)

(assert (=> b!41042 m!62685))

(declare-fun m!62687 () Bool)

(assert (=> b!41042 m!62687))

(declare-fun m!62689 () Bool)

(assert (=> b!41044 m!62689))

(declare-fun m!62691 () Bool)

(assert (=> b!41043 m!62691))

(declare-fun m!62693 () Bool)

(assert (=> b!41040 m!62693))

(declare-fun m!62695 () Bool)

(assert (=> b!41041 m!62695))

(declare-fun m!62697 () Bool)

(assert (=> b!41039 m!62697))

(declare-fun m!62699 () Bool)

(assert (=> start!8200 m!62699))

(declare-fun m!62701 () Bool)

(assert (=> start!8200 m!62701))

(push 1)

(assert (not b!41043))

(assert (not b!41042))

(assert (not b!41041))

(assert (not b!41039))

(assert (not start!8200))

(assert (not b!41044))

(assert (not b!41040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!62304 () tuple2!3928)

(declare-fun lt!62316 () (_ BitVec 64))

(declare-fun lt!62319 () (_ BitVec 64))

(declare-fun e!27185 () Bool)

(declare-fun b!41101 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1594 (_ BitVec 64)) BitStream!1594)

(assert (=> b!41101 (= e!27185 (= (_1!2051 lt!62304) (withMovedBitIndex!0 (_2!2051 lt!62304) (bvsub lt!62319 lt!62316))))))

(assert (=> b!41101 (or (= (bvand lt!62319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62319 lt!62316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41101 (= lt!62316 (bitIndex!0 (size!925 (buf!1253 thiss!1379)) (currentByte!2687 thiss!1379) (currentBit!2682 thiss!1379)))))

(assert (=> b!41101 (= lt!62319 (bitIndex!0 (size!925 (buf!1253 thiss!1379)) (currentByte!2687 thiss!1379) (currentBit!2682 thiss!1379)))))

(declare-fun d!12032 () Bool)

(assert (=> d!12032 e!27185))

(declare-fun res!34977 () Bool)

(assert (=> d!12032 (=> (not res!34977) (not e!27185))))

(assert (=> d!12032 (= res!34977 (isPrefixOf!0 (_1!2051 lt!62304) (_2!2051 lt!62304)))))

(declare-fun lt!62314 () BitStream!1594)

(assert (=> d!12032 (= lt!62304 (tuple2!3929 lt!62314 thiss!1379))))

(declare-fun lt!62311 () Unit!2895)

(declare-fun lt!62309 () Unit!2895)

(assert (=> d!12032 (= lt!62311 lt!62309)))

(assert (=> d!12032 (isPrefixOf!0 lt!62314 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1594 BitStream!1594 BitStream!1594) Unit!2895)

(assert (=> d!12032 (= lt!62309 (lemmaIsPrefixTransitive!0 lt!62314 thiss!1379 thiss!1379))))

(declare-fun lt!62305 () Unit!2895)

(declare-fun lt!62320 () Unit!2895)

(assert (=> d!12032 (= lt!62305 lt!62320)))

(assert (=> d!12032 (isPrefixOf!0 lt!62314 thiss!1379)))

(assert (=> d!12032 (= lt!62320 (lemmaIsPrefixTransitive!0 lt!62314 thiss!1379 thiss!1379))))

(declare-fun lt!62312 () Unit!2895)

(declare-fun e!27184 () Unit!2895)

(assert (=> d!12032 (= lt!62312 e!27184)))

(declare-fun c!2756 () Bool)

(assert (=> d!12032 (= c!2756 (not (= (size!925 (buf!1253 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!62310 () Unit!2895)

(declare-fun lt!62306 () Unit!2895)

(assert (=> d!12032 (= lt!62310 lt!62306)))

(assert (=> d!12032 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12032 (= lt!62306 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62318 () Unit!2895)

(declare-fun lt!62321 () Unit!2895)

(assert (=> d!12032 (= lt!62318 lt!62321)))

(assert (=> d!12032 (= lt!62321 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62315 () Unit!2895)

(declare-fun lt!62317 () Unit!2895)

(assert (=> d!12032 (= lt!62315 lt!62317)))

(assert (=> d!12032 (isPrefixOf!0 lt!62314 lt!62314)))

(assert (=> d!12032 (= lt!62317 (lemmaIsPrefixRefl!0 lt!62314))))

(declare-fun lt!62308 () Unit!2895)

(declare-fun lt!62302 () Unit!2895)

(assert (=> d!12032 (= lt!62308 lt!62302)))

(assert (=> d!12032 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12032 (= lt!62302 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12032 (= lt!62314 (BitStream!1595 (buf!1253 thiss!1379) (currentByte!2687 thiss!1379) (currentBit!2682 thiss!1379)))))

(assert (=> d!12032 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12032 (= (reader!0 thiss!1379 thiss!1379) lt!62304)))

(declare-fun b!41102 () Bool)

(declare-fun res!34976 () Bool)

(assert (=> b!41102 (=> (not res!34976) (not e!27185))))

(assert (=> b!41102 (= res!34976 (isPrefixOf!0 (_1!2051 lt!62304) thiss!1379))))

(declare-fun b!41103 () Bool)

(declare-fun res!34975 () Bool)

(assert (=> b!41103 (=> (not res!34975) (not e!27185))))

(assert (=> b!41103 (= res!34975 (isPrefixOf!0 (_2!2051 lt!62304) thiss!1379))))

(declare-fun b!41104 () Bool)

(declare-fun Unit!2902 () Unit!2895)

(assert (=> b!41104 (= e!27184 Unit!2902)))

(declare-fun b!41105 () Bool)

(declare-fun lt!62303 () Unit!2895)

(assert (=> b!41105 (= e!27184 lt!62303)))

(declare-fun lt!62307 () (_ BitVec 64))

(assert (=> b!41105 (= lt!62307 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!62313 () (_ BitVec 64))

(assert (=> b!41105 (= lt!62313 (bitIndex!0 (size!925 (buf!1253 thiss!1379)) (currentByte!2687 thiss!1379) (currentBit!2682 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2048 array!2048 (_ BitVec 64) (_ BitVec 64)) Unit!2895)

(assert (=> b!41105 (= lt!62303 (arrayBitRangesEqSymmetric!0 (buf!1253 thiss!1379) (buf!1253 thiss!1379) lt!62307 lt!62313))))

(declare-fun arrayBitRangesEq!0 (array!2048 array!2048 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41105 (arrayBitRangesEq!0 (buf!1253 thiss!1379) (buf!1253 thiss!1379) lt!62307 lt!62313)))

(assert (= (and d!12032 c!2756) b!41105))

(assert (= (and d!12032 (not c!2756)) b!41104))

(assert (= (and d!12032 res!34977) b!41102))

(assert (= (and b!41102 res!34976) b!41103))

(assert (= (and b!41103 res!34975) b!41101))

(declare-fun m!62745 () Bool)

(assert (=> b!41101 m!62745))

(assert (=> b!41101 m!62687))

(assert (=> b!41101 m!62687))

(declare-fun m!62747 () Bool)

(assert (=> b!41102 m!62747))

(assert (=> b!41105 m!62687))

(declare-fun m!62749 () Bool)

(assert (=> b!41105 m!62749))

(declare-fun m!62751 () Bool)

(assert (=> b!41105 m!62751))

(declare-fun m!62753 () Bool)

(assert (=> d!12032 m!62753))

(assert (=> d!12032 m!62685))

(declare-fun m!62755 () Bool)

(assert (=> d!12032 m!62755))

(assert (=> d!12032 m!62683))

(assert (=> d!12032 m!62683))

(declare-fun m!62757 () Bool)

(assert (=> d!12032 m!62757))

(assert (=> d!12032 m!62685))

(assert (=> d!12032 m!62755))

(assert (=> d!12032 m!62683))

(declare-fun m!62759 () Bool)

(assert (=> d!12032 m!62759))

(declare-fun m!62761 () Bool)

(assert (=> d!12032 m!62761))

(declare-fun m!62763 () Bool)

(assert (=> b!41103 m!62763))

(assert (=> b!41039 d!12032))

(declare-fun d!12044 () Bool)

(assert (=> d!12044 (= (array_inv!850 (buf!1253 thiss!1379)) (bvsge (size!925 (buf!1253 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!41040 d!12044))

(declare-fun d!12046 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12046 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!925 (buf!1253 (_1!2051 lt!62203)))) ((_ sign_extend 32) (currentByte!2687 (_1!2051 lt!62203))) ((_ sign_extend 32) (currentBit!2682 (_1!2051 lt!62203))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!925 (buf!1253 (_1!2051 lt!62203)))) ((_ sign_extend 32) (currentByte!2687 (_1!2051 lt!62203))) ((_ sign_extend 32) (currentBit!2682 (_1!2051 lt!62203)))) (bvsub to!314 i!635)))))

(declare-fun bs!3210 () Bool)

(assert (= bs!3210 d!12046))

(declare-fun m!62777 () Bool)

(assert (=> bs!3210 m!62777))

(assert (=> b!41041 d!12046))

(declare-fun d!12048 () Bool)

(declare-fun res!34988 () Bool)

(declare-fun e!27192 () Bool)

(assert (=> d!12048 (=> (not res!34988) (not e!27192))))

(assert (=> d!12048 (= res!34988 (= (size!925 (buf!1253 thiss!1379)) (size!925 (buf!1253 thiss!1379))))))

(assert (=> d!12048 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!27192)))

(declare-fun b!41117 () Bool)

(declare-fun res!34987 () Bool)

(assert (=> b!41117 (=> (not res!34987) (not e!27192))))

(assert (=> b!41117 (= res!34987 (bvsle (bitIndex!0 (size!925 (buf!1253 thiss!1379)) (currentByte!2687 thiss!1379) (currentBit!2682 thiss!1379)) (bitIndex!0 (size!925 (buf!1253 thiss!1379)) (currentByte!2687 thiss!1379) (currentBit!2682 thiss!1379))))))

(declare-fun b!41118 () Bool)

(declare-fun e!27193 () Bool)

(assert (=> b!41118 (= e!27192 e!27193)))

(declare-fun res!34989 () Bool)

(assert (=> b!41118 (=> res!34989 e!27193)))

(assert (=> b!41118 (= res!34989 (= (size!925 (buf!1253 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!41119 () Bool)

(assert (=> b!41119 (= e!27193 (arrayBitRangesEq!0 (buf!1253 thiss!1379) (buf!1253 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!925 (buf!1253 thiss!1379)) (currentByte!2687 thiss!1379) (currentBit!2682 thiss!1379))))))

(assert (= (and d!12048 res!34988) b!41117))

(assert (= (and b!41117 res!34987) b!41118))

(assert (= (and b!41118 (not res!34989)) b!41119))

(assert (=> b!41117 m!62687))

(assert (=> b!41117 m!62687))

(assert (=> b!41119 m!62687))

(assert (=> b!41119 m!62687))

(declare-fun m!62789 () Bool)

(assert (=> b!41119 m!62789))

(assert (=> b!41042 d!12048))

(declare-fun d!12060 () Bool)

(assert (=> d!12060 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62344 () Unit!2895)

(declare-fun choose!11 (BitStream!1594) Unit!2895)

(assert (=> d!12060 (= lt!62344 (choose!11 thiss!1379))))

(assert (=> d!12060 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62344)))

(declare-fun bs!3214 () Bool)

(assert (= bs!3214 d!12060))

(assert (=> bs!3214 m!62683))

(declare-fun m!62791 () Bool)

(assert (=> bs!3214 m!62791))

(assert (=> b!41042 d!12060))

(declare-fun d!12062 () Bool)

(declare-fun e!27206 () Bool)

(assert (=> d!12062 e!27206))

(declare-fun res!35009 () Bool)

(assert (=> d!12062 (=> (not res!35009) (not e!27206))))

(declare-fun lt!62401 () (_ BitVec 64))

(declare-fun lt!62403 () (_ BitVec 64))

(declare-fun lt!62400 () (_ BitVec 64))

(assert (=> d!12062 (= res!35009 (= lt!62401 (bvsub lt!62400 lt!62403)))))

(assert (=> d!12062 (or (= (bvand lt!62400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62403 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62400 lt!62403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12062 (= lt!62403 (remainingBits!0 ((_ sign_extend 32) (size!925 (buf!1253 thiss!1379))) ((_ sign_extend 32) (currentByte!2687 thiss!1379)) ((_ sign_extend 32) (currentBit!2682 thiss!1379))))))

(declare-fun lt!62404 () (_ BitVec 64))

(declare-fun lt!62402 () (_ BitVec 64))

(assert (=> d!12062 (= lt!62400 (bvmul lt!62404 lt!62402))))

(assert (=> d!12062 (or (= lt!62404 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62402 (bvsdiv (bvmul lt!62404 lt!62402) lt!62404)))))

(assert (=> d!12062 (= lt!62402 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12062 (= lt!62404 ((_ sign_extend 32) (size!925 (buf!1253 thiss!1379))))))

(assert (=> d!12062 (= lt!62401 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2687 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2682 thiss!1379))))))

(assert (=> d!12062 (invariant!0 (currentBit!2682 thiss!1379) (currentByte!2687 thiss!1379) (size!925 (buf!1253 thiss!1379)))))

(assert (=> d!12062 (= (bitIndex!0 (size!925 (buf!1253 thiss!1379)) (currentByte!2687 thiss!1379) (currentBit!2682 thiss!1379)) lt!62401)))

(declare-fun b!41143 () Bool)

(declare-fun res!35010 () Bool)

(assert (=> b!41143 (=> (not res!35010) (not e!27206))))

(assert (=> b!41143 (= res!35010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62401))))

(declare-fun b!41144 () Bool)

(declare-fun lt!62405 () (_ BitVec 64))

(assert (=> b!41144 (= e!27206 (bvsle lt!62401 (bvmul lt!62405 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!41144 (or (= lt!62405 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62405 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62405)))))

(assert (=> b!41144 (= lt!62405 ((_ sign_extend 32) (size!925 (buf!1253 thiss!1379))))))

(assert (= (and d!12062 res!35009) b!41143))

(assert (= (and b!41143 res!35010) b!41144))

(declare-fun m!62797 () Bool)

(assert (=> d!12062 m!62797))

(assert (=> d!12062 m!62689))

(assert (=> b!41042 d!12062))

(declare-fun d!12068 () Bool)

(assert (=> d!12068 (= (array_inv!850 srcBuffer!2) (bvsge (size!925 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8200 d!12068))

(declare-fun d!12070 () Bool)

(assert (=> d!12070 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2682 thiss!1379) (currentByte!2687 thiss!1379) (size!925 (buf!1253 thiss!1379))))))

(declare-fun bs!3217 () Bool)

(assert (= bs!3217 d!12070))

(assert (=> bs!3217 m!62689))

(assert (=> start!8200 d!12070))

(declare-fun d!12072 () Bool)

(assert (=> d!12072 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!925 (buf!1253 thiss!1379))) ((_ sign_extend 32) (currentByte!2687 thiss!1379)) ((_ sign_extend 32) (currentBit!2682 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!925 (buf!1253 thiss!1379))) ((_ sign_extend 32) (currentByte!2687 thiss!1379)) ((_ sign_extend 32) (currentBit!2682 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3218 () Bool)

(assert (= bs!3218 d!12072))

(assert (=> bs!3218 m!62797))

(assert (=> b!41043 d!12072))

(declare-fun d!12074 () Bool)

(assert (=> d!12074 (= (invariant!0 (currentBit!2682 thiss!1379) (currentByte!2687 thiss!1379) (size!925 (buf!1253 thiss!1379))) (and (bvsge (currentBit!2682 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2682 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2687 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2687 thiss!1379) (size!925 (buf!1253 thiss!1379))) (and (= (currentBit!2682 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2687 thiss!1379) (size!925 (buf!1253 thiss!1379)))))))))

(assert (=> b!41044 d!12074))

(push 1)

(assert (not d!12070))

(assert (not d!12062))

(assert (not b!41102))

(assert (not b!41117))

(assert (not b!41119))

(assert (not b!41105))

(assert (not d!12060))

(assert (not b!41101))

(assert (not d!12046))

(assert (not d!12072))

(assert (not d!12032))

(assert (not b!41103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

