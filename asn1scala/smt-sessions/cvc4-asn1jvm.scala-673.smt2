; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18852 () Bool)

(assert start!18852)

(declare-fun b!94088 () Bool)

(declare-fun e!61763 () Bool)

(declare-datatypes ((array!4405 0))(
  ( (array!4406 (arr!2615 (Array (_ BitVec 32) (_ BitVec 8))) (size!2001 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3518 0))(
  ( (BitStream!3519 (buf!2368 array!4405) (currentByte!4716 (_ BitVec 32)) (currentBit!4711 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3518)

(declare-fun array_inv!1824 (array!4405) Bool)

(assert (=> b!94088 (= e!61763 (array_inv!1824 (buf!2368 bitStream1!8)))))

(declare-fun b!94089 () Bool)

(declare-fun res!77576 () Bool)

(declare-fun e!61764 () Bool)

(assert (=> b!94089 (=> (not res!77576) (not e!61764))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-datatypes ((List!865 0))(
  ( (Nil!862) (Cons!861 (h!980 Bool) (t!1615 List!865)) )
))
(declare-fun listBits!13 () List!865)

(declare-fun thiss!1534 () BitStream!3518)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3518 BitStream!3518 (_ BitVec 64)) List!865)

(assert (=> b!94089 (= res!77576 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94090 () Bool)

(declare-fun e!61756 () Bool)

(declare-fun bitStream2!8 () BitStream!3518)

(assert (=> b!94090 (= e!61756 (array_inv!1824 (buf!2368 bitStream2!8)))))

(declare-fun b!94091 () Bool)

(declare-fun res!77568 () Bool)

(assert (=> b!94091 (=> (not res!77568) (not e!61764))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94091 (= res!77568 (validate_offset_bits!1 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream1!8))) ((_ sign_extend 32) (currentByte!4716 bitStream1!8)) ((_ sign_extend 32) (currentBit!4711 bitStream1!8)) nBits!484))))

(declare-fun b!94092 () Bool)

(declare-fun res!77573 () Bool)

(assert (=> b!94092 (=> (not res!77573) (not e!61764))))

(declare-fun base!8 () BitStream!3518)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94092 (= res!77573 (bvslt (bitIndex!0 (size!2001 (buf!2368 base!8)) (currentByte!4716 base!8) (currentBit!4711 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94093 () Bool)

(declare-fun res!77567 () Bool)

(assert (=> b!94093 (=> (not res!77567) (not e!61764))))

(assert (=> b!94093 (= res!77567 (validate_offset_bits!1 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream2!8))) ((_ sign_extend 32) (currentByte!4716 bitStream2!8)) ((_ sign_extend 32) (currentBit!4711 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94094 () Bool)

(declare-fun res!77575 () Bool)

(assert (=> b!94094 (=> (not res!77575) (not e!61764))))

(declare-fun isPrefixOf!0 (BitStream!3518 BitStream!3518) Bool)

(assert (=> b!94094 (= res!77575 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94095 () Bool)

(declare-fun res!77571 () Bool)

(assert (=> b!94095 (=> (not res!77571) (not e!61764))))

(declare-fun length!456 (List!865) Int)

(assert (=> b!94095 (= res!77571 (> (length!456 listBits!13) 0))))

(declare-fun b!94096 () Bool)

(declare-fun res!77574 () Bool)

(assert (=> b!94096 (=> (not res!77574) (not e!61764))))

(assert (=> b!94096 (= res!77574 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94097 () Bool)

(declare-fun res!77569 () Bool)

(assert (=> b!94097 (=> (not res!77569) (not e!61764))))

(assert (=> b!94097 (= res!77569 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2001 (buf!2368 bitStream1!8)) (currentByte!4716 bitStream1!8) (currentBit!4711 bitStream1!8))) (bitIndex!0 (size!2001 (buf!2368 bitStream2!8)) (currentByte!4716 bitStream2!8) (currentBit!4711 bitStream2!8))))))

(declare-fun b!94098 () Bool)

(declare-fun e!61761 () Bool)

(assert (=> b!94098 (= e!61761 (array_inv!1824 (buf!2368 base!8)))))

(declare-fun b!94099 () Bool)

(declare-fun res!77572 () Bool)

(assert (=> b!94099 (=> (not res!77572) (not e!61764))))

(assert (=> b!94099 (= res!77572 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!77570 () Bool)

(assert (=> start!18852 (=> (not res!77570) (not e!61764))))

(assert (=> start!18852 (= res!77570 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18852 e!61764))

(assert (=> start!18852 true))

(declare-fun inv!12 (BitStream!3518) Bool)

(assert (=> start!18852 (and (inv!12 bitStream1!8) e!61763)))

(assert (=> start!18852 (and (inv!12 bitStream2!8) e!61756)))

(assert (=> start!18852 (and (inv!12 base!8) e!61761)))

(declare-fun e!61757 () Bool)

(assert (=> start!18852 (and (inv!12 thiss!1534) e!61757)))

(declare-fun b!94100 () Bool)

(declare-fun res!77566 () Bool)

(assert (=> b!94100 (=> (not res!77566) (not e!61764))))

(assert (=> b!94100 (= res!77566 (and (= (buf!2368 bitStream1!8) (buf!2368 bitStream2!8)) (= (buf!2368 bitStream1!8) (buf!2368 base!8))))))

(declare-fun b!94101 () Bool)

(declare-fun res!77577 () Bool)

(assert (=> b!94101 (=> (not res!77577) (not e!61764))))

(assert (=> b!94101 (= res!77577 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94102 () Bool)

(assert (=> b!94102 (= e!61757 (array_inv!1824 (buf!2368 thiss!1534)))))

(declare-fun b!94103 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94103 (= e!61764 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream1!8))) ((_ sign_extend 32) (currentByte!4716 bitStream1!8)) ((_ sign_extend 32) (currentBit!4711 bitStream1!8)))))))

(assert (= (and start!18852 res!77570) b!94095))

(assert (= (and b!94095 res!77571) b!94094))

(assert (= (and b!94094 res!77575) b!94096))

(assert (= (and b!94096 res!77574) b!94101))

(assert (= (and b!94101 res!77577) b!94100))

(assert (= (and b!94100 res!77566) b!94092))

(assert (= (and b!94092 res!77573) b!94097))

(assert (= (and b!94097 res!77569) b!94091))

(assert (= (and b!94091 res!77568) b!94093))

(assert (= (and b!94093 res!77567) b!94089))

(assert (= (and b!94089 res!77576) b!94099))

(assert (= (and b!94099 res!77572) b!94103))

(assert (= start!18852 b!94088))

(assert (= start!18852 b!94090))

(assert (= start!18852 b!94098))

(assert (= start!18852 b!94102))

(declare-fun m!137751 () Bool)

(assert (=> b!94097 m!137751))

(declare-fun m!137753 () Bool)

(assert (=> b!94097 m!137753))

(declare-fun m!137755 () Bool)

(assert (=> b!94102 m!137755))

(declare-fun m!137757 () Bool)

(assert (=> b!94096 m!137757))

(declare-fun m!137759 () Bool)

(assert (=> b!94089 m!137759))

(declare-fun m!137761 () Bool)

(assert (=> b!94093 m!137761))

(declare-fun m!137763 () Bool)

(assert (=> b!94092 m!137763))

(declare-fun m!137765 () Bool)

(assert (=> b!94095 m!137765))

(declare-fun m!137767 () Bool)

(assert (=> start!18852 m!137767))

(declare-fun m!137769 () Bool)

(assert (=> start!18852 m!137769))

(declare-fun m!137771 () Bool)

(assert (=> start!18852 m!137771))

(declare-fun m!137773 () Bool)

(assert (=> start!18852 m!137773))

(declare-fun m!137775 () Bool)

(assert (=> b!94101 m!137775))

(declare-fun m!137777 () Bool)

(assert (=> b!94098 m!137777))

(declare-fun m!137779 () Bool)

(assert (=> b!94088 m!137779))

(declare-fun m!137781 () Bool)

(assert (=> b!94094 m!137781))

(declare-fun m!137783 () Bool)

(assert (=> b!94090 m!137783))

(declare-fun m!137785 () Bool)

(assert (=> b!94091 m!137785))

(declare-fun m!137787 () Bool)

(assert (=> b!94103 m!137787))

(push 1)

(assert (not b!94094))

(assert (not b!94102))

(assert (not b!94092))

(assert (not b!94091))

(assert (not b!94089))

(assert (not b!94093))

(assert (not b!94088))

(assert (not b!94096))

(assert (not start!18852))

(assert (not b!94098))

(assert (not b!94095))

(assert (not b!94090))

(assert (not b!94101))

(assert (not b!94103))

(assert (not b!94097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29262 () Bool)

(assert (=> d!29262 (= (array_inv!1824 (buf!2368 base!8)) (bvsge (size!2001 (buf!2368 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!94098 d!29262))

(declare-fun d!29268 () Bool)

(assert (=> d!29268 (= (array_inv!1824 (buf!2368 bitStream1!8)) (bvsge (size!2001 (buf!2368 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!94088 d!29268))

(declare-fun d!29270 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29270 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4711 bitStream1!8) (currentByte!4716 bitStream1!8) (size!2001 (buf!2368 bitStream1!8))))))

(declare-fun bs!7201 () Bool)

(assert (= bs!7201 d!29270))

(declare-fun m!137827 () Bool)

(assert (=> bs!7201 m!137827))

(assert (=> start!18852 d!29270))

(declare-fun d!29272 () Bool)

(assert (=> d!29272 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4711 bitStream2!8) (currentByte!4716 bitStream2!8) (size!2001 (buf!2368 bitStream2!8))))))

(declare-fun bs!7202 () Bool)

(assert (= bs!7202 d!29272))

(declare-fun m!137829 () Bool)

(assert (=> bs!7202 m!137829))

(assert (=> start!18852 d!29272))

(declare-fun d!29274 () Bool)

(assert (=> d!29274 (= (inv!12 base!8) (invariant!0 (currentBit!4711 base!8) (currentByte!4716 base!8) (size!2001 (buf!2368 base!8))))))

(declare-fun bs!7203 () Bool)

(assert (= bs!7203 d!29274))

(declare-fun m!137831 () Bool)

(assert (=> bs!7203 m!137831))

(assert (=> start!18852 d!29274))

(declare-fun d!29276 () Bool)

(assert (=> d!29276 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4711 thiss!1534) (currentByte!4716 thiss!1534) (size!2001 (buf!2368 thiss!1534))))))

(declare-fun bs!7204 () Bool)

(assert (= bs!7204 d!29276))

(declare-fun m!137833 () Bool)

(assert (=> bs!7204 m!137833))

(assert (=> start!18852 d!29276))

(declare-fun d!29278 () Bool)

(declare-fun e!61803 () Bool)

(assert (=> d!29278 e!61803))

(declare-fun res!77633 () Bool)

(assert (=> d!29278 (=> (not res!77633) (not e!61803))))

(declare-fun lt!138679 () (_ BitVec 64))

(declare-fun lt!138680 () (_ BitVec 64))

(declare-fun lt!138683 () (_ BitVec 64))

(assert (=> d!29278 (= res!77633 (= lt!138683 (bvsub lt!138679 lt!138680)))))

(assert (=> d!29278 (or (= (bvand lt!138679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138680 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138679 lt!138680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29278 (= lt!138680 (remainingBits!0 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream1!8))) ((_ sign_extend 32) (currentByte!4716 bitStream1!8)) ((_ sign_extend 32) (currentBit!4711 bitStream1!8))))))

(declare-fun lt!138684 () (_ BitVec 64))

(declare-fun lt!138682 () (_ BitVec 64))

(assert (=> d!29278 (= lt!138679 (bvmul lt!138684 lt!138682))))

(assert (=> d!29278 (or (= lt!138684 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138682 (bvsdiv (bvmul lt!138684 lt!138682) lt!138684)))))

(assert (=> d!29278 (= lt!138682 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29278 (= lt!138684 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream1!8))))))

(assert (=> d!29278 (= lt!138683 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4716 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4711 bitStream1!8))))))

(assert (=> d!29278 (invariant!0 (currentBit!4711 bitStream1!8) (currentByte!4716 bitStream1!8) (size!2001 (buf!2368 bitStream1!8)))))

(assert (=> d!29278 (= (bitIndex!0 (size!2001 (buf!2368 bitStream1!8)) (currentByte!4716 bitStream1!8) (currentBit!4711 bitStream1!8)) lt!138683)))

(declare-fun b!94170 () Bool)

(declare-fun res!77632 () Bool)

(assert (=> b!94170 (=> (not res!77632) (not e!61803))))

(assert (=> b!94170 (= res!77632 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138683))))

(declare-fun b!94171 () Bool)

(declare-fun lt!138681 () (_ BitVec 64))

(assert (=> b!94171 (= e!61803 (bvsle lt!138683 (bvmul lt!138681 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94171 (or (= lt!138681 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138681 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138681)))))

(assert (=> b!94171 (= lt!138681 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream1!8))))))

