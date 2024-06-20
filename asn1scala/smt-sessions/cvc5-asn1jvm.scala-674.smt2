; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18902 () Bool)

(assert start!18902)

(declare-fun b!94245 () Bool)

(declare-fun res!77680 () Bool)

(declare-fun e!61854 () Bool)

(assert (=> b!94245 (=> (not res!77680) (not e!61854))))

(declare-datatypes ((array!4410 0))(
  ( (array!4411 (arr!2616 (Array (_ BitVec 32) (_ BitVec 8))) (size!2005 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3520 0))(
  ( (BitStream!3521 (buf!2369 array!4410) (currentByte!4726 (_ BitVec 32)) (currentBit!4721 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3520)

(declare-fun base!8 () BitStream!3520)

(declare-fun isPrefixOf!0 (BitStream!3520 BitStream!3520) Bool)

(assert (=> b!94245 (= res!77680 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94246 () Bool)

(declare-fun res!77681 () Bool)

(assert (=> b!94246 (=> (not res!77681) (not e!61854))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94246 (= res!77681 (validate_offset_bits!1 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream1!8))) ((_ sign_extend 32) (currentByte!4726 bitStream1!8)) ((_ sign_extend 32) (currentBit!4721 bitStream1!8)) nBits!484))))

(declare-fun b!94248 () Bool)

(declare-fun res!77679 () Bool)

(assert (=> b!94248 (=> (not res!77679) (not e!61854))))

(declare-fun bitStream2!8 () BitStream!3520)

(assert (=> b!94248 (= res!77679 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94249 () Bool)

(declare-datatypes ((List!866 0))(
  ( (Nil!863) (Cons!862 (h!981 Bool) (t!1616 List!866)) )
))
(declare-fun listBits!13 () List!866)

(assert (=> b!94249 (= e!61854 (and (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (= listBits!13 Nil!863)))))

(declare-fun b!94250 () Bool)

(declare-fun res!77678 () Bool)

(assert (=> b!94250 (=> (not res!77678) (not e!61854))))

(declare-fun length!457 (List!866) Int)

(assert (=> b!94250 (= res!77678 (> (length!457 listBits!13) 0))))

(declare-fun b!94251 () Bool)

(declare-fun res!77682 () Bool)

(assert (=> b!94251 (=> (not res!77682) (not e!61854))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94251 (= res!77682 (bvslt (bitIndex!0 (size!2005 (buf!2369 base!8)) (currentByte!4726 base!8) (currentBit!4721 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94252 () Bool)

(declare-fun res!77685 () Bool)

(assert (=> b!94252 (=> (not res!77685) (not e!61854))))

(assert (=> b!94252 (= res!77685 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2005 (buf!2369 bitStream1!8)) (currentByte!4726 bitStream1!8) (currentBit!4721 bitStream1!8))) (bitIndex!0 (size!2005 (buf!2369 bitStream2!8)) (currentByte!4726 bitStream2!8) (currentBit!4721 bitStream2!8))))))

(declare-fun b!94253 () Bool)

(declare-fun e!61846 () Bool)

(declare-fun thiss!1534 () BitStream!3520)

(declare-fun array_inv!1825 (array!4410) Bool)

(assert (=> b!94253 (= e!61846 (array_inv!1825 (buf!2369 thiss!1534)))))

(declare-fun b!94254 () Bool)

(declare-fun e!61851 () Bool)

(assert (=> b!94254 (= e!61851 (array_inv!1825 (buf!2369 bitStream1!8)))))

(declare-fun b!94255 () Bool)

(declare-fun res!77684 () Bool)

(assert (=> b!94255 (=> (not res!77684) (not e!61854))))

(assert (=> b!94255 (= res!77684 (and (= (buf!2369 bitStream1!8) (buf!2369 bitStream2!8)) (= (buf!2369 bitStream1!8) (buf!2369 base!8))))))

(declare-fun b!94256 () Bool)

(declare-fun e!61850 () Bool)

(assert (=> b!94256 (= e!61850 (array_inv!1825 (buf!2369 base!8)))))

(declare-fun b!94257 () Bool)

(declare-fun res!77675 () Bool)

(assert (=> b!94257 (=> (not res!77675) (not e!61854))))

(assert (=> b!94257 (= res!77675 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94247 () Bool)

(declare-fun res!77677 () Bool)

(assert (=> b!94247 (=> (not res!77677) (not e!61854))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3520 BitStream!3520 (_ BitVec 64)) List!866)

(assert (=> b!94247 (= res!77677 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun res!77683 () Bool)

(assert (=> start!18902 (=> (not res!77683) (not e!61854))))

(assert (=> start!18902 (= res!77683 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18902 e!61854))

(assert (=> start!18902 true))

(declare-fun inv!12 (BitStream!3520) Bool)

(assert (=> start!18902 (and (inv!12 bitStream1!8) e!61851)))

(declare-fun e!61853 () Bool)

(assert (=> start!18902 (and (inv!12 bitStream2!8) e!61853)))

(assert (=> start!18902 (and (inv!12 base!8) e!61850)))

(assert (=> start!18902 (and (inv!12 thiss!1534) e!61846)))

(declare-fun b!94258 () Bool)

(declare-fun res!77676 () Bool)

(assert (=> b!94258 (=> (not res!77676) (not e!61854))))

(assert (=> b!94258 (= res!77676 (validate_offset_bits!1 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream2!8))) ((_ sign_extend 32) (currentByte!4726 bitStream2!8)) ((_ sign_extend 32) (currentBit!4721 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94259 () Bool)

(assert (=> b!94259 (= e!61853 (array_inv!1825 (buf!2369 bitStream2!8)))))

(assert (= (and start!18902 res!77683) b!94250))

(assert (= (and b!94250 res!77678) b!94245))

(assert (= (and b!94245 res!77680) b!94248))

(assert (= (and b!94248 res!77679) b!94257))

(assert (= (and b!94257 res!77675) b!94255))

(assert (= (and b!94255 res!77684) b!94251))

(assert (= (and b!94251 res!77682) b!94252))

(assert (= (and b!94252 res!77685) b!94246))

(assert (= (and b!94246 res!77681) b!94258))

(assert (= (and b!94258 res!77676) b!94247))

(assert (= (and b!94247 res!77677) b!94249))

(assert (= start!18902 b!94254))

(assert (= start!18902 b!94259))

(assert (= start!18902 b!94256))

(assert (= start!18902 b!94253))

(declare-fun m!137879 () Bool)

(assert (=> start!18902 m!137879))

(declare-fun m!137881 () Bool)

(assert (=> start!18902 m!137881))

(declare-fun m!137883 () Bool)

(assert (=> start!18902 m!137883))

(declare-fun m!137885 () Bool)

(assert (=> start!18902 m!137885))

(declare-fun m!137887 () Bool)

(assert (=> b!94251 m!137887))

(declare-fun m!137889 () Bool)

(assert (=> b!94250 m!137889))

(declare-fun m!137891 () Bool)

(assert (=> b!94256 m!137891))

(declare-fun m!137893 () Bool)

(assert (=> b!94254 m!137893))

(declare-fun m!137895 () Bool)

(assert (=> b!94246 m!137895))

(declare-fun m!137897 () Bool)

(assert (=> b!94257 m!137897))

(declare-fun m!137899 () Bool)

(assert (=> b!94245 m!137899))

(declare-fun m!137901 () Bool)

(assert (=> b!94259 m!137901))

(declare-fun m!137903 () Bool)

(assert (=> b!94248 m!137903))

(declare-fun m!137905 () Bool)

(assert (=> b!94247 m!137905))

(declare-fun m!137907 () Bool)

(assert (=> b!94252 m!137907))

(declare-fun m!137909 () Bool)

(assert (=> b!94252 m!137909))

(declare-fun m!137911 () Bool)

(assert (=> b!94258 m!137911))

(declare-fun m!137913 () Bool)

(assert (=> b!94253 m!137913))

(push 1)

(assert (not b!94251))

(assert (not b!94259))

(assert (not b!94252))

(assert (not b!94254))

(assert (not b!94250))

(assert (not b!94247))

(assert (not b!94256))

(assert (not b!94248))

(assert (not b!94258))

(assert (not b!94257))

(assert (not b!94245))

(assert (not start!18902))

(assert (not b!94253))

(assert (not b!94246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29334 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29334 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream1!8))) ((_ sign_extend 32) (currentByte!4726 bitStream1!8)) ((_ sign_extend 32) (currentBit!4721 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream1!8))) ((_ sign_extend 32) (currentByte!4726 bitStream1!8)) ((_ sign_extend 32) (currentBit!4721 bitStream1!8))) nBits!484))))

(declare-fun bs!7218 () Bool)

(assert (= bs!7218 d!29334))

(declare-fun m!138003 () Bool)

(assert (=> bs!7218 m!138003))

(assert (=> b!94246 d!29334))

(declare-fun d!29340 () Bool)

(declare-fun res!77784 () Bool)

(declare-fun e!61928 () Bool)

(assert (=> d!29340 (=> (not res!77784) (not e!61928))))

(assert (=> d!29340 (= res!77784 (= (size!2005 (buf!2369 bitStream1!8)) (size!2005 (buf!2369 bitStream2!8))))))

(assert (=> d!29340 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61928)))

(declare-fun b!94381 () Bool)

(declare-fun res!77785 () Bool)

(assert (=> b!94381 (=> (not res!77785) (not e!61928))))

(assert (=> b!94381 (= res!77785 (bvsle (bitIndex!0 (size!2005 (buf!2369 bitStream1!8)) (currentByte!4726 bitStream1!8) (currentBit!4721 bitStream1!8)) (bitIndex!0 (size!2005 (buf!2369 bitStream2!8)) (currentByte!4726 bitStream2!8) (currentBit!4721 bitStream2!8))))))

(declare-fun b!94382 () Bool)

(declare-fun e!61929 () Bool)

(assert (=> b!94382 (= e!61928 e!61929)))

(declare-fun res!77783 () Bool)

(assert (=> b!94382 (=> res!77783 e!61929)))

(assert (=> b!94382 (= res!77783 (= (size!2005 (buf!2369 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94383 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4410 array!4410 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94383 (= e!61929 (arrayBitRangesEq!0 (buf!2369 bitStream1!8) (buf!2369 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2005 (buf!2369 bitStream1!8)) (currentByte!4726 bitStream1!8) (currentBit!4721 bitStream1!8))))))

(assert (= (and d!29340 res!77784) b!94381))

(assert (= (and b!94381 res!77785) b!94382))

(assert (= (and b!94382 (not res!77783)) b!94383))

(assert (=> b!94381 m!137907))

(assert (=> b!94381 m!137909))

(assert (=> b!94383 m!137907))

(assert (=> b!94383 m!137907))

(declare-fun m!138011 () Bool)

(assert (=> b!94383 m!138011))

(assert (=> b!94257 d!29340))

(declare-fun d!29362 () Bool)

(declare-fun res!77787 () Bool)

(declare-fun e!61930 () Bool)

(assert (=> d!29362 (=> (not res!77787) (not e!61930))))

(assert (=> d!29362 (= res!77787 (= (size!2005 (buf!2369 bitStream1!8)) (size!2005 (buf!2369 base!8))))))

(assert (=> d!29362 (= (isPrefixOf!0 bitStream1!8 base!8) e!61930)))

(declare-fun b!94384 () Bool)

(declare-fun res!77788 () Bool)

(assert (=> b!94384 (=> (not res!77788) (not e!61930))))

(assert (=> b!94384 (= res!77788 (bvsle (bitIndex!0 (size!2005 (buf!2369 bitStream1!8)) (currentByte!4726 bitStream1!8) (currentBit!4721 bitStream1!8)) (bitIndex!0 (size!2005 (buf!2369 base!8)) (currentByte!4726 base!8) (currentBit!4721 base!8))))))

(declare-fun b!94385 () Bool)

(declare-fun e!61931 () Bool)

(assert (=> b!94385 (= e!61930 e!61931)))

(declare-fun res!77786 () Bool)

(assert (=> b!94385 (=> res!77786 e!61931)))

(assert (=> b!94385 (= res!77786 (= (size!2005 (buf!2369 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94386 () Bool)

(assert (=> b!94386 (= e!61931 (arrayBitRangesEq!0 (buf!2369 bitStream1!8) (buf!2369 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2005 (buf!2369 bitStream1!8)) (currentByte!4726 bitStream1!8) (currentBit!4721 bitStream1!8))))))

(assert (= (and d!29362 res!77787) b!94384))

(assert (= (and b!94384 res!77788) b!94385))

(assert (= (and b!94385 (not res!77786)) b!94386))

(assert (=> b!94384 m!137907))

(assert (=> b!94384 m!137887))

(assert (=> b!94386 m!137907))

(assert (=> b!94386 m!137907))

(declare-fun m!138013 () Bool)

(assert (=> b!94386 m!138013))

(assert (=> b!94245 d!29362))

(declare-fun d!29364 () Bool)

(assert (=> d!29364 (= (array_inv!1825 (buf!2369 base!8)) (bvsge (size!2005 (buf!2369 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!94256 d!29364))

(declare-fun d!29366 () Bool)

(assert (=> d!29366 (= (array_inv!1825 (buf!2369 bitStream2!8)) (bvsge (size!2005 (buf!2369 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!94259 d!29366))

(declare-fun d!29370 () Bool)

(declare-fun e!61947 () Bool)

(assert (=> d!29370 e!61947))

(declare-fun c!5948 () Bool)

(assert (=> d!29370 (= c!5948 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!138785 () List!866)

(declare-datatypes ((tuple2!7646 0))(
  ( (tuple2!7647 (_1!4070 List!866) (_2!4070 BitStream!3520)) )
))
(declare-fun e!61946 () tuple2!7646)

(assert (=> d!29370 (= lt!138785 (_1!4070 e!61946))))

(declare-fun c!5949 () Bool)

(assert (=> d!29370 (= c!5949 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29370 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29370 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138785)))

(declare-fun b!94415 () Bool)

(assert (=> b!94415 (= e!61946 (tuple2!7647 Nil!863 bitStream1!8))))

(declare-fun b!94418 () Bool)

(assert (=> b!94418 (= e!61947 (> (length!457 lt!138785) 0))))

(declare-fun b!94417 () Bool)

(declare-fun isEmpty!254 (List!866) Bool)

(assert (=> b!94417 (= e!61947 (isEmpty!254 lt!138785))))

(declare-fun b!94416 () Bool)

(declare-datatypes ((tuple2!7648 0))(
  ( (tuple2!7649 (_1!4071 Bool) (_2!4071 BitStream!3520)) )
))
(declare-fun lt!138784 () tuple2!7648)

(declare-fun lt!138786 () (_ BitVec 64))

(assert (=> b!94416 (= e!61946 (tuple2!7647 (Cons!862 (_1!4071 lt!138784) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4071 lt!138784) (bvsub nBits!484 lt!138786))) (_2!4071 lt!138784)))))

(declare-fun readBit!0 (BitStream!3520) tuple2!7648)

(assert (=> b!94416 (= lt!138784 (readBit!0 bitStream1!8))))

(assert (=> b!94416 (= lt!138786 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!29370 c!5949) b!94415))

(assert (= (and d!29370 (not c!5949)) b!94416))

(assert (= (and d!29370 c!5948) b!94417))

(assert (= (and d!29370 (not c!5948)) b!94418))

(declare-fun m!138033 () Bool)

(assert (=> b!94418 m!138033))

(declare-fun m!138035 () Bool)

(assert (=> b!94417 m!138035))

(declare-fun m!138037 () Bool)

(assert (=> b!94416 m!138037))

(declare-fun m!138039 () Bool)

(assert (=> b!94416 m!138039))

(assert (=> b!94247 d!29370))

(declare-fun d!29388 () Bool)

(assert (=> d!29388 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream2!8))) ((_ sign_extend 32) (currentByte!4726 bitStream2!8)) ((_ sign_extend 32) (currentBit!4721 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream2!8))) ((_ sign_extend 32) (currentByte!4726 bitStream2!8)) ((_ sign_extend 32) (currentBit!4721 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7227 () Bool)

(assert (= bs!7227 d!29388))

(declare-fun m!138041 () Bool)

(assert (=> bs!7227 m!138041))

(assert (=> b!94258 d!29388))

(declare-fun d!29390 () Bool)

(declare-fun res!77798 () Bool)

(declare-fun e!61948 () Bool)

(assert (=> d!29390 (=> (not res!77798) (not e!61948))))

(assert (=> d!29390 (= res!77798 (= (size!2005 (buf!2369 bitStream2!8)) (size!2005 (buf!2369 base!8))))))

(assert (=> d!29390 (= (isPrefixOf!0 bitStream2!8 base!8) e!61948)))

(declare-fun b!94419 () Bool)

(declare-fun res!77799 () Bool)

(assert (=> b!94419 (=> (not res!77799) (not e!61948))))

(assert (=> b!94419 (= res!77799 (bvsle (bitIndex!0 (size!2005 (buf!2369 bitStream2!8)) (currentByte!4726 bitStream2!8) (currentBit!4721 bitStream2!8)) (bitIndex!0 (size!2005 (buf!2369 base!8)) (currentByte!4726 base!8) (currentBit!4721 base!8))))))

(declare-fun b!94420 () Bool)

(declare-fun e!61949 () Bool)

(assert (=> b!94420 (= e!61948 e!61949)))

(declare-fun res!77797 () Bool)

(assert (=> b!94420 (=> res!77797 e!61949)))

(assert (=> b!94420 (= res!77797 (= (size!2005 (buf!2369 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!94421 () Bool)

(assert (=> b!94421 (= e!61949 (arrayBitRangesEq!0 (buf!2369 bitStream2!8) (buf!2369 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2005 (buf!2369 bitStream2!8)) (currentByte!4726 bitStream2!8) (currentBit!4721 bitStream2!8))))))

(assert (= (and d!29390 res!77798) b!94419))

(assert (= (and b!94419 res!77799) b!94420))

(assert (= (and b!94420 (not res!77797)) b!94421))

(assert (=> b!94419 m!137909))

(assert (=> b!94419 m!137887))

(assert (=> b!94421 m!137909))

(assert (=> b!94421 m!137909))

(declare-fun m!138043 () Bool)

(assert (=> b!94421 m!138043))

(assert (=> b!94248 d!29390))

(declare-fun d!29392 () Bool)

(declare-fun e!61958 () Bool)

(assert (=> d!29392 e!61958))

(declare-fun res!77814 () Bool)

(assert (=> d!29392 (=> (not res!77814) (not e!61958))))

(declare-fun lt!138801 () (_ BitVec 64))

(declare-fun lt!138804 () (_ BitVec 64))

(declare-fun lt!138799 () (_ BitVec 64))

(assert (=> d!29392 (= res!77814 (= lt!138801 (bvsub lt!138799 lt!138804)))))

(assert (=> d!29392 (or (= (bvand lt!138799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138804 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138799 lt!138804) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29392 (= lt!138804 (remainingBits!0 ((_ sign_extend 32) (size!2005 (buf!2369 base!8))) ((_ sign_extend 32) (currentByte!4726 base!8)) ((_ sign_extend 32) (currentBit!4721 base!8))))))

(declare-fun lt!138803 () (_ BitVec 64))

(declare-fun lt!138802 () (_ BitVec 64))

(assert (=> d!29392 (= lt!138799 (bvmul lt!138803 lt!138802))))

(assert (=> d!29392 (or (= lt!138803 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138802 (bvsdiv (bvmul lt!138803 lt!138802) lt!138803)))))

(assert (=> d!29392 (= lt!138802 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29392 (= lt!138803 ((_ sign_extend 32) (size!2005 (buf!2369 base!8))))))

(assert (=> d!29392 (= lt!138801 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4726 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4721 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29392 (invariant!0 (currentBit!4721 base!8) (currentByte!4726 base!8) (size!2005 (buf!2369 base!8)))))

(assert (=> d!29392 (= (bitIndex!0 (size!2005 (buf!2369 base!8)) (currentByte!4726 base!8) (currentBit!4721 base!8)) lt!138801)))

(declare-fun b!94435 () Bool)

(declare-fun res!77813 () Bool)

(assert (=> b!94435 (=> (not res!77813) (not e!61958))))

(assert (=> b!94435 (= res!77813 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138801))))

(declare-fun b!94436 () Bool)

(declare-fun lt!138800 () (_ BitVec 64))

(assert (=> b!94436 (= e!61958 (bvsle lt!138801 (bvmul lt!138800 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94436 (or (= lt!138800 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138800 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138800)))))

(assert (=> b!94436 (= lt!138800 ((_ sign_extend 32) (size!2005 (buf!2369 base!8))))))

(assert (= (and d!29392 res!77814) b!94435))

(assert (= (and b!94435 res!77813) b!94436))

(declare-fun m!138051 () Bool)

(assert (=> d!29392 m!138051))

(declare-fun m!138053 () Bool)

(assert (=> d!29392 m!138053))

(assert (=> b!94251 d!29392))

(declare-fun d!29406 () Bool)

(declare-fun e!61960 () Bool)

(assert (=> d!29406 e!61960))

(declare-fun res!77816 () Bool)

(assert (=> d!29406 (=> (not res!77816) (not e!61960))))

(declare-fun lt!138807 () (_ BitVec 64))

(declare-fun lt!138809 () (_ BitVec 64))

(declare-fun lt!138812 () (_ BitVec 64))

(assert (=> d!29406 (= res!77816 (= lt!138809 (bvsub lt!138807 lt!138812)))))

(assert (=> d!29406 (or (= (bvand lt!138807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138812 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138807 lt!138812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29406 (= lt!138812 (remainingBits!0 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream1!8))) ((_ sign_extend 32) (currentByte!4726 bitStream1!8)) ((_ sign_extend 32) (currentBit!4721 bitStream1!8))))))

(declare-fun lt!138811 () (_ BitVec 64))

(declare-fun lt!138810 () (_ BitVec 64))

(assert (=> d!29406 (= lt!138807 (bvmul lt!138811 lt!138810))))

(assert (=> d!29406 (or (= lt!138811 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138810 (bvsdiv (bvmul lt!138811 lt!138810) lt!138811)))))

(assert (=> d!29406 (= lt!138810 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29406 (= lt!138811 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream1!8))))))

(assert (=> d!29406 (= lt!138809 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4726 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4721 bitStream1!8))))))

(assert (=> d!29406 (invariant!0 (currentBit!4721 bitStream1!8) (currentByte!4726 bitStream1!8) (size!2005 (buf!2369 bitStream1!8)))))

(assert (=> d!29406 (= (bitIndex!0 (size!2005 (buf!2369 bitStream1!8)) (currentByte!4726 bitStream1!8) (currentBit!4721 bitStream1!8)) lt!138809)))

(declare-fun b!94441 () Bool)

(declare-fun res!77815 () Bool)

(assert (=> b!94441 (=> (not res!77815) (not e!61960))))

(assert (=> b!94441 (= res!77815 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138809))))

(declare-fun b!94442 () Bool)

(declare-fun lt!138808 () (_ BitVec 64))

(assert (=> b!94442 (= e!61960 (bvsle lt!138809 (bvmul lt!138808 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94442 (or (= lt!138808 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138808 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138808)))))

(assert (=> b!94442 (= lt!138808 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream1!8))))))

(assert (= (and d!29406 res!77816) b!94441))

(assert (= (and b!94441 res!77815) b!94442))

(assert (=> d!29406 m!138003))

(declare-fun m!138055 () Bool)

(assert (=> d!29406 m!138055))

(assert (=> b!94252 d!29406))

(declare-fun d!29408 () Bool)

(declare-fun e!61964 () Bool)

(assert (=> d!29408 e!61964))

(declare-fun res!77818 () Bool)

(assert (=> d!29408 (=> (not res!77818) (not e!61964))))

(declare-fun lt!138822 () (_ BitVec 64))

(declare-fun lt!138817 () (_ BitVec 64))

(declare-fun lt!138819 () (_ BitVec 64))

(assert (=> d!29408 (= res!77818 (= lt!138819 (bvsub lt!138817 lt!138822)))))

(assert (=> d!29408 (or (= (bvand lt!138817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138822 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138817 lt!138822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29408 (= lt!138822 (remainingBits!0 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream2!8))) ((_ sign_extend 32) (currentByte!4726 bitStream2!8)) ((_ sign_extend 32) (currentBit!4721 bitStream2!8))))))

(declare-fun lt!138821 () (_ BitVec 64))

(declare-fun lt!138820 () (_ BitVec 64))

(assert (=> d!29408 (= lt!138817 (bvmul lt!138821 lt!138820))))

(assert (=> d!29408 (or (= lt!138821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138820 (bvsdiv (bvmul lt!138821 lt!138820) lt!138821)))))

(assert (=> d!29408 (= lt!138820 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29408 (= lt!138821 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream2!8))))))

(assert (=> d!29408 (= lt!138819 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4726 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4721 bitStream2!8))))))

(assert (=> d!29408 (invariant!0 (currentBit!4721 bitStream2!8) (currentByte!4726 bitStream2!8) (size!2005 (buf!2369 bitStream2!8)))))

(assert (=> d!29408 (= (bitIndex!0 (size!2005 (buf!2369 bitStream2!8)) (currentByte!4726 bitStream2!8) (currentBit!4721 bitStream2!8)) lt!138819)))

(declare-fun b!94447 () Bool)

(declare-fun res!77817 () Bool)

(assert (=> b!94447 (=> (not res!77817) (not e!61964))))

(assert (=> b!94447 (= res!77817 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138819))))

(declare-fun b!94448 () Bool)

(declare-fun lt!138818 () (_ BitVec 64))

(assert (=> b!94448 (= e!61964 (bvsle lt!138819 (bvmul lt!138818 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94448 (or (= lt!138818 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138818 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138818)))))

(assert (=> b!94448 (= lt!138818 ((_ sign_extend 32) (size!2005 (buf!2369 bitStream2!8))))))

(assert (= (and d!29408 res!77818) b!94447))

(assert (= (and b!94447 res!77817) b!94448))

(assert (=> d!29408 m!138041))

(declare-fun m!138057 () Bool)

(assert (=> d!29408 m!138057))

(assert (=> b!94252 d!29408))

(declare-fun d!29410 () Bool)

(declare-fun size!2010 (List!866) Int)

(assert (=> d!29410 (= (length!457 listBits!13) (size!2010 listBits!13))))

(declare-fun bs!7232 () Bool)

(assert (= bs!7232 d!29410))

(declare-fun m!138059 () Bool)

(assert (=> bs!7232 m!138059))

(assert (=> b!94250 d!29410))

(declare-fun d!29412 () Bool)

(assert (=> d!29412 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4721 bitStream1!8) (currentByte!4726 bitStream1!8) (size!2005 (buf!2369 bitStream1!8))))))

(declare-fun bs!7233 () Bool)

(assert (= bs!7233 d!29412))

(assert (=> bs!7233 m!138055))

(assert (=> start!18902 d!29412))

(declare-fun d!29414 () Bool)

(assert (=> d!29414 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4721 bitStream2!8) (currentByte!4726 bitStream2!8) (size!2005 (buf!2369 bitStream2!8))))))

(declare-fun bs!7234 () Bool)

(assert (= bs!7234 d!29414))

(assert (=> bs!7234 m!138057))

(assert (=> start!18902 d!29414))

(declare-fun d!29416 () Bool)

(assert (=> d!29416 (= (inv!12 base!8) (invariant!0 (currentBit!4721 base!8) (currentByte!4726 base!8) (size!2005 (buf!2369 base!8))))))

(declare-fun bs!7235 () Bool)

(assert (= bs!7235 d!29416))

(assert (=> bs!7235 m!138053))

(assert (=> start!18902 d!29416))

(declare-fun d!29420 () Bool)

(assert (=> d!29420 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4721 thiss!1534) (currentByte!4726 thiss!1534) (size!2005 (buf!2369 thiss!1534))))))

(declare-fun bs!7236 () Bool)

(assert (= bs!7236 d!29420))

(declare-fun m!138069 () Bool)

(assert (=> bs!7236 m!138069))

(assert (=> start!18902 d!29420))

(declare-fun d!29422 () Bool)

(assert (=> d!29422 (= (array_inv!1825 (buf!2369 bitStream1!8)) (bvsge (size!2005 (buf!2369 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!94254 d!29422))

(declare-fun d!29424 () Bool)

(assert (=> d!29424 (= (array_inv!1825 (buf!2369 thiss!1534)) (bvsge (size!2005 (buf!2369 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!94253 d!29424))

(push 1)

(assert (not b!94421))

(assert (not b!94416))

(assert (not d!29406))

(assert (not d!29410))

(assert (not d!29388))

(assert (not b!94384))

(assert (not b!94383))

(assert (not d!29412))

(assert (not d!29334))

(assert (not d!29414))

(assert (not b!94417))

(assert (not d!29416))

(assert (not d!29420))

(assert (not d!29408))

(assert (not b!94419))

(assert (not b!94386))

(assert (not b!94381))

(assert (not b!94418))

(assert (not d!29392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

