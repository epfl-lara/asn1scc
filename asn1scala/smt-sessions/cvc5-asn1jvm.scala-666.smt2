; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18722 () Bool)

(assert start!18722)

(declare-fun b!92999 () Bool)

(declare-fun e!61097 () Bool)

(declare-datatypes ((array!4353 0))(
  ( (array!4354 (arr!2592 (Array (_ BitVec 32) (_ BitVec 8))) (size!1972 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3472 0))(
  ( (BitStream!3473 (buf!2345 array!4353) (currentByte!4678 (_ BitVec 32)) (currentBit!4673 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3472)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92999 (= e!61097 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4673 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4678 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1972 (buf!2345 bitStream2!8)))))))))

(declare-fun b!93000 () Bool)

(declare-fun res!76764 () Bool)

(assert (=> b!93000 (=> (not res!76764) (not e!61097))))

(declare-fun bitStream1!8 () BitStream!3472)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93000 (= res!76764 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1972 (buf!2345 bitStream1!8)) (currentByte!4678 bitStream1!8) (currentBit!4673 bitStream1!8))) (bitIndex!0 (size!1972 (buf!2345 bitStream2!8)) (currentByte!4678 bitStream2!8) (currentBit!4673 bitStream2!8))))))

(declare-fun b!93001 () Bool)

(declare-fun e!61099 () Bool)

(declare-fun array_inv!1801 (array!4353) Bool)

(assert (=> b!93001 (= e!61099 (array_inv!1801 (buf!2345 bitStream1!8)))))

(declare-fun b!93002 () Bool)

(declare-fun res!76755 () Bool)

(assert (=> b!93002 (=> (not res!76755) (not e!61097))))

(declare-fun base!8 () BitStream!3472)

(assert (=> b!93002 (= res!76755 (and (= (buf!2345 bitStream1!8) (buf!2345 bitStream2!8)) (= (buf!2345 bitStream1!8) (buf!2345 base!8))))))

(declare-fun b!93003 () Bool)

(declare-fun res!76759 () Bool)

(assert (=> b!93003 (=> (not res!76759) (not e!61097))))

(declare-fun isPrefixOf!0 (BitStream!3472 BitStream!3472) Bool)