(assert (= (and d!29278 res!77633) b!94170))

(assert (= (and b!94170 res!77632) b!94171))

(declare-fun m!137849 () Bool)

(assert (=> d!29278 m!137849))

(assert (=> d!29278 m!137827))

(assert (=> b!94097 d!29278))

(declare-fun d!29298 () Bool)

(declare-fun e!61804 () Bool)

(assert (=> d!29298 e!61804))

(declare-fun res!77635 () Bool)

(assert (=> d!29298 (=> (not res!77635) (not e!61804))))

(declare-fun lt!138685 () (_ BitVec 64))

(declare-fun lt!138689 () (_ BitVec 64))

(declare-fun lt!138686 () (_ BitVec 64))

(assert (=> d!29298 (= res!77635 (= lt!138689 (bvsub lt!138685 lt!138686)))))

(assert (=> d!29298 (or (= (bvand lt!138685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138685 lt!138686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29298 (= lt!138686 (remainingBits!0 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream2!8))) ((_ sign_extend 32) (currentByte!4716 bitStream2!8)) ((_ sign_extend 32) (currentBit!4711 bitStream2!8))))))

(declare-fun lt!138690 () (_ BitVec 64))

(declare-fun lt!138688 () (_ BitVec 64))

(assert (=> d!29298 (= lt!138685 (bvmul lt!138690 lt!138688))))

