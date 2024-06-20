; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18530 () Bool)

(assert start!18530)

(declare-fun b!91954 () Bool)

(declare-fun res!75917 () Bool)

(declare-fun e!60458 () Bool)

(assert (=> b!91954 (=> (not res!75917) (not e!60458))))

(declare-datatypes ((array!4303 0))(
  ( (array!4304 (arr!2573 (Array (_ BitVec 32) (_ BitVec 8))) (size!1942 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3434 0))(
  ( (BitStream!3435 (buf!2326 array!4303) (currentByte!4634 (_ BitVec 32)) (currentBit!4629 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3434)

(declare-fun bitStream2!8 () BitStream!3434)

(declare-fun base!8 () BitStream!3434)

(assert (=> b!91954 (= res!75917 (and (= (buf!2326 bitStream1!8) (buf!2326 bitStream2!8)) (= (buf!2326 bitStream1!8) (buf!2326 base!8))))))

(declare-fun b!91955 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91955 (= e!60458 (not (invariant!0 (currentBit!4629 bitStream2!8) (currentByte!4634 bitStream2!8) (size!1942 (buf!2326 bitStream2!8)))))))

(declare-fun b!91956 () Bool)

(declare-fun res!75914 () Bool)

(assert (=> b!91956 (=> (not res!75914) (not e!60458))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91956 (= res!75914 (bvslt (bitIndex!0 (size!1942 (buf!2326 base!8)) (currentByte!4634 base!8) (currentBit!4629 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!91957 () Bool)

(declare-fun e!60457 () Bool)

(declare-fun array_inv!1782 (array!4303) Bool)

(assert (=> b!91957 (= e!60457 (array_inv!1782 (buf!2326 bitStream1!8)))))

(declare-fun b!91958 () Bool)

(declare-fun e!60460 () Bool)

(assert (=> b!91958 (= e!60460 (array_inv!1782 (buf!2326 bitStream2!8)))))

(declare-fun b!91959 () Bool)

(declare-fun res!75919 () Bool)

(assert (=> b!91959 (=> (not res!75919) (not e!60458))))

(declare-fun isPrefixOf!0 (BitStream!3434 BitStream!3434) Bool)

(assert (=> b!91959 (= res!75919 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!91960 () Bool)

(declare-fun res!75916 () Bool)

(assert (=> b!91960 (=> (not res!75916) (not e!60458))))

(declare-datatypes ((List!823 0))(
  ( (Nil!820) (Cons!819 (h!938 Bool) (t!1573 List!823)) )
))
(declare-fun listBits!13 () List!823)

(declare-fun length!414 (List!823) Int)

(assert (=> b!91960 (= res!75916 (> (length!414 listBits!13) 0))))

(declare-fun b!91961 () Bool)

(declare-fun e!60459 () Bool)

(assert (=> b!91961 (= e!60459 (array_inv!1782 (buf!2326 base!8)))))

(declare-fun res!75915 () Bool)

(assert (=> start!18530 (=> (not res!75915) (not e!60458))))

(assert (=> start!18530 (= res!75915 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18530 e!60458))

(assert (=> start!18530 true))

(declare-fun inv!12 (BitStream!3434) Bool)

(assert (=> start!18530 (and (inv!12 bitStream1!8) e!60457)))

(assert (=> start!18530 (and (inv!12 bitStream2!8) e!60460)))

(assert (=> start!18530 (and (inv!12 base!8) e!60459)))

(declare-fun b!91962 () Bool)

(declare-fun res!75918 () Bool)

(assert (=> b!91962 (=> (not res!75918) (not e!60458))))

(assert (=> b!91962 (= res!75918 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!91963 () Bool)

(declare-fun res!75913 () Bool)

(assert (=> b!91963 (=> (not res!75913) (not e!60458))))

(assert (=> b!91963 (= res!75913 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(assert (= (and start!18530 res!75915) b!91960))

(assert (= (and b!91960 res!75916) b!91959))

(assert (= (and b!91959 res!75919) b!91962))

(assert (= (and b!91962 res!75918) b!91963))

(assert (= (and b!91963 res!75913) b!91954))

(assert (= (and b!91954 res!75917) b!91956))

(assert (= (and b!91956 res!75914) b!91955))

(assert (= start!18530 b!91957))

(assert (= start!18530 b!91958))

(assert (= start!18530 b!91961))

(declare-fun m!136019 () Bool)

(assert (=> b!91961 m!136019))

(declare-fun m!136021 () Bool)

(assert (=> b!91957 m!136021))

(declare-fun m!136023 () Bool)

(assert (=> b!91959 m!136023))

(declare-fun m!136025 () Bool)

(assert (=> b!91960 m!136025))

(declare-fun m!136027 () Bool)

(assert (=> b!91956 m!136027))

(declare-fun m!136029 () Bool)

(assert (=> b!91958 m!136029))

(declare-fun m!136031 () Bool)

(assert (=> b!91955 m!136031))

(declare-fun m!136033 () Bool)

(assert (=> start!18530 m!136033))

(declare-fun m!136035 () Bool)

(assert (=> start!18530 m!136035))

(declare-fun m!136037 () Bool)

(assert (=> start!18530 m!136037))

(declare-fun m!136039 () Bool)

(assert (=> b!91962 m!136039))

(declare-fun m!136041 () Bool)

(assert (=> b!91963 m!136041))

(push 1)

(assert (not b!91960))

(assert (not b!91962))

(assert (not b!91961))

(assert (not b!91963))

(assert (not b!91957))

(assert (not b!91958))

(assert (not b!91959))

(assert (not start!18530))

(assert (not b!91956))

(assert (not b!91955))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28672 () Bool)

(declare-fun res!75969 () Bool)

(declare-fun e!60494 () Bool)

(assert (=> d!28672 (=> (not res!75969) (not e!60494))))

(assert (=> d!28672 (= res!75969 (= (size!1942 (buf!2326 bitStream1!8)) (size!1942 (buf!2326 base!8))))))

(assert (=> d!28672 (= (isPrefixOf!0 bitStream1!8 base!8) e!60494)))

(declare-fun b!92012 () Bool)

(declare-fun res!75968 () Bool)

(assert (=> b!92012 (=> (not res!75968) (not e!60494))))

(assert (=> b!92012 (= res!75968 (bvsle (bitIndex!0 (size!1942 (buf!2326 bitStream1!8)) (currentByte!4634 bitStream1!8) (currentBit!4629 bitStream1!8)) (bitIndex!0 (size!1942 (buf!2326 base!8)) (currentByte!4634 base!8) (currentBit!4629 base!8))))))

(declare-fun b!92013 () Bool)

(declare-fun e!60493 () Bool)

(assert (=> b!92013 (= e!60494 e!60493)))

(declare-fun res!75970 () Bool)

(assert (=> b!92013 (=> res!75970 e!60493)))

(assert (=> b!92013 (= res!75970 (= (size!1942 (buf!2326 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92014 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4303 array!4303 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92014 (= e!60493 (arrayBitRangesEq!0 (buf!2326 bitStream1!8) (buf!2326 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1942 (buf!2326 bitStream1!8)) (currentByte!4634 bitStream1!8) (currentBit!4629 bitStream1!8))))))

(assert (= (and d!28672 res!75969) b!92012))

(assert (= (and b!92012 res!75968) b!92013))

(assert (= (and b!92013 (not res!75970)) b!92014))

(declare-fun m!136079 () Bool)

(assert (=> b!92012 m!136079))

(assert (=> b!92012 m!136027))

(assert (=> b!92014 m!136079))

(assert (=> b!92014 m!136079))

(declare-fun m!136081 () Bool)

(assert (=> b!92014 m!136081))

(assert (=> b!91959 d!28672))

(declare-fun d!28674 () Bool)

(declare-fun size!1945 (List!823) Int)

(assert (=> d!28674 (= (length!414 listBits!13) (size!1945 listBits!13))))

(declare-fun bs!7069 () Bool)

(assert (= bs!7069 d!28674))

(declare-fun m!136083 () Bool)

(assert (=> bs!7069 m!136083))

(assert (=> b!91960 d!28674))

(declare-fun d!28676 () Bool)

(assert (=> d!28676 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4629 bitStream1!8) (currentByte!4634 bitStream1!8) (size!1942 (buf!2326 bitStream1!8))))))

(declare-fun bs!7070 () Bool)

(assert (= bs!7070 d!28676))

(declare-fun m!136085 () Bool)

(assert (=> bs!7070 m!136085))