(assert (=> b!93003 (= res!76759 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun res!76757 () Bool)

(assert (=> start!18722 (=> (not res!76757) (not e!61097))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18722 (= res!76757 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18722 e!61097))

(assert (=> start!18722 true))

(declare-fun inv!12 (BitStream!3472) Bool)

(assert (=> start!18722 (and (inv!12 bitStream1!8) e!61099)))

(declare-fun e!61095 () Bool)

(assert (=> start!18722 (and (inv!12 bitStream2!8) e!61095)))

(declare-fun e!61101 () Bool)

(assert (=> start!18722 (and (inv!12 base!8) e!61101)))

(declare-fun b!93004 () Bool)

(declare-fun res!76763 () Bool)

(assert (=> b!93004 (=> (not res!76763) (not e!61097))))

(assert (=> b!93004 (= res!76763 (bvslt (bitIndex!0 (size!1972 (buf!2345 base!8)) (currentByte!4678 base!8) (currentBit!4673 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93005 () Bool)

(assert (=> b!93005 (= e!61101 (array_inv!1801 (buf!2345 base!8)))))

(declare-fun b!93006 () Bool)

(declare-fun res!76760 () Bool)

(assert (=> b!93006 (=> (not res!76760) (not e!61097))))

(assert (=> b!93006 (= res!76760 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93007 () Bool)

(assert (=> b!93007 (= e!61095 (array_inv!1801 (buf!2345 bitStream2!8)))))

(declare-fun b!93008 () Bool)

(declare-fun res!76758 () Bool)

(assert (=> b!93008 (=> (not res!76758) (not e!61097))))

(assert (=> b!93008 (= res!76758 (and (bvsle ((_ sign_extend 32) (size!1972 (buf!2345 bitStream2!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4678 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4673 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1972 (buf!2345 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4678 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4673 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93009 () Bool)

(declare-fun res!76756 () Bool)

(assert (=> b!93009 (=> (not res!76756) (not e!61097))))

(declare-datatypes ((List!842 0))(
  ( (Nil!839) (Cons!838 (h!957 Bool) (t!1592 List!842)) )
))
(declare-fun listBits!13 () List!842)

(declare-fun length!433 (List!842) Int)

(assert (=> b!93009 (= res!76756 (> (length!433 listBits!13) 0))))

(declare-fun b!93010 () Bool)

(declare-fun res!76761 () Bool)

(assert (=> b!93010 (=> (not res!76761) (not e!61097))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93010 (= res!76761 (validate_offset_bits!1 ((_ sign_extend 32) (size!1972 (buf!2345 bitStream1!8))) ((_ sign_extend 32) (currentByte!4678 bitStream1!8)) ((_ sign_extend 32) (currentBit!4673 bitStream1!8)) nBits!484))))

(declare-fun b!93011 () Bool)

(declare-fun res!76762 () Bool)

(assert (=> b!93011 (=> (not res!76762) (not e!61097))))

(assert (=> b!93011 (= res!76762 (isPrefixOf!0 bitStream1!8 base!8))))

(assert (= (and start!18722 res!76757) b!93009))

(assert (= (and b!93009 res!76756) b!93011))

(assert (= (and b!93011 res!76762) b!93003))

(assert (= (and b!93003 res!76759) b!93006))

(assert (= (and b!93006 res!76760) b!93002))

(assert (= (and b!93002 res!76755) b!93004))

(assert (= (and b!93004 res!76763) b!93000))

(assert (= (and b!93000 res!76764) b!93010))

(assert (= (and b!93010 res!76761) b!93008))

(assert (= (and b!93008 res!76758) b!92999))

(assert (= start!18722 b!93001))

(assert (= start!18722 b!93007))

(assert (= start!18722 b!93005))

(declare-fun m!136865 () Bool)

(assert (=> b!93010 m!136865))

(declare-fun m!136867 () Bool)

(assert (=> start!18722 m!136867))

(declare-fun m!136869 () Bool)

(assert (=> start!18722 m!136869))

(declare-fun m!136871 () Bool)

(assert (=> start!18722 m!136871))

(declare-fun m!136873 () Bool)

(assert (=> b!93003 m!136873))

(declare-fun m!136875 () Bool)

(assert (=> b!93000 m!136875))

(declare-fun m!136877 () Bool)

(assert (=> b!93000 m!136877))

(declare-fun m!136879 () Bool)

(assert (=> b!93005 m!136879))

(declare-fun m!136881 () Bool)

(assert (=> b!93001 m!136881))

(declare-fun m!136883 () Bool)

(assert (=> b!93006 m!136883))

(declare-fun m!136885 () Bool)

(assert (=> b!93009 m!136885))

(declare-fun m!136887 () Bool)

(assert (=> b!93004 m!136887))

(declare-fun m!136889 () Bool)

(assert (=> b!93007 m!136889))

(declare-fun m!136891 () Bool)

(assert (=> b!93011 m!136891))

(declare-fun m!136893 () Bool)

(assert (=> b!92999 m!136893))

(push 1)

(assert (not b!93004))

(assert (not b!93010))

(assert (not b!93005))

(assert (not b!93011))

(assert (not b!93006))

(assert (not b!93003))

(assert (not start!18722))

(assert (not b!93000))

(assert (not b!93001))

(assert (not b!93007))

(assert (not b!92999))

(assert (not b!93009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29006 () Bool)

(declare-fun e!61167 () Bool)

(assert (=> d!29006 e!61167))

(declare-fun res!76864 () Bool)

(assert (=> d!29006 (=> (not res!76864) (not e!61167))))

(declare-fun lt!138382 () (_ BitVec 64))

(declare-fun lt!138383 () (_ BitVec 64))

(declare-fun lt!138381 () (_ BitVec 64))

(assert (=> d!29006 (= res!76864 (= lt!138382 (bvsub lt!138383 lt!138381)))))

(assert (=> d!29006 (or (= (bvand lt!138383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138383 lt!138381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29006 (= lt!138381 (remainingBits!0 ((_ sign_extend 32) (size!1972 (buf!2345 bitStream1!8))) ((_ sign_extend 32) (currentByte!4678 bitStream1!8)) ((_ sign_extend 32) (currentBit!4673 bitStream1!8))))))

(declare-fun lt!138379 () (_ BitVec 64))

(declare-fun lt!138380 () (_ BitVec 64))

(assert (=> d!29006 (= lt!138383 (bvmul lt!138379 lt!138380))))

(assert (=> d!29006 (or (= lt!138379 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138380 (bvsdiv (bvmul lt!138379 lt!138380) lt!138379)))))

(assert (=> d!29006 (= lt!138380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29006 (= lt!138379 ((_ sign_extend 32) (size!1972 (buf!2345 bitStream1!8))))))

(assert (=> d!29006 (= lt!138382 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4678 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4673 bitStream1!8))))))

(assert (=> d!29006 (invariant!0 (currentBit!4673 bitStream1!8) (currentByte!4678 bitStream1!8) (size!1972 (buf!2345 bitStream1!8)))))

(assert (=> d!29006 (= (bitIndex!0 (size!1972 (buf!2345 bitStream1!8)) (currentByte!4678 bitStream1!8) (currentBit!4673 bitStream1!8)) lt!138382)))

(declare-fun b!93128 () Bool)

(declare-fun res!76863 () Bool)

(assert (=> b!93128 (=> (not res!76863) (not e!61167))))

(assert (=> b!93128 (= res!76863 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138382))))

(declare-fun b!93129 () Bool)

(declare-fun lt!138384 () (_ BitVec 64))

(assert (=> b!93129 (= e!61167 (bvsle lt!138382 (bvmul lt!138384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93129 (or (= lt!138384 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138384 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138384)))))

(assert (=> b!93129 (= lt!138384 ((_ sign_extend 32) (size!1972 (buf!2345 bitStream1!8))))))

(assert (= (and d!29006 res!76864) b!93128))

(assert (= (and b!93128 res!76863) b!93129))

(declare-fun m!136979 () Bool)

(assert (=> d!29006 m!136979))

(declare-fun m!136981 () Bool)

(assert (=> d!29006 m!136981))

(assert (=> b!93000 d!29006))

(declare-fun d!29034 () Bool)

(declare-fun e!61168 () Bool)

(assert (=> d!29034 e!61168))

(declare-fun res!76866 () Bool)

(assert (=> d!29034 (=> (not res!76866) (not e!61168))))

(declare-fun lt!138389 () (_ BitVec 64))

(declare-fun lt!138388 () (_ BitVec 64))

(declare-fun lt!138387 () (_ BitVec 64))

(assert (=> d!29034 (= res!76866 (= lt!138388 (bvsub lt!138389 lt!138387)))))

(assert (=> d!29034 (or (= (bvand lt!138389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138387 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138389 lt!138387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29034 (= lt!138387 (remainingBits!0 ((_ sign_extend 32) (size!1972 (buf!2345 bitStream2!8))) ((_ sign_extend 32) (currentByte!4678 bitStream2!8)) ((_ sign_extend 32) (currentBit!4673 bitStream2!8))))))

(declare-fun lt!138385 () (_ BitVec 64))

(declare-fun lt!138386 () (_ BitVec 64))

(assert (=> d!29034 (= lt!138389 (bvmul lt!138385 lt!138386))))

(assert (=> d!29034 (or (= lt!138385 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138386 (bvsdiv (bvmul lt!138385 lt!138386) lt!138385)))))

(assert (=> d!29034 (= lt!138386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29034 (= lt!138385 ((_ sign_extend 32) (size!1972 (buf!2345 bitStream2!8))))))

(assert (=> d!29034 (= lt!138388 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4678 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4673 bitStream2!8))))))

(assert (=> d!29034 (invariant!0 (currentBit!4673 bitStream2!8) (currentByte!4678 bitStream2!8) (size!1972 (buf!2345 bitStream2!8)))))

(assert (=> d!29034 (= (bitIndex!0 (size!1972 (buf!2345 bitStream2!8)) (currentByte!4678 bitStream2!8) (currentBit!4673 bitStream2!8)) lt!138388)))

(declare-fun b!93130 () Bool)

(declare-fun res!76865 () Bool)

(assert (=> b!93130 (=> (not res!76865) (not e!61168))))

(assert (=> b!93130 (= res!76865 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138388))))

(declare-fun b!93131 () Bool)

(declare-fun lt!138390 () (_ BitVec 64))

(assert (=> b!93131 (= e!61168 (bvsle lt!138388 (bvmul lt!138390 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93131 (or (= lt!138390 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138390 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138390)))))

(assert (=> b!93131 (= lt!138390 ((_ sign_extend 32) (size!1972 (buf!2345 bitStream2!8))))))

(assert (= (and d!29034 res!76866) b!93130))

(assert (= (and b!93130 res!76865) b!93131))

(declare-fun m!136983 () Bool)

(assert (=> d!29034 m!136983))

(declare-fun m!136985 () Bool)

(assert (=> d!29034 m!136985))

(assert (=> b!93000 d!29034))

(declare-fun d!29036 () Bool)

(declare-fun res!76881 () Bool)

(declare-fun e!61177 () Bool)

(assert (=> d!29036 (=> (not res!76881) (not e!61177))))

(assert (=> d!29036 (= res!76881 (= (size!1972 (buf!2345 bitStream1!8)) (size!1972 (buf!2345 base!8))))))

(assert (=> d!29036 (= (isPrefixOf!0 bitStream1!8 base!8) e!61177)))

(declare-fun b!93144 () Bool)

(declare-fun res!76879 () Bool)

(assert (=> b!93144 (=> (not res!76879) (not e!61177))))

(assert (=> b!93144 (= res!76879 (bvsle (bitIndex!0 (size!1972 (buf!2345 bitStream1!8)) (currentByte!4678 bitStream1!8) (currentBit!4673 bitStream1!8)) (bitIndex!0 (size!1972 (buf!2345 base!8)) (currentByte!4678 base!8) (currentBit!4673 base!8))))))

(declare-fun b!93145 () Bool)

(declare-fun e!61176 () Bool)

(assert (=> b!93145 (= e!61177 e!61176)))

(declare-fun res!76880 () Bool)

(assert (=> b!93145 (=> res!76880 e!61176)))

(assert (=> b!93145 (= res!76880 (= (size!1972 (buf!2345 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93146 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4353 array!4353 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93146 (= e!61176 (arrayBitRangesEq!0 (buf!2345 bitStream1!8) (buf!2345 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1972 (buf!2345 bitStream1!8)) (currentByte!4678 bitStream1!8) (currentBit!4673 bitStream1!8))))))

(assert (= (and d!29036 res!76881) b!93144))

(assert (= (and b!93144 res!76879) b!93145))

(assert (= (and b!93145 (not res!76880)) b!93146))

(assert (=> b!93144 m!136875))

(assert (=> b!93144 m!136887))

(assert (=> b!93146 m!136875))

(assert (=> b!93146 m!136875))

(declare-fun m!136991 () Bool)

(assert (=> b!93146 m!136991))

(assert (=> b!93011 d!29036))

(declare-fun d!29042 () Bool)

(assert (=> d!29042 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1972 (buf!2345 bitStream1!8))) ((_ sign_extend 32) (currentByte!4678 bitStream1!8)) ((_ sign_extend 32) (currentBit!4673 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1972 (buf!2345 bitStream1!8))) ((_ sign_extend 32) (currentByte!4678 bitStream1!8)) ((_ sign_extend 32) (currentBit!4673 bitStream1!8))) nBits!484))))

(declare-fun bs!7139 () Bool)

(assert (= bs!7139 d!29042))

(assert (=> bs!7139 m!136979))

(assert (=> b!93010 d!29042))

(declare-fun d!29052 () Bool)

(assert (=> d!29052 (= (array_inv!1801 (buf!2345 bitStream1!8)) (bvsge (size!1972 (buf!2345 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!93001 d!29052))

(declare-fun d!29054 () Bool)

(assert (=> d!29054 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4673 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4678 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1972 (buf!2345 bitStream2!8))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4673 bitStream2!8))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4673 bitStream2!8))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4678 bitStream2!8))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4678 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1972 (buf!2345 bitStream2!8))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4673 bitStream2!8))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4678 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1972 (buf!2345 bitStream2!8)))))))))))

(assert (=> b!92999 d!29054))

(declare-fun d!29066 () Bool)

(declare-fun size!1976 (List!842) Int)

(assert (=> d!29066 (= (length!433 listBits!13) (size!1976 listBits!13))))

(declare-fun bs!7144 () Bool)

(assert (= bs!7144 d!29066))

(declare-fun m!137005 () Bool)

(assert (=> bs!7144 m!137005))

(assert (=> b!93009 d!29066))

(declare-fun d!29070 () Bool)

(assert (=> d!29070 (= (array_inv!1801 (buf!2345 base!8)) (bvsge (size!1972 (buf!2345 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!93005 d!29070))

(declare-fun d!29072 () Bool)

(assert (=> d!29072 (= (array_inv!1801 (buf!2345 bitStream2!8)) (bvsge (size!1972 (buf!2345 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!93007 d!29072))

(declare-fun d!29074 () Bool)

(assert (=> d!29074 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4673 bitStream1!8) (currentByte!4678 bitStream1!8) (size!1972 (buf!2345 bitStream1!8))))))

(declare-fun bs!7145 () Bool)

(assert (= bs!7145 d!29074))

(assert (=> bs!7145 m!136981))

(assert (=> start!18722 d!29074))

(declare-fun d!29076 () Bool)

(assert (=> d!29076 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4673 bitStream2!8) (currentByte!4678 bitStream2!8) (size!1972 (buf!2345 bitStream2!8))))))

(declare-fun bs!7146 () Bool)

(assert (= bs!7146 d!29076))

(assert (=> bs!7146 m!136985))

(assert (=> start!18722 d!29076))

(declare-fun d!29078 () Bool)

(assert (=> d!29078 (= (inv!12 base!8) (invariant!0 (currentBit!4673 base!8) (currentByte!4678 base!8) (size!1972 (buf!2345 base!8))))))

(declare-fun bs!7147 () Bool)

(assert (= bs!7147 d!29078))

(declare-fun m!137007 () Bool)

(assert (=> bs!7147 m!137007))

(assert (=> start!18722 d!29078))

(declare-fun d!29080 () Bool)

(declare-fun res!76894 () Bool)

(declare-fun e!61185 () Bool)

(assert (=> d!29080 (=> (not res!76894) (not e!61185))))

(assert (=> d!29080 (= res!76894 (= (size!1972 (buf!2345 bitStream1!8)) (size!1972 (buf!2345 bitStream2!8))))))

(assert (=> d!29080 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61185)))

(declare-fun b!93157 () Bool)

(declare-fun res!76892 () Bool)

(assert (=> b!93157 (=> (not res!76892) (not e!61185))))

(assert (=> b!93157 (= res!76892 (bvsle (bitIndex!0 (size!1972 (buf!2345 bitStream1!8)) (currentByte!4678 bitStream1!8) (currentBit!4673 bitStream1!8)) (bitIndex!0 (size!1972 (buf!2345 bitStream2!8)) (currentByte!4678 bitStream2!8) (currentBit!4673 bitStream2!8))))))

(declare-fun b!93158 () Bool)

(declare-fun e!61184 () Bool)

(assert (=> b!93158 (= e!61185 e!61184)))

(declare-fun res!76893 () Bool)

(assert (=> b!93158 (=> res!76893 e!61184)))

(assert (=> b!93158 (= res!76893 (= (size!1972 (buf!2345 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93159 () Bool)

(assert (=> b!93159 (= e!61184 (arrayBitRangesEq!0 (buf!2345 bitStream1!8) (buf!2345 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1972 (buf!2345 bitStream1!8)) (currentByte!4678 bitStream1!8) (currentBit!4673 bitStream1!8))))))

(assert (= (and d!29080 res!76894) b!93157))

(assert (= (and b!93157 res!76892) b!93158))

(assert (= (and b!93158 (not res!76893)) b!93159))

(assert (=> b!93157 m!136875))

(assert (=> b!93157 m!136877))

(assert (=> b!93159 m!136875))

(assert (=> b!93159 m!136875))

(declare-fun m!137009 () Bool)

(assert (=> b!93159 m!137009))

(assert (=> b!93006 d!29080))

(declare-fun d!29082 () Bool)

(declare-fun res!76897 () Bool)

(declare-fun e!61187 () Bool)

(assert (=> d!29082 (=> (not res!76897) (not e!61187))))

(assert (=> d!29082 (= res!76897 (= (size!1972 (buf!2345 bitStream2!8)) (size!1972 (buf!2345 base!8))))))

(assert (=> d!29082 (= (isPrefixOf!0 bitStream2!8 base!8) e!61187)))

(declare-fun b!93160 () Bool)

(declare-fun res!76895 () Bool)

(assert (=> b!93160 (=> (not res!76895) (not e!61187))))

(assert (=> b!93160 (= res!76895 (bvsle (bitIndex!0 (size!1972 (buf!2345 bitStream2!8)) (currentByte!4678 bitStream2!8) (currentBit!4673 bitStream2!8)) (bitIndex!0 (size!1972 (buf!2345 base!8)) (currentByte!4678 base!8) (currentBit!4673 base!8))))))

(declare-fun b!93161 () Bool)

(declare-fun e!61186 () Bool)

(assert (=> b!93161 (= e!61187 e!61186)))

(declare-fun res!76896 () Bool)

(assert (=> b!93161 (=> res!76896 e!61186)))

(assert (=> b!93161 (= res!76896 (= (size!1972 (buf!2345 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!93162 () Bool)

(assert (=> b!93162 (= e!61186 (arrayBitRangesEq!0 (buf!2345 bitStream2!8) (buf!2345 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1972 (buf!2345 bitStream2!8)) (currentByte!4678 bitStream2!8) (currentBit!4673 bitStream2!8))))))

(assert (= (and d!29082 res!76897) b!93160))

(assert (= (and b!93160 res!76895) b!93161))

(assert (= (and b!93161 (not res!76896)) b!93162))

(assert (=> b!93160 m!136877))

(assert (=> b!93160 m!136887))

(assert (=> b!93162 m!136877))

(assert (=> b!93162 m!136877))

(declare-fun m!137011 () Bool)

(assert (=> b!93162 m!137011))

(assert (=> b!93003 d!29082))

(declare-fun d!29084 () Bool)

(declare-fun e!61188 () Bool)

(assert (=> d!29084 e!61188))

(declare-fun res!76899 () Bool)

(assert (=> d!29084 (=> (not res!76899) (not e!61188))))

(declare-fun lt!138423 () (_ BitVec 64))

(declare-fun lt!138424 () (_ BitVec 64))

(declare-fun lt!138425 () (_ BitVec 64))

(assert (=> d!29084 (= res!76899 (= lt!138424 (bvsub lt!138425 lt!138423)))))

(assert (=> d!29084 (or (= (bvand lt!138425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138423 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138425 lt!138423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29084 (= lt!138423 (remainingBits!0 ((_ sign_extend 32) (size!1972 (buf!2345 base!8))) ((_ sign_extend 32) (currentByte!4678 base!8)) ((_ sign_extend 32) (currentBit!4673 base!8))))))

(declare-fun lt!138421 () (_ BitVec 64))

(declare-fun lt!138422 () (_ BitVec 64))

(assert (=> d!29084 (= lt!138425 (bvmul lt!138421 lt!138422))))

(assert (=> d!29084 (or (= lt!138421 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138422 (bvsdiv (bvmul lt!138421 lt!138422) lt!138421)))))

(assert (=> d!29084 (= lt!138422 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29084 (= lt!138421 ((_ sign_extend 32) (size!1972 (buf!2345 base!8))))))

(assert (=> d!29084 (= lt!138424 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4678 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4673 base!8))))))

(assert (=> d!29084 (invariant!0 (currentBit!4673 base!8) (currentByte!4678 base!8) (size!1972 (buf!2345 base!8)))))

(assert (=> d!29084 (= (bitIndex!0 (size!1972 (buf!2345 base!8)) (currentByte!4678 base!8) (currentBit!4673 base!8)) lt!138424)))

(declare-fun b!93163 () Bool)

(declare-fun res!76898 () Bool)

(assert (=> b!93163 (=> (not res!76898) (not e!61188))))

(assert (=> b!93163 (= res!76898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138424))))

(declare-fun b!93164 () Bool)

(declare-fun lt!138426 () (_ BitVec 64))

(assert (=> b!93164 (= e!61188 (bvsle lt!138424 (bvmul lt!138426 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93164 (or (= lt!138426 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138426 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138426)))))

(assert (=> b!93164 (= lt!138426 ((_ sign_extend 32) (size!1972 (buf!2345 base!8))))))

(assert (= (and d!29084 res!76899) b!93163))

(assert (= (and b!93163 res!76898) b!93164))

(declare-fun m!137013 () Bool)

(assert (=> d!29084 m!137013))

(assert (=> d!29084 m!137007))

(assert (=> b!93004 d!29084))

(push 1)

(assert (not d!29034))

(assert (not d!29074))

(assert (not d!29042))

(assert (not b!93159))

(assert (not d!29076))

(assert (not d!29066))

(assert (not d!29006))

(assert (not b!93157))

(assert (not b!93160))

(assert (not b!93146))

(assert (not d!29078))

(assert (not b!93162))

(assert (not b!93144))

(assert (not d!29084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