(assert (=> d!29298 (or (= lt!138690 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138688 (bvsdiv (bvmul lt!138690 lt!138688) lt!138690)))))

(assert (=> d!29298 (= lt!138688 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29298 (= lt!138690 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream2!8))))))

(assert (=> d!29298 (= lt!138689 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4716 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4711 bitStream2!8))))))

(assert (=> d!29298 (invariant!0 (currentBit!4711 bitStream2!8) (currentByte!4716 bitStream2!8) (size!2001 (buf!2368 bitStream2!8)))))

(assert (=> d!29298 (= (bitIndex!0 (size!2001 (buf!2368 bitStream2!8)) (currentByte!4716 bitStream2!8) (currentBit!4711 bitStream2!8)) lt!138689)))

(declare-fun b!94172 () Bool)

(declare-fun res!77634 () Bool)

(assert (=> b!94172 (=> (not res!77634) (not e!61804))))

(assert (=> b!94172 (= res!77634 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138689))))

(declare-fun b!94173 () Bool)

(declare-fun lt!138687 () (_ BitVec 64))

(assert (=> b!94173 (= e!61804 (bvsle lt!138689 (bvmul lt!138687 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94173 (or (= lt!138687 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138687 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138687)))))

(assert (=> b!94173 (= lt!138687 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream2!8))))))

