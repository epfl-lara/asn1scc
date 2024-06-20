; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16076 () Bool)

(assert start!16076)

(declare-fun res!67051 () Bool)

(declare-fun e!53283 () Bool)

(assert (=> start!16076 (=> (not res!67051) (not e!53283))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!16076 (= res!67051 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!16076 e!53283))

(assert (=> start!16076 true))

(declare-datatypes ((array!3586 0))(
  ( (array!3587 (arr!2271 (Array (_ BitVec 32) (_ BitVec 8))) (size!1652 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2866 0))(
  ( (BitStream!2867 (buf!2042 array!3586) (currentByte!3955 (_ BitVec 32)) (currentBit!3950 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2866)

(declare-fun e!53281 () Bool)

(declare-fun inv!12 (BitStream!2866) Bool)

(assert (=> start!16076 (and (inv!12 thiss!1716) e!53281)))

(declare-fun b!81076 () Bool)

(declare-fun res!67050 () Bool)

(assert (=> b!81076 (=> (not res!67050) (not e!53283))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81076 (= res!67050 (validate_offset_bits!1 ((_ sign_extend 32) (size!1652 (buf!2042 thiss!1716))) ((_ sign_extend 32) (currentByte!3955 thiss!1716)) ((_ sign_extend 32) (currentBit!3950 thiss!1716)) nBits!516))))

(declare-fun lt!128751 () (_ BitVec 32))

(declare-fun b!81077 () Bool)

(declare-datatypes ((Unit!5398 0))(
  ( (Unit!5399) )
))
(declare-datatypes ((tuple3!340 0))(
  ( (tuple3!341 (_1!3778 Unit!5398) (_2!3778 BitStream!2866) (_3!191 array!3586)) )
))
(declare-fun readBitsLoop!0 (BitStream!2866 (_ BitVec 64) array!3586 (_ BitVec 64) (_ BitVec 64)) tuple3!340)

(assert (=> b!81077 (= e!53283 (not (= (size!1652 (_3!191 (readBitsLoop!0 thiss!1716 nBits!516 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))) lt!128751)))))

(assert (=> b!81077 (= lt!128751 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!81078 () Bool)

(declare-fun array_inv!1498 (array!3586) Bool)

(assert (=> b!81078 (= e!53281 (array_inv!1498 (buf!2042 thiss!1716)))))

(assert (= (and start!16076 res!67051) b!81076))

(assert (= (and b!81076 res!67050) b!81077))

(assert (= start!16076 b!81078))

(declare-fun m!126867 () Bool)

(assert (=> start!16076 m!126867))

(declare-fun m!126869 () Bool)

(assert (=> b!81076 m!126869))

(declare-fun m!126871 () Bool)

(assert (=> b!81077 m!126871))

(declare-fun m!126873 () Bool)

(assert (=> b!81078 m!126873))

(push 1)

(assert (not b!81078))

(assert (not start!16076))

(assert (not b!81076))

(assert (not b!81077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25330 () Bool)

(assert (=> d!25330 (= (array_inv!1498 (buf!2042 thiss!1716)) (bvsge (size!1652 (buf!2042 thiss!1716)) #b00000000000000000000000000000000))))

(assert (=> b!81078 d!25330))

(declare-fun d!25332 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25332 (= (inv!12 thiss!1716) (invariant!0 (currentBit!3950 thiss!1716) (currentByte!3955 thiss!1716) (size!1652 (buf!2042 thiss!1716))))))

(declare-fun bs!6202 () Bool)

(assert (= bs!6202 d!25332))

(declare-fun m!126893 () Bool)

(assert (=> bs!6202 m!126893))

(assert (=> start!16076 d!25332))

(declare-fun d!25334 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25334 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1652 (buf!2042 thiss!1716))) ((_ sign_extend 32) (currentByte!3955 thiss!1716)) ((_ sign_extend 32) (currentBit!3950 thiss!1716)) nBits!516) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1652 (buf!2042 thiss!1716))) ((_ sign_extend 32) (currentByte!3955 thiss!1716)) ((_ sign_extend 32) (currentBit!3950 thiss!1716))) nBits!516))))

(declare-fun bs!6203 () Bool)

(assert (= bs!6203 d!25334))

(declare-fun m!126895 () Bool)

(assert (=> bs!6203 m!126895))

(assert (=> b!81076 d!25334))

(declare-fun b!81160 () Bool)

(declare-fun e!53332 () tuple3!340)

(declare-fun lt!129040 () Unit!5398)

(declare-fun lt!129023 () tuple3!340)

(assert (=> b!81160 (= e!53332 (tuple3!341 lt!129040 (_2!3778 lt!129023) (_3!191 lt!129023)))))

(declare-datatypes ((tuple2!7176 0))(
  ( (tuple2!7177 (_1!3782 Bool) (_2!3782 BitStream!2866)) )
))
(declare-fun lt!129024 () tuple2!7176)

(declare-fun readBit!0 (BitStream!2866) tuple2!7176)

(assert (=> b!81160 (= lt!129024 (readBit!0 thiss!1716))))

(declare-fun lt!129026 () (_ BitVec 32))

(assert (=> b!81160 (= lt!129026 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129022 () (_ BitVec 32))

(assert (=> b!81160 (= lt!129022 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129028 () array!3586)

(assert (=> b!81160 (= lt!129028 (array!3587 (store (arr!2271 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751)) lt!129026 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2271 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751)) lt!129026)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129022)))) ((_ sign_extend 24) (ite (_1!3782 lt!129024) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129022) #b00000000))))) (size!1652 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751))))))

(declare-fun lt!129016 () (_ BitVec 64))

(assert (=> b!81160 (= lt!129016 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129025 () (_ BitVec 64))

(assert (=> b!81160 (= lt!129025 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!129011 () Unit!5398)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2866 BitStream!2866 (_ BitVec 64) (_ BitVec 64)) Unit!5398)

(assert (=> b!81160 (= lt!129011 (validateOffsetBitsIneqLemma!0 thiss!1716 (_2!3782 lt!129024) lt!129016 lt!129025))))

(assert (=> b!81160 (validate_offset_bits!1 ((_ sign_extend 32) (size!1652 (buf!2042 (_2!3782 lt!129024)))) ((_ sign_extend 32) (currentByte!3955 (_2!3782 lt!129024))) ((_ sign_extend 32) (currentBit!3950 (_2!3782 lt!129024))) (bvsub lt!129016 lt!129025))))

(declare-fun lt!129031 () Unit!5398)

(assert (=> b!81160 (= lt!129031 lt!129011)))

(assert (=> b!81160 (= lt!129023 (readBitsLoop!0 (_2!3782 lt!129024) nBits!516 lt!129028 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(declare-fun res!67119 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81160 (= res!67119 (= (bvsub (bvadd (bitIndex!0 (size!1652 (buf!2042 thiss!1716)) (currentByte!3955 thiss!1716) (currentBit!3950 thiss!1716)) nBits!516) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1652 (buf!2042 (_2!3778 lt!129023))) (currentByte!3955 (_2!3778 lt!129023)) (currentBit!3950 (_2!3778 lt!129023)))))))

(declare-fun e!53331 () Bool)

(assert (=> b!81160 (=> (not res!67119) (not e!53331))))

(assert (=> b!81160 e!53331))

(declare-fun lt!129021 () Unit!5398)

(declare-fun Unit!5405 () Unit!5398)

(assert (=> b!81160 (= lt!129021 Unit!5405)))

(declare-fun lt!129029 () (_ BitVec 32))

(assert (=> b!81160 (= lt!129029 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129034 () (_ BitVec 32))

(assert (=> b!81160 (= lt!129034 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129039 () Unit!5398)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!3586 (_ BitVec 64) Bool) Unit!5398)

(assert (=> b!81160 (= lt!129039 (arrayBitRangesUpdatedAtLemma!0 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3782 lt!129024)))))

(declare-fun call!1087 () Bool)

(assert (=> b!81160 call!1087))

(declare-fun lt!129033 () Unit!5398)

(assert (=> b!81160 (= lt!129033 lt!129039)))

(declare-fun lt!129036 () (_ BitVec 64))

(assert (=> b!81160 (= lt!129036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129044 () Unit!5398)

(declare-fun arrayBitRangesEqTransitive!0 (array!3586 array!3586 array!3586 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5398)

(assert (=> b!81160 (= lt!129044 (arrayBitRangesEqTransitive!0 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751) lt!129028 (_3!191 lt!129023) lt!129036 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!1086 () Bool)

(assert (=> b!81160 call!1086))

(declare-fun lt!129012 () Unit!5398)

(assert (=> b!81160 (= lt!129012 lt!129044)))

(declare-fun arrayBitRangesEq!0 (array!3586 array!3586 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81160 (arrayBitRangesEq!0 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751) (_3!191 lt!129023) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129035 () Unit!5398)

(declare-fun Unit!5408 () Unit!5398)

(assert (=> b!81160 (= lt!129035 Unit!5408)))

(declare-fun lt!129014 () Unit!5398)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!3586 array!3586 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5398)

(assert (=> b!81160 (= lt!129014 (arrayBitRangesEqImpliesEq!0 lt!129028 (_3!191 lt!129023) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!3586 (_ BitVec 64)) Bool)

(assert (=> b!81160 (= (bitAt!0 lt!129028 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!191 lt!129023) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129027 () Unit!5398)

(assert (=> b!81160 (= lt!129027 lt!129014)))

(declare-fun lt!129030 () Unit!5398)

(declare-fun Unit!5410 () Unit!5398)

(assert (=> b!81160 (= lt!129030 Unit!5410)))

(declare-fun lt!129032 () Bool)

(assert (=> b!81160 (= lt!129032 (= (bitAt!0 (_3!191 lt!129023) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!3782 lt!129024)))))

(declare-fun Unit!5411 () Unit!5398)

(assert (=> b!81160 (= lt!129040 Unit!5411)))

(assert (=> b!81160 lt!129032))

(declare-fun b!81161 () Bool)

(declare-fun lt!129019 () tuple3!340)

(declare-fun e!53333 () Bool)

(declare-datatypes ((List!807 0))(
  ( (Nil!804) (Cons!803 (h!922 Bool) (t!1557 List!807)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2866 array!3586 (_ BitVec 64) (_ BitVec 64)) List!807)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2866 BitStream!2866 (_ BitVec 64)) List!807)

(assert (=> b!81161 (= e!53333 (= (byteArrayBitContentToList!0 (_2!3778 lt!129019) (_3!191 lt!129019) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!3778 lt!129019) thiss!1716 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!81161 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!81161 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!25336 () Bool)

(assert (=> d!25336 e!53333))

(declare-fun res!67117 () Bool)

(assert (=> d!25336 (=> (not res!67117) (not e!53333))))

(declare-fun lt!129045 () (_ BitVec 64))

(assert (=> d!25336 (= res!67117 (= (bvsub lt!129045 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1652 (buf!2042 (_2!3778 lt!129019))) (currentByte!3955 (_2!3778 lt!129019)) (currentBit!3950 (_2!3778 lt!129019)))))))

(assert (=> d!25336 (or (= (bvand lt!129045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129045 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!129043 () (_ BitVec 64))

(assert (=> d!25336 (= lt!129045 (bvadd lt!129043 nBits!516))))

(assert (=> d!25336 (or (not (= (bvand lt!129043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!129043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!129043 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25336 (= lt!129043 (bitIndex!0 (size!1652 (buf!2042 thiss!1716)) (currentByte!3955 thiss!1716) (currentBit!3950 thiss!1716)))))

(assert (=> d!25336 (= lt!129019 e!53332)))

(declare-fun c!5692 () Bool)

(assert (=> d!25336 (= c!5692 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> d!25336 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!25336 (= (readBitsLoop!0 thiss!1716 nBits!516 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) lt!129019)))

(declare-fun lt!129042 () (_ BitVec 64))

(declare-fun lt!129017 () array!3586)

(declare-fun lt!129015 () array!3586)

(declare-fun bm!1083 () Bool)

(declare-fun lt!129013 () (_ BitVec 64))

(assert (=> bm!1083 (= call!1087 (arrayBitRangesEq!0 (ite c!5692 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751) lt!129017) (ite c!5692 (array!3587 (store (arr!2271 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751)) lt!129029 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2271 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751)) lt!129029)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129034)))) ((_ sign_extend 24) (ite (_1!3782 lt!129024) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129034) #b00000000))))) (size!1652 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751))) lt!129015) (ite c!5692 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129013) (ite c!5692 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129042)))))

(declare-fun b!81162 () Bool)

(assert (=> b!81162 (= e!53331 (and (= (buf!2042 thiss!1716) (buf!2042 (_2!3778 lt!129023))) (= (size!1652 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751)) (size!1652 (_3!191 lt!129023)))))))

(declare-fun b!81163 () Bool)

(declare-fun e!53330 () Bool)

(declare-datatypes ((tuple2!7182 0))(
  ( (tuple2!7183 (_1!3785 BitStream!2866) (_2!3785 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2866) tuple2!7182)

(assert (=> b!81163 (= e!53330 (= (bitAt!0 (_3!191 lt!129019) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!3785 (readBitPure!0 thiss!1716))))))

(declare-fun bm!1084 () Bool)

(assert (=> bm!1084 (= call!1086 (arrayBitRangesEq!0 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751) (ite c!5692 (_3!191 lt!129023) (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751)) (ite c!5692 lt!129036 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!5692 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1652 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!129037 () Unit!5398)

(declare-fun b!81164 () Bool)

(assert (=> b!81164 (= e!53332 (tuple3!341 lt!129037 thiss!1716 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751)))))

(declare-fun lt!129018 () Unit!5398)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!3586) Unit!5398)

(assert (=> b!81164 (= lt!129018 (arrayBitRangesEqReflexiveLemma!0 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751)))))

(assert (=> b!81164 call!1086))

(declare-fun lt!129038 () Unit!5398)

(assert (=> b!81164 (= lt!129038 lt!129018)))

(assert (=> b!81164 (= lt!129017 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751))))

(assert (=> b!81164 (= lt!129015 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751))))

(declare-fun lt!129010 () (_ BitVec 64))

(assert (=> b!81164 (= lt!129010 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129020 () (_ BitVec 64))

(assert (=> b!81164 (= lt!129020 ((_ sign_extend 32) (size!1652 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751))))))

(declare-fun lt!129041 () (_ BitVec 64))

(assert (=> b!81164 (= lt!129041 (bvmul lt!129020 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!81164 (= lt!129013 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!81164 (= lt!129042 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!3586 array!3586 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5398)

(assert (=> b!81164 (= lt!129037 (arrayBitRangesEqSlicedLemma!0 lt!129017 lt!129015 lt!129010 lt!129041 lt!129013 lt!129042))))

(assert (=> b!81164 call!1087))

(declare-fun b!81165 () Bool)

(declare-fun res!67113 () Bool)

(assert (=> b!81165 (=> (not res!67113) (not e!53333))))

(assert (=> b!81165 (= res!67113 e!53330)))

(declare-fun res!67115 () Bool)

(assert (=> b!81165 (=> res!67115 e!53330)))

(assert (=> b!81165 (= res!67115 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516)))))

(declare-fun b!81166 () Bool)

(declare-fun res!67116 () Bool)

(assert (=> b!81166 (=> (not res!67116) (not e!53333))))

(assert (=> b!81166 (= res!67116 (invariant!0 (currentBit!3950 (_2!3778 lt!129019)) (currentByte!3955 (_2!3778 lt!129019)) (size!1652 (buf!2042 (_2!3778 lt!129019)))))))

(declare-fun b!81167 () Bool)

(declare-fun res!67114 () Bool)

(assert (=> b!81167 (=> (not res!67114) (not e!53333))))

(assert (=> b!81167 (= res!67114 (and (= (buf!2042 thiss!1716) (buf!2042 (_2!3778 lt!129019))) (= (size!1652 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751)) (size!1652 (_3!191 lt!129019)))))))

(declare-fun b!81168 () Bool)

(declare-fun res!67118 () Bool)

(assert (=> b!81168 (=> (not res!67118) (not e!53333))))

(assert (=> b!81168 (= res!67118 (arrayBitRangesEq!0 (array!3587 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128751) (_3!191 lt!129019) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!25336 c!5692) b!81160))

(assert (= (and d!25336 (not c!5692)) b!81164))

(assert (= (and b!81160 res!67119) b!81162))

(assert (= (or b!81160 b!81164) bm!1083))

(assert (= (or b!81160 b!81164) bm!1084))

(assert (= (and d!25336 res!67117) b!81167))

(assert (= (and b!81167 res!67114) b!81168))

(assert (= (and b!81168 res!67118) b!81165))

(assert (= (and b!81165 (not res!67115)) b!81163))

(assert (= (and b!81165 res!67113) b!81166))

(assert (= (and b!81166 res!67116) b!81161))

(declare-fun m!126957 () Bool)

(assert (=> b!81161 m!126957))

(declare-fun m!126959 () Bool)

(assert (=> b!81161 m!126959))

(declare-fun m!126961 () Bool)

(assert (=> d!25336 m!126961))

(declare-fun m!126963 () Bool)

(assert (=> d!25336 m!126963))

(declare-fun m!126965 () Bool)

(assert (=> b!81164 m!126965))

(declare-fun m!126967 () Bool)

(assert (=> b!81164 m!126967))

(declare-fun m!126969 () Bool)

(assert (=> bm!1084 m!126969))

(declare-fun m!126971 () Bool)

(assert (=> bm!1083 m!126971))

(declare-fun m!126973 () Bool)

(assert (=> bm!1083 m!126973))

(declare-fun m!126975 () Bool)

(assert (=> bm!1083 m!126975))

(declare-fun m!126977 () Bool)

(assert (=> bm!1083 m!126977))

(declare-fun m!126979 () Bool)

(assert (=> b!81168 m!126979))

(declare-fun m!126981 () Bool)

(assert (=> b!81160 m!126981))

(declare-fun m!126983 () Bool)

(assert (=> b!81160 m!126983))

(declare-fun m!126985 () Bool)

(assert (=> b!81160 m!126985))

(declare-fun m!126987 () Bool)

(assert (=> b!81160 m!126987))

(assert (=> b!81160 m!126963))

(declare-fun m!126989 () Bool)

(assert (=> b!81160 m!126989))

(declare-fun m!126991 () Bool)

(assert (=> b!81160 m!126991))

(declare-fun m!126993 () Bool)

(assert (=> b!81160 m!126993))

(declare-fun m!126995 () Bool)

(assert (=> b!81160 m!126995))

(declare-fun m!126997 () Bool)

(assert (=> b!81160 m!126997))

(declare-fun m!126999 () Bool)

(assert (=> b!81160 m!126999))

(declare-fun m!127001 () Bool)

(assert (=> b!81160 m!127001))

(declare-fun m!127003 () Bool)

(assert (=> b!81160 m!127003))

(declare-fun m!127005 () Bool)

(assert (=> b!81160 m!127005))

(declare-fun m!127007 () Bool)

(assert (=> b!81160 m!127007))

(declare-fun m!127009 () Bool)

(assert (=> b!81163 m!127009))

(declare-fun m!127011 () Bool)

(assert (=> b!81163 m!127011))

(declare-fun m!127013 () Bool)

(assert (=> b!81166 m!127013))

(assert (=> b!81077 d!25336))

(push 1)