(assert (= (and d!29298 res!77635) b!94172))

(assert (= (and b!94172 res!77634) b!94173))

(declare-fun m!137851 () Bool)

(assert (=> d!29298 m!137851))

(assert (=> d!29298 m!137829))

(assert (=> b!94097 d!29298))

(declare-fun d!29300 () Bool)

(declare-fun res!77642 () Bool)

(declare-fun e!61814 () Bool)

(assert (=> d!29300 (=> (not res!77642) (not e!61814))))

(assert (=> d!29300 (= res!77642 (= (size!2001 (buf!2368 bitStream1!8)) (size!2001 (buf!2368 bitStream2!8))))))

(assert (=> d!29300 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61814)))

(declare-fun b!94188 () Bool)

(declare-fun res!77644 () Bool)

(assert (=> b!94188 (=> (not res!77644) (not e!61814))))

(assert (=> b!94188 (= res!77644 (bvsle (bitIndex!0 (size!2001 (buf!2368 bitStream1!8)) (currentByte!4716 bitStream1!8) (currentBit!4711 bitStream1!8)) (bitIndex!0 (size!2001 (buf!2368 bitStream2!8)) (currentByte!4716 bitStream2!8) (currentBit!4711 bitStream2!8))))))

(declare-fun b!94189 () Bool)

(declare-fun e!61813 () Bool)

(assert (=> b!94189 (= e!61814 e!61813)))

(declare-fun res!77643 () Bool)

(assert (=> b!94189 (=> res!77643 e!61813)))

(assert (=> b!94189 (= res!77643 (= (size!2001 (buf!2368 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94190 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4405 array!4405 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94190 (= e!61813 (arrayBitRangesEq!0 (buf!2368 bitStream1!8) (buf!2368 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2001 (buf!2368 bitStream1!8)) (currentByte!4716 bitStream1!8) (currentBit!4711 bitStream1!8))))))

(assert (= (and d!29300 res!77642) b!94188))

(assert (= (and b!94188 res!77644) b!94189))

(assert (= (and b!94189 (not res!77643)) b!94190))

(assert (=> b!94188 m!137751))

(assert (=> b!94188 m!137753))

(assert (=> b!94190 m!137751))

(assert (=> b!94190 m!137751))

(declare-fun m!137853 () Bool)

(assert (=> b!94190 m!137853))

(assert (=> b!94101 d!29300))

(declare-fun d!29302 () Bool)

(assert (=> d!29302 (= (array_inv!1824 (buf!2368 bitStream2!8)) (bvsge (size!2001 (buf!2368 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!94090 d!29302))

(declare-fun d!29304 () Bool)

(assert (=> d!29304 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream1!8))) ((_ sign_extend 32) (currentByte!4716 bitStream1!8)) ((_ sign_extend 32) (currentBit!4711 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream1!8))) ((_ sign_extend 32) (currentByte!4716 bitStream1!8)) ((_ sign_extend 32) (currentBit!4711 bitStream1!8))) nBits!484))))

(declare-fun bs!7210 () Bool)

(assert (= bs!7210 d!29304))

(assert (=> bs!7210 m!137849))

(assert (=> b!94091 d!29304))

(declare-fun lt!138708 () (_ BitVec 64))

(declare-datatypes ((tuple2!7638 0))(
  ( (tuple2!7639 (_1!4066 Bool) (_2!4066 BitStream!3518)) )
))
(declare-fun lt!138706 () tuple2!7638)

(declare-datatypes ((tuple2!7640 0))(
  ( (tuple2!7641 (_1!4067 List!865) (_2!4067 BitStream!3518)) )
))
(declare-fun e!61821 () tuple2!7640)

(declare-fun b!94204 () Bool)

(assert (=> b!94204 (= e!61821 (tuple2!7641 (Cons!861 (_1!4066 lt!138706) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4066 lt!138706) (bvsub nBits!484 lt!138708))) (_2!4066 lt!138706)))))

(declare-fun readBit!0 (BitStream!3518) tuple2!7638)

(assert (=> b!94204 (= lt!138706 (readBit!0 bitStream1!8))))

(assert (=> b!94204 (= lt!138708 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!29306 () Bool)

(declare-fun e!61822 () Bool)

(assert (=> d!29306 e!61822))

(declare-fun c!5936 () Bool)

(assert (=> d!29306 (= c!5936 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!138707 () List!865)

(assert (=> d!29306 (= lt!138707 (_1!4067 e!61821))))

(declare-fun c!5937 () Bool)

(assert (=> d!29306 (= c!5937 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29306 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29306 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138707)))

(declare-fun b!94205 () Bool)

(declare-fun isEmpty!252 (List!865) Bool)

(assert (=> b!94205 (= e!61822 (isEmpty!252 lt!138707))))

(declare-fun b!94203 () Bool)

(assert (=> b!94203 (= e!61821 (tuple2!7641 Nil!862 bitStream1!8))))

(declare-fun b!94206 () Bool)

(assert (=> b!94206 (= e!61822 (> (length!456 lt!138707) 0))))

(assert (= (and d!29306 c!5937) b!94203))

(assert (= (and d!29306 (not c!5937)) b!94204))

(assert (= (and d!29306 c!5936) b!94205))

(assert (= (and d!29306 (not c!5936)) b!94206))

(declare-fun m!137863 () Bool)

(assert (=> b!94204 m!137863))

(declare-fun m!137865 () Bool)

(assert (=> b!94204 m!137865))

(declare-fun m!137867 () Bool)

(assert (=> b!94205 m!137867))

(declare-fun m!137869 () Bool)

(assert (=> b!94206 m!137869))

(assert (=> b!94089 d!29306))

(declare-fun d!29308 () Bool)

(assert (=> d!29308 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream2!8))) ((_ sign_extend 32) (currentByte!4716 bitStream2!8)) ((_ sign_extend 32) (currentBit!4711 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream2!8))) ((_ sign_extend 32) (currentByte!4716 bitStream2!8)) ((_ sign_extend 32) (currentBit!4711 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7211 () Bool)

(assert (= bs!7211 d!29308))

(assert (=> bs!7211 m!137851))

(assert (=> b!94093 d!29308))

(declare-fun d!29310 () Bool)

(assert (=> d!29310 (= (array_inv!1824 (buf!2368 thiss!1534)) (bvsge (size!2001 (buf!2368 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!94102 d!29310))

(declare-fun d!29312 () Bool)

(assert (=> d!29312 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream1!8))) ((_ sign_extend 32) (currentByte!4716 bitStream1!8)) ((_ sign_extend 32) (currentBit!4711 bitStream1!8))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2001 (buf!2368 bitStream1!8))) ((_ sign_extend 32) (currentByte!4716 bitStream1!8)) ((_ sign_extend 32) (currentBit!4711 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7212 () Bool)

(assert (= bs!7212 d!29312))

(assert (=> bs!7212 m!137849))

(assert (=> b!94103 d!29312))

(declare-fun d!29314 () Bool)

(declare-fun e!61823 () Bool)

(assert (=> d!29314 e!61823))

(declare-fun res!77646 () Bool)

(assert (=> d!29314 (=> (not res!77646) (not e!61823))))

(declare-fun lt!138713 () (_ BitVec 64))

(declare-fun lt!138709 () (_ BitVec 64))

(declare-fun lt!138710 () (_ BitVec 64))

(assert (=> d!29314 (= res!77646 (= lt!138713 (bvsub lt!138709 lt!138710)))))

(assert (=> d!29314 (or (= (bvand lt!138709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138710 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138709 lt!138710) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29314 (= lt!138710 (remainingBits!0 ((_ sign_extend 32) (size!2001 (buf!2368 base!8))) ((_ sign_extend 32) (currentByte!4716 base!8)) ((_ sign_extend 32) (currentBit!4711 base!8))))))

(declare-fun lt!138714 () (_ BitVec 64))

(declare-fun lt!138712 () (_ BitVec 64))

(assert (=> d!29314 (= lt!138709 (bvmul lt!138714 lt!138712))))

(assert (=> d!29314 (or (= lt!138714 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138712 (bvsdiv (bvmul lt!138714 lt!138712) lt!138714)))))

(assert (=> d!29314 (= lt!138712 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29314 (= lt!138714 ((_ sign_extend 32) (size!2001 (buf!2368 base!8))))))

(assert (=> d!29314 (= lt!138713 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4716 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4711 base!8))))))

(assert (=> d!29314 (invariant!0 (currentBit!4711 base!8) (currentByte!4716 base!8) (size!2001 (buf!2368 base!8)))))

(assert (=> d!29314 (= (bitIndex!0 (size!2001 (buf!2368 base!8)) (currentByte!4716 base!8) (currentBit!4711 base!8)) lt!138713)))

(declare-fun b!94207 () Bool)

(declare-fun res!77645 () Bool)

(assert (=> b!94207 (=> (not res!77645) (not e!61823))))

(assert (=> b!94207 (= res!77645 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138713))))

(declare-fun b!94208 () Bool)

(declare-fun lt!138711 () (_ BitVec 64))

(assert (=> b!94208 (= e!61823 (bvsle lt!138713 (bvmul lt!138711 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94208 (or (= lt!138711 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138711 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138711)))))

(assert (=> b!94208 (= lt!138711 ((_ sign_extend 32) (size!2001 (buf!2368 base!8))))))

(assert (= (and d!29314 res!77646) b!94207))

(assert (= (and b!94207 res!77645) b!94208))

(declare-fun m!137871 () Bool)

(assert (=> d!29314 m!137871))

(assert (=> d!29314 m!137831))

(assert (=> b!94092 d!29314))

(declare-fun d!29316 () Bool)

(declare-fun res!77647 () Bool)

(declare-fun e!61825 () Bool)

(assert (=> d!29316 (=> (not res!77647) (not e!61825))))

(assert (=> d!29316 (= res!77647 (= (size!2001 (buf!2368 bitStream2!8)) (size!2001 (buf!2368 base!8))))))

(assert (=> d!29316 (= (isPrefixOf!0 bitStream2!8 base!8) e!61825)))

(declare-fun b!94209 () Bool)

(declare-fun res!77649 () Bool)

(assert (=> b!94209 (=> (not res!77649) (not e!61825))))

(assert (=> b!94209 (= res!77649 (bvsle (bitIndex!0 (size!2001 (buf!2368 bitStream2!8)) (currentByte!4716 bitStream2!8) (currentBit!4711 bitStream2!8)) (bitIndex!0 (size!2001 (buf!2368 base!8)) (currentByte!4716 base!8) (currentBit!4711 base!8))))))

(declare-fun b!94210 () Bool)

(declare-fun e!61824 () Bool)

(assert (=> b!94210 (= e!61825 e!61824)))

(declare-fun res!77648 () Bool)

(assert (=> b!94210 (=> res!77648 e!61824)))

(assert (=> b!94210 (= res!77648 (= (size!2001 (buf!2368 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!94211 () Bool)

(assert (=> b!94211 (= e!61824 (arrayBitRangesEq!0 (buf!2368 bitStream2!8) (buf!2368 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2001 (buf!2368 bitStream2!8)) (currentByte!4716 bitStream2!8) (currentBit!4711 bitStream2!8))))))

(assert (= (and d!29316 res!77647) b!94209))

(assert (= (and b!94209 res!77649) b!94210))

(assert (= (and b!94210 (not res!77648)) b!94211))

(assert (=> b!94209 m!137753))

(assert (=> b!94209 m!137763))

(assert (=> b!94211 m!137753))

(assert (=> b!94211 m!137753))

(declare-fun m!137873 () Bool)

(assert (=> b!94211 m!137873))

(assert (=> b!94096 d!29316))

(declare-fun d!29318 () Bool)

(declare-fun res!77650 () Bool)

(declare-fun e!61827 () Bool)

(assert (=> d!29318 (=> (not res!77650) (not e!61827))))

(assert (=> d!29318 (= res!77650 (= (size!2001 (buf!2368 bitStream1!8)) (size!2001 (buf!2368 base!8))))))

(assert (=> d!29318 (= (isPrefixOf!0 bitStream1!8 base!8) e!61827)))

(declare-fun b!94212 () Bool)

(declare-fun res!77652 () Bool)

(assert (=> b!94212 (=> (not res!77652) (not e!61827))))

(assert (=> b!94212 (= res!77652 (bvsle (bitIndex!0 (size!2001 (buf!2368 bitStream1!8)) (currentByte!4716 bitStream1!8) (currentBit!4711 bitStream1!8)) (bitIndex!0 (size!2001 (buf!2368 base!8)) (currentByte!4716 base!8) (currentBit!4711 base!8))))))

(declare-fun b!94213 () Bool)

(declare-fun e!61826 () Bool)

(assert (=> b!94213 (= e!61827 e!61826)))

(declare-fun res!77651 () Bool)

(assert (=> b!94213 (=> res!77651 e!61826)))

(assert (=> b!94213 (= res!77651 (= (size!2001 (buf!2368 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94214 () Bool)

(assert (=> b!94214 (= e!61826 (arrayBitRangesEq!0 (buf!2368 bitStream1!8) (buf!2368 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2001 (buf!2368 bitStream1!8)) (currentByte!4716 bitStream1!8) (currentBit!4711 bitStream1!8))))))

(assert (= (and d!29318 res!77650) b!94212))

(assert (= (and b!94212 res!77652) b!94213))

(assert (= (and b!94213 (not res!77651)) b!94214))

(assert (=> b!94212 m!137751))

(assert (=> b!94212 m!137763))

(assert (=> b!94214 m!137751))

(assert (=> b!94214 m!137751))

(declare-fun m!137875 () Bool)

(assert (=> b!94214 m!137875))

(assert (=> b!94094 d!29318))

(declare-fun d!29320 () Bool)

(declare-fun size!2004 (List!865) Int)

(assert (=> d!29320 (= (length!456 listBits!13) (size!2004 listBits!13))))

(declare-fun bs!7213 () Bool)

(assert (= bs!7213 d!29320))

(declare-fun m!137877 () Bool)

(assert (=> bs!7213 m!137877))

(assert (=> b!94095 d!29320))

(push 1)

(assert (not d!29314))

(assert (not b!94206))

(assert (not b!94209))

(assert (not d!29274))

(assert (not b!94212))

(assert (not d!29304))

(assert (not b!94205))

(assert (not d!29308))

(assert (not b!94211))

(assert (not d!29272))

(assert (not b!94188))

(assert (not d!29312))

(assert (not b!94190))

(assert (not d!29276))

(assert (not d!29270))

(assert (not d!29298))

(assert (not d!29320))

(assert (not b!94214))

(assert (not b!94204))

(assert (not d!29278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

