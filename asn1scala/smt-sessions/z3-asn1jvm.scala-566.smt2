; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16108 () Bool)

(assert start!16108)

(declare-fun res!67137 () Bool)

(declare-fun e!53354 () Bool)

(assert (=> start!16108 (=> (not res!67137) (not e!53354))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!16108 (= res!67137 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!16108 e!53354))

(assert (=> start!16108 true))

(declare-datatypes ((array!3597 0))(
  ( (array!3598 (arr!2278 (Array (_ BitVec 32) (_ BitVec 8))) (size!1656 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2874 0))(
  ( (BitStream!2875 (buf!2046 array!3597) (currentByte!3962 (_ BitVec 32)) (currentBit!3957 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2874)

(declare-fun e!53355 () Bool)

(declare-fun inv!12 (BitStream!2874) Bool)

(assert (=> start!16108 (and (inv!12 thiss!1716) e!53355)))

(declare-fun b!81193 () Bool)

(declare-fun res!67138 () Bool)

(assert (=> b!81193 (=> (not res!67138) (not e!53354))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81193 (= res!67138 (validate_offset_bits!1 ((_ sign_extend 32) (size!1656 (buf!2046 thiss!1716))) ((_ sign_extend 32) (currentByte!3962 thiss!1716)) ((_ sign_extend 32) (currentBit!3957 thiss!1716)) nBits!516))))

(declare-fun b!81194 () Bool)

(declare-datatypes ((Unit!5418 0))(
  ( (Unit!5419) )
))
(declare-datatypes ((tuple3!348 0))(
  ( (tuple3!349 (_1!3788 Unit!5418) (_2!3788 BitStream!2874) (_3!195 array!3597)) )
))
(declare-fun readBitsLoop!0 (BitStream!2874 (_ BitVec 64) array!3597 (_ BitVec 64) (_ BitVec 64)) tuple3!348)

(assert (=> b!81194 (= e!53354 (bvsgt (currentByte!3962 thiss!1716) (currentByte!3962 (_2!3788 (readBitsLoop!0 thiss!1716 nBits!516 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516)))))))

(declare-fun b!81195 () Bool)

(declare-fun array_inv!1502 (array!3597) Bool)

(assert (=> b!81195 (= e!53355 (array_inv!1502 (buf!2046 thiss!1716)))))

(assert (= (and start!16108 res!67137) b!81193))

(assert (= (and b!81193 res!67138) b!81194))

(assert (= start!16108 b!81195))

(declare-fun m!127085 () Bool)

(assert (=> start!16108 m!127085))

(declare-fun m!127087 () Bool)

(assert (=> b!81193 m!127087))

(declare-fun m!127089 () Bool)

(assert (=> b!81194 m!127089))

(declare-fun m!127091 () Bool)

(assert (=> b!81195 m!127091))

(check-sat (not b!81194) (not b!81195) (not b!81193) (not start!16108))
(check-sat)
(get-model)

(declare-fun call!1094 () Bool)

(declare-fun c!5698 () Bool)

(declare-fun bm!1091 () Bool)

(declare-fun lt!129188 () tuple3!348)

(declare-fun arrayBitRangesEq!0 (array!3597 array!3597 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> bm!1091 (= call!1094 (arrayBitRangesEq!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5698 (_3!195 lt!129188) (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!81229 () Bool)

(declare-fun e!53380 () tuple3!348)

(declare-fun lt!129185 () Unit!5418)

(assert (=> b!81229 (= e!53380 (tuple3!349 lt!129185 thiss!1716 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!129213 () Unit!5418)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!3597) Unit!5418)

(assert (=> b!81229 (= lt!129213 (arrayBitRangesEqReflexiveLemma!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!81229 call!1094))

(declare-fun lt!129187 () Unit!5418)

(assert (=> b!81229 (= lt!129187 lt!129213)))

(declare-fun lt!129204 () array!3597)

(assert (=> b!81229 (= lt!129204 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!129211 () array!3597)

(assert (=> b!81229 (= lt!129211 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!129210 () (_ BitVec 64))

(assert (=> b!81229 (= lt!129210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129181 () (_ BitVec 64))

(assert (=> b!81229 (= lt!129181 ((_ sign_extend 32) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!129183 () (_ BitVec 64))

(assert (=> b!81229 (= lt!129183 (bvmul lt!129181 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!129191 () (_ BitVec 64))

(assert (=> b!81229 (= lt!129191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129203 () (_ BitVec 64))

(assert (=> b!81229 (= lt!129203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!3597 array!3597 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5418)

(assert (=> b!81229 (= lt!129185 (arrayBitRangesEqSlicedLemma!0 lt!129204 lt!129211 lt!129210 lt!129183 lt!129191 lt!129203))))

(declare-fun call!1095 () Bool)

(assert (=> b!81229 call!1095))

(declare-fun b!81230 () Bool)

(declare-fun res!67165 () Bool)

(declare-fun e!53379 () Bool)

(assert (=> b!81230 (=> (not res!67165) (not e!53379))))

(declare-fun e!53378 () Bool)

(assert (=> b!81230 (= res!67165 e!53378)))

(declare-fun res!67167 () Bool)

(assert (=> b!81230 (=> res!67167 e!53378)))

(assert (=> b!81230 (= res!67167 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516)))))

(declare-fun e!53377 () Bool)

(declare-fun b!81231 () Bool)

(assert (=> b!81231 (= e!53377 (and (= (buf!2046 thiss!1716) (buf!2046 (_2!3788 lt!129188))) (= (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1656 (_3!195 lt!129188)))))))

(declare-fun b!81232 () Bool)

(declare-fun lt!129215 () Unit!5418)

(assert (=> b!81232 (= e!53380 (tuple3!349 lt!129215 (_2!3788 lt!129188) (_3!195 lt!129188)))))

(declare-datatypes ((tuple2!7186 0))(
  ( (tuple2!7187 (_1!3790 Bool) (_2!3790 BitStream!2874)) )
))
(declare-fun lt!129190 () tuple2!7186)

(declare-fun readBit!0 (BitStream!2874) tuple2!7186)

(assert (=> b!81232 (= lt!129190 (readBit!0 thiss!1716))))

(declare-fun lt!129200 () (_ BitVec 32))

(assert (=> b!81232 (= lt!129200 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129207 () (_ BitVec 32))

(assert (=> b!81232 (= lt!129207 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129192 () array!3597)

(assert (=> b!81232 (= lt!129192 (array!3598 (store (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129200 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129200)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129207)))) ((_ sign_extend 24) (ite (_1!3790 lt!129190) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129207) #b00000000))))) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!129195 () (_ BitVec 64))

(assert (=> b!81232 (= lt!129195 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129186 () (_ BitVec 64))

(assert (=> b!81232 (= lt!129186 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!129189 () Unit!5418)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2874 BitStream!2874 (_ BitVec 64) (_ BitVec 64)) Unit!5418)

(assert (=> b!81232 (= lt!129189 (validateOffsetBitsIneqLemma!0 thiss!1716 (_2!3790 lt!129190) lt!129195 lt!129186))))

(assert (=> b!81232 (validate_offset_bits!1 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3790 lt!129190)))) ((_ sign_extend 32) (currentByte!3962 (_2!3790 lt!129190))) ((_ sign_extend 32) (currentBit!3957 (_2!3790 lt!129190))) (bvsub lt!129195 lt!129186))))

(declare-fun lt!129206 () Unit!5418)

(assert (=> b!81232 (= lt!129206 lt!129189)))

(assert (=> b!81232 (= lt!129188 (readBitsLoop!0 (_2!3790 lt!129190) nBits!516 lt!129192 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(declare-fun res!67163 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81232 (= res!67163 (= (bvsub (bvadd (bitIndex!0 (size!1656 (buf!2046 thiss!1716)) (currentByte!3962 thiss!1716) (currentBit!3957 thiss!1716)) nBits!516) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1656 (buf!2046 (_2!3788 lt!129188))) (currentByte!3962 (_2!3788 lt!129188)) (currentBit!3957 (_2!3788 lt!129188)))))))

(assert (=> b!81232 (=> (not res!67163) (not e!53377))))

(assert (=> b!81232 e!53377))

(declare-fun lt!129193 () Unit!5418)

(declare-fun Unit!5422 () Unit!5418)

(assert (=> b!81232 (= lt!129193 Unit!5422)))

(declare-fun lt!129196 () (_ BitVec 32))

(assert (=> b!81232 (= lt!129196 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129197 () (_ BitVec 32))

(assert (=> b!81232 (= lt!129197 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129182 () Unit!5418)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!3597 (_ BitVec 64) Bool) Unit!5418)

(assert (=> b!81232 (= lt!129182 (arrayBitRangesUpdatedAtLemma!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3790 lt!129190)))))

(assert (=> b!81232 (arrayBitRangesEq!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!3598 (store (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197)))) ((_ sign_extend 24) (ite (_1!3790 lt!129190) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197) #b00000000))))) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129184 () Unit!5418)

(assert (=> b!81232 (= lt!129184 lt!129182)))

(declare-fun lt!129194 () (_ BitVec 64))

(assert (=> b!81232 (= lt!129194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129202 () Unit!5418)

(declare-fun arrayBitRangesEqTransitive!0 (array!3597 array!3597 array!3597 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5418)

(assert (=> b!81232 (= lt!129202 (arrayBitRangesEqTransitive!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129192 (_3!195 lt!129188) lt!129194 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!81232 call!1095))

(declare-fun lt!129199 () Unit!5418)

(assert (=> b!81232 (= lt!129199 lt!129202)))

(assert (=> b!81232 call!1094))

(declare-fun lt!129180 () Unit!5418)

(declare-fun Unit!5423 () Unit!5418)

(assert (=> b!81232 (= lt!129180 Unit!5423)))

(declare-fun lt!129201 () Unit!5418)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!3597 array!3597 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5418)

(assert (=> b!81232 (= lt!129201 (arrayBitRangesEqImpliesEq!0 lt!129192 (_3!195 lt!129188) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!3597 (_ BitVec 64)) Bool)

(assert (=> b!81232 (= (bitAt!0 lt!129192 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!195 lt!129188) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129212 () Unit!5418)

(assert (=> b!81232 (= lt!129212 lt!129201)))

(declare-fun lt!129208 () Unit!5418)

(declare-fun Unit!5424 () Unit!5418)

(assert (=> b!81232 (= lt!129208 Unit!5424)))

(declare-fun lt!129214 () Bool)

(assert (=> b!81232 (= lt!129214 (= (bitAt!0 (_3!195 lt!129188) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!3790 lt!129190)))))

(declare-fun Unit!5425 () Unit!5418)

(assert (=> b!81232 (= lt!129215 Unit!5425)))

(assert (=> b!81232 lt!129214))

(declare-fun b!81234 () Bool)

(declare-fun res!67162 () Bool)

(assert (=> b!81234 (=> (not res!67162) (not e!53379))))

(declare-fun lt!129205 () tuple3!348)

(assert (=> b!81234 (= res!67162 (and (= (buf!2046 thiss!1716) (buf!2046 (_2!3788 lt!129205))) (= (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1656 (_3!195 lt!129205)))))))

(declare-fun bm!1092 () Bool)

(assert (=> bm!1092 (= call!1095 (arrayBitRangesEq!0 (ite c!5698 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129204) (ite c!5698 (_3!195 lt!129188) lt!129211) (ite c!5698 lt!129194 lt!129191) (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129203)))))

(declare-fun b!81235 () Bool)

(declare-fun res!67166 () Bool)

(assert (=> b!81235 (=> (not res!67166) (not e!53379))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81235 (= res!67166 (invariant!0 (currentBit!3957 (_2!3788 lt!129205)) (currentByte!3962 (_2!3788 lt!129205)) (size!1656 (buf!2046 (_2!3788 lt!129205)))))))

(declare-fun b!81236 () Bool)

(declare-datatypes ((tuple2!7190 0))(
  ( (tuple2!7191 (_1!3792 BitStream!2874) (_2!3792 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2874) tuple2!7190)

(assert (=> b!81236 (= e!53378 (= (bitAt!0 (_3!195 lt!129205) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!3792 (readBitPure!0 thiss!1716))))))

(declare-fun b!81237 () Bool)

(declare-datatypes ((List!809 0))(
  ( (Nil!806) (Cons!805 (h!924 Bool) (t!1559 List!809)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2874 array!3597 (_ BitVec 64) (_ BitVec 64)) List!809)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2874 BitStream!2874 (_ BitVec 64)) List!809)

(assert (=> b!81237 (= e!53379 (= (byteArrayBitContentToList!0 (_2!3788 lt!129205) (_3!195 lt!129205) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!3788 lt!129205) thiss!1716 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!81237 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!81237 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!81233 () Bool)

(declare-fun res!67161 () Bool)

(assert (=> b!81233 (=> (not res!67161) (not e!53379))))

(assert (=> b!81233 (= res!67161 (arrayBitRangesEq!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!195 lt!129205) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!25350 () Bool)

(assert (=> d!25350 e!53379))

(declare-fun res!67164 () Bool)

(assert (=> d!25350 (=> (not res!67164) (not e!53379))))

(declare-fun lt!129209 () (_ BitVec 64))

(assert (=> d!25350 (= res!67164 (= (bvsub lt!129209 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1656 (buf!2046 (_2!3788 lt!129205))) (currentByte!3962 (_2!3788 lt!129205)) (currentBit!3957 (_2!3788 lt!129205)))))))

(assert (=> d!25350 (or (= (bvand lt!129209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129209 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!129198 () (_ BitVec 64))

(assert (=> d!25350 (= lt!129209 (bvadd lt!129198 nBits!516))))

(assert (=> d!25350 (or (not (= (bvand lt!129198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!129198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!129198 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25350 (= lt!129198 (bitIndex!0 (size!1656 (buf!2046 thiss!1716)) (currentByte!3962 thiss!1716) (currentBit!3957 thiss!1716)))))

(assert (=> d!25350 (= lt!129205 e!53380)))

(assert (=> d!25350 (= c!5698 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> d!25350 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!25350 (= (readBitsLoop!0 thiss!1716 nBits!516 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) lt!129205)))

(assert (= (and d!25350 c!5698) b!81232))

(assert (= (and d!25350 (not c!5698)) b!81229))

(assert (= (and b!81232 res!67163) b!81231))

(assert (= (or b!81232 b!81229) bm!1092))

(assert (= (or b!81232 b!81229) bm!1091))

(assert (= (and d!25350 res!67164) b!81234))

(assert (= (and b!81234 res!67162) b!81233))

(assert (= (and b!81233 res!67161) b!81230))

(assert (= (and b!81230 (not res!67167)) b!81236))

(assert (= (and b!81230 res!67165) b!81235))

(assert (= (and b!81235 res!67166) b!81237))

(declare-fun m!127109 () Bool)

(assert (=> b!81233 m!127109))

(declare-fun m!127111 () Bool)

(assert (=> b!81232 m!127111))

(declare-fun m!127113 () Bool)

(assert (=> b!81232 m!127113))

(declare-fun m!127115 () Bool)

(assert (=> b!81232 m!127115))

(declare-fun m!127117 () Bool)

(assert (=> b!81232 m!127117))

(declare-fun m!127119 () Bool)

(assert (=> b!81232 m!127119))

(declare-fun m!127121 () Bool)

(assert (=> b!81232 m!127121))

(declare-fun m!127123 () Bool)

(assert (=> b!81232 m!127123))

(declare-fun m!127125 () Bool)

(assert (=> b!81232 m!127125))

(declare-fun m!127127 () Bool)

(assert (=> b!81232 m!127127))

(declare-fun m!127129 () Bool)

(assert (=> b!81232 m!127129))

(declare-fun m!127131 () Bool)

(assert (=> b!81232 m!127131))

(declare-fun m!127133 () Bool)

(assert (=> b!81232 m!127133))

(declare-fun m!127135 () Bool)

(assert (=> b!81232 m!127135))

(declare-fun m!127137 () Bool)

(assert (=> b!81232 m!127137))

(declare-fun m!127139 () Bool)

(assert (=> b!81232 m!127139))

(declare-fun m!127141 () Bool)

(assert (=> b!81232 m!127141))

(declare-fun m!127143 () Bool)

(assert (=> b!81232 m!127143))

(declare-fun m!127145 () Bool)

(assert (=> b!81232 m!127145))

(declare-fun m!127147 () Bool)

(assert (=> b!81237 m!127147))

(declare-fun m!127149 () Bool)

(assert (=> b!81237 m!127149))

(declare-fun m!127151 () Bool)

(assert (=> d!25350 m!127151))

(assert (=> d!25350 m!127139))

(declare-fun m!127153 () Bool)

(assert (=> b!81236 m!127153))

(declare-fun m!127155 () Bool)

(assert (=> b!81236 m!127155))

(declare-fun m!127157 () Bool)

(assert (=> bm!1091 m!127157))

(declare-fun m!127159 () Bool)

(assert (=> b!81229 m!127159))

(declare-fun m!127161 () Bool)

(assert (=> b!81229 m!127161))

(declare-fun m!127163 () Bool)

(assert (=> b!81235 m!127163))

(declare-fun m!127165 () Bool)

(assert (=> bm!1092 m!127165))

(assert (=> b!81194 d!25350))

(declare-fun d!25366 () Bool)

(assert (=> d!25366 (= (array_inv!1502 (buf!2046 thiss!1716)) (bvsge (size!1656 (buf!2046 thiss!1716)) #b00000000000000000000000000000000))))

(assert (=> b!81195 d!25366))

(declare-fun d!25368 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25368 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1656 (buf!2046 thiss!1716))) ((_ sign_extend 32) (currentByte!3962 thiss!1716)) ((_ sign_extend 32) (currentBit!3957 thiss!1716)) nBits!516) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1656 (buf!2046 thiss!1716))) ((_ sign_extend 32) (currentByte!3962 thiss!1716)) ((_ sign_extend 32) (currentBit!3957 thiss!1716))) nBits!516))))

(declare-fun bs!6214 () Bool)

(assert (= bs!6214 d!25368))

(declare-fun m!127167 () Bool)

(assert (=> bs!6214 m!127167))

(assert (=> b!81193 d!25368))

(declare-fun d!25370 () Bool)

(assert (=> d!25370 (= (inv!12 thiss!1716) (invariant!0 (currentBit!3957 thiss!1716) (currentByte!3962 thiss!1716) (size!1656 (buf!2046 thiss!1716))))))

(declare-fun bs!6215 () Bool)

(assert (= bs!6215 d!25370))

(declare-fun m!127169 () Bool)

(assert (=> bs!6215 m!127169))

(assert (=> start!16108 d!25370))

(check-sat (not b!81235) (not b!81232) (not d!25368) (not b!81236) (not d!25370) (not d!25350) (not bm!1091) (not bm!1092) (not b!81237) (not b!81233) (not b!81229))
(check-sat)
(get-model)

(declare-fun d!25380 () Bool)

(declare-fun e!53408 () Bool)

(assert (=> d!25380 e!53408))

(declare-fun res!67215 () Bool)

(assert (=> d!25380 (=> (not res!67215) (not e!53408))))

(declare-fun lt!129426 () (_ BitVec 64))

(assert (=> d!25380 (= res!67215 (or (= lt!129426 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!129426 #b0000000000000000000000000000000000000000000000000000000000001000) lt!129426))))))

(assert (=> d!25380 (= lt!129426 ((_ sign_extend 32) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!129425 () Unit!5418)

(declare-fun choose!59 (array!3597) Unit!5418)

(assert (=> d!25380 (= lt!129425 (choose!59 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> d!25380 (= (arrayBitRangesEqReflexiveLemma!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129425)))

(declare-fun b!81293 () Bool)

(assert (=> b!81293 (= e!53408 (arrayBitRangesEq!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!25380 res!67215) b!81293))

(declare-fun m!127295 () Bool)

(assert (=> d!25380 m!127295))

(declare-fun m!127297 () Bool)

(assert (=> b!81293 m!127297))

(assert (=> b!81229 d!25380))

(declare-fun d!25382 () Bool)

(assert (=> d!25382 (arrayBitRangesEq!0 lt!129204 lt!129211 lt!129191 lt!129203)))

(declare-fun lt!129432 () Unit!5418)

(declare-fun choose!4 (array!3597 array!3597 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5418)

(assert (=> d!25382 (= lt!129432 (choose!4 lt!129204 lt!129211 lt!129210 lt!129183 lt!129191 lt!129203))))

(assert (=> d!25382 (bvsle (size!1656 lt!129204) (size!1656 lt!129211))))

(assert (=> d!25382 (= (arrayBitRangesEqSlicedLemma!0 lt!129204 lt!129211 lt!129210 lt!129183 lt!129191 lt!129203) lt!129432)))

(declare-fun bs!6217 () Bool)

(assert (= bs!6217 d!25382))

(declare-fun m!127301 () Bool)

(assert (=> bs!6217 m!127301))

(declare-fun m!127305 () Bool)

(assert (=> bs!6217 m!127305))

(assert (=> b!81229 d!25382))

(declare-fun b!81359 () Bool)

(declare-fun res!67251 () Bool)

(declare-fun lt!129456 () (_ BitVec 32))

(assert (=> b!81359 (= res!67251 (= lt!129456 #b00000000000000000000000000000000))))

(declare-fun e!53459 () Bool)

(assert (=> b!81359 (=> res!67251 e!53459)))

(declare-fun e!53462 () Bool)

(assert (=> b!81359 (= e!53462 e!53459)))

(declare-fun b!81360 () Bool)

(declare-fun e!53461 () Bool)

(declare-fun call!1115 () Bool)

(assert (=> b!81360 (= e!53461 call!1115)))

(declare-fun b!81361 () Bool)

(declare-fun e!53460 () Bool)

(declare-fun e!53463 () Bool)

(assert (=> b!81361 (= e!53460 e!53463)))

(declare-fun res!67249 () Bool)

(assert (=> b!81361 (=> (not res!67249) (not e!53463))))

(declare-fun e!53458 () Bool)

(assert (=> b!81361 (= res!67249 e!53458)))

(declare-fun res!67250 () Bool)

(assert (=> b!81361 (=> res!67250 e!53458)))

(declare-datatypes ((tuple4!44 0))(
  ( (tuple4!45 (_1!3798 (_ BitVec 32)) (_2!3798 (_ BitVec 32)) (_3!198 (_ BitVec 32)) (_4!22 (_ BitVec 32))) )
))
(declare-fun lt!129455 () tuple4!44)

(assert (=> b!81361 (= res!67250 (bvsge (_1!3798 lt!129455) (_2!3798 lt!129455)))))

(assert (=> b!81361 (= lt!129456 ((_ extract 31 0) (bvsrem (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129203) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129454 () (_ BitVec 32))

(assert (=> b!81361 (= lt!129454 ((_ extract 31 0) (bvsrem (ite c!5698 lt!129194 lt!129191) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!44)

(assert (=> b!81361 (= lt!129455 (arrayBitIndices!0 (ite c!5698 lt!129194 lt!129191) (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129203)))))

(declare-fun b!81362 () Bool)

(assert (=> b!81362 (= e!53461 e!53462)))

(declare-fun res!67253 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81362 (= res!67253 (byteRangesEq!0 (select (arr!2278 (ite c!5698 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129204)) (_3!198 lt!129455)) (select (arr!2278 (ite c!5698 (_3!195 lt!129188) lt!129211)) (_3!198 lt!129455)) lt!129454 #b00000000000000000000000000001000))))

(assert (=> b!81362 (=> (not res!67253) (not e!53462))))

(declare-fun b!81363 () Bool)

(assert (=> b!81363 (= e!53459 call!1115)))

(declare-fun bm!1112 () Bool)

(declare-fun c!5719 () Bool)

(assert (=> bm!1112 (= call!1115 (byteRangesEq!0 (ite c!5719 (select (arr!2278 (ite c!5698 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129204)) (_3!198 lt!129455)) (select (arr!2278 (ite c!5698 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129204)) (_4!22 lt!129455))) (ite c!5719 (select (arr!2278 (ite c!5698 (_3!195 lt!129188) lt!129211)) (_3!198 lt!129455)) (select (arr!2278 (ite c!5698 (_3!195 lt!129188) lt!129211)) (_4!22 lt!129455))) (ite c!5719 lt!129454 #b00000000000000000000000000000000) lt!129456))))

(declare-fun b!81365 () Bool)

(assert (=> b!81365 (= e!53463 e!53461)))

(assert (=> b!81365 (= c!5719 (= (_3!198 lt!129455) (_4!22 lt!129455)))))

(declare-fun b!81364 () Bool)

(declare-fun arrayRangesEq!23 (array!3597 array!3597 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81364 (= e!53458 (arrayRangesEq!23 (ite c!5698 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129204) (ite c!5698 (_3!195 lt!129188) lt!129211) (_1!3798 lt!129455) (_2!3798 lt!129455)))))

(declare-fun d!25384 () Bool)

(declare-fun res!67252 () Bool)

(assert (=> d!25384 (=> res!67252 e!53460)))

(assert (=> d!25384 (= res!67252 (bvsge (ite c!5698 lt!129194 lt!129191) (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129203)))))

(assert (=> d!25384 (= (arrayBitRangesEq!0 (ite c!5698 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129204) (ite c!5698 (_3!195 lt!129188) lt!129211) (ite c!5698 lt!129194 lt!129191) (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129203)) e!53460)))

(assert (= (and d!25384 (not res!67252)) b!81361))

(assert (= (and b!81361 (not res!67250)) b!81364))

(assert (= (and b!81361 res!67249) b!81365))

(assert (= (and b!81365 c!5719) b!81360))

(assert (= (and b!81365 (not c!5719)) b!81362))

(assert (= (and b!81362 res!67253) b!81359))

(assert (= (and b!81359 (not res!67251)) b!81363))

(assert (= (or b!81360 b!81363) bm!1112))

(declare-fun m!127363 () Bool)

(assert (=> b!81361 m!127363))

(declare-fun m!127365 () Bool)

(assert (=> b!81362 m!127365))

(declare-fun m!127367 () Bool)

(assert (=> b!81362 m!127367))

(assert (=> b!81362 m!127365))

(assert (=> b!81362 m!127367))

(declare-fun m!127369 () Bool)

(assert (=> b!81362 m!127369))

(declare-fun m!127371 () Bool)

(assert (=> bm!1112 m!127371))

(assert (=> bm!1112 m!127367))

(declare-fun m!127373 () Bool)

(assert (=> bm!1112 m!127373))

(declare-fun m!127375 () Bool)

(assert (=> bm!1112 m!127375))

(assert (=> bm!1112 m!127365))

(declare-fun m!127377 () Bool)

(assert (=> b!81364 m!127377))

(assert (=> bm!1092 d!25384))

(declare-fun d!25402 () Bool)

(assert (=> d!25402 (= (invariant!0 (currentBit!3957 (_2!3788 lt!129205)) (currentByte!3962 (_2!3788 lt!129205)) (size!1656 (buf!2046 (_2!3788 lt!129205)))) (and (bvsge (currentBit!3957 (_2!3788 lt!129205)) #b00000000000000000000000000000000) (bvslt (currentBit!3957 (_2!3788 lt!129205)) #b00000000000000000000000000001000) (bvsge (currentByte!3962 (_2!3788 lt!129205)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3962 (_2!3788 lt!129205)) (size!1656 (buf!2046 (_2!3788 lt!129205)))) (and (= (currentBit!3957 (_2!3788 lt!129205)) #b00000000000000000000000000000000) (= (currentByte!3962 (_2!3788 lt!129205)) (size!1656 (buf!2046 (_2!3788 lt!129205))))))))))

(assert (=> b!81235 d!25402))

(declare-fun d!25406 () Bool)

(assert (=> d!25406 (= (invariant!0 (currentBit!3957 thiss!1716) (currentByte!3962 thiss!1716) (size!1656 (buf!2046 thiss!1716))) (and (bvsge (currentBit!3957 thiss!1716) #b00000000000000000000000000000000) (bvslt (currentBit!3957 thiss!1716) #b00000000000000000000000000001000) (bvsge (currentByte!3962 thiss!1716) #b00000000000000000000000000000000) (or (bvslt (currentByte!3962 thiss!1716) (size!1656 (buf!2046 thiss!1716))) (and (= (currentBit!3957 thiss!1716) #b00000000000000000000000000000000) (= (currentByte!3962 thiss!1716) (size!1656 (buf!2046 thiss!1716)))))))))

(assert (=> d!25370 d!25406))

(declare-fun d!25408 () Bool)

(assert (=> d!25408 (= (bitAt!0 (_3!195 lt!129205) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand ((_ sign_extend 24) (select (arr!2278 (_3!195 lt!129205)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!6220 () Bool)

(assert (= bs!6220 d!25408))

(declare-fun m!127379 () Bool)

(assert (=> bs!6220 m!127379))

(declare-fun m!127381 () Bool)

(assert (=> bs!6220 m!127381))

(assert (=> b!81236 d!25408))

(declare-fun d!25414 () Bool)

(declare-fun lt!129462 () tuple2!7186)

(assert (=> d!25414 (= lt!129462 (readBit!0 thiss!1716))))

(assert (=> d!25414 (= (readBitPure!0 thiss!1716) (tuple2!7191 (_2!3790 lt!129462) (_1!3790 lt!129462)))))

(declare-fun bs!6221 () Bool)

(assert (= bs!6221 d!25414))

(assert (=> bs!6221 m!127129))

(assert (=> b!81236 d!25414))

(declare-fun b!81366 () Bool)

(declare-fun res!67256 () Bool)

(declare-fun lt!129465 () (_ BitVec 32))

(assert (=> b!81366 (= res!67256 (= lt!129465 #b00000000000000000000000000000000))))

(declare-fun e!53465 () Bool)

(assert (=> b!81366 (=> res!67256 e!53465)))

(declare-fun e!53468 () Bool)

(assert (=> b!81366 (= e!53468 e!53465)))

(declare-fun b!81367 () Bool)

(declare-fun e!53467 () Bool)

(declare-fun call!1116 () Bool)

(assert (=> b!81367 (= e!53467 call!1116)))

(declare-fun b!81368 () Bool)

(declare-fun e!53466 () Bool)

(declare-fun e!53469 () Bool)

(assert (=> b!81368 (= e!53466 e!53469)))

(declare-fun res!67254 () Bool)

(assert (=> b!81368 (=> (not res!67254) (not e!53469))))

(declare-fun e!53464 () Bool)

(assert (=> b!81368 (= res!67254 e!53464)))

(declare-fun res!67255 () Bool)

(assert (=> b!81368 (=> res!67255 e!53464)))

(declare-fun lt!129464 () tuple4!44)

(assert (=> b!81368 (= res!67255 (bvsge (_1!3798 lt!129464) (_2!3798 lt!129464)))))

(assert (=> b!81368 (= lt!129465 ((_ extract 31 0) (bvsrem (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129463 () (_ BitVec 32))

(assert (=> b!81368 (= lt!129463 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81368 (= lt!129464 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!81369 () Bool)

(assert (=> b!81369 (= e!53467 e!53468)))

(declare-fun res!67258 () Bool)

(assert (=> b!81369 (= res!67258 (byteRangesEq!0 (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_3!198 lt!129464)) (select (arr!2278 (ite c!5698 (_3!195 lt!129188) (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) (_3!198 lt!129464)) lt!129463 #b00000000000000000000000000001000))))

(assert (=> b!81369 (=> (not res!67258) (not e!53468))))

(declare-fun b!81370 () Bool)

(assert (=> b!81370 (= e!53465 call!1116)))

(declare-fun bm!1113 () Bool)

(declare-fun c!5720 () Bool)

(assert (=> bm!1113 (= call!1116 (byteRangesEq!0 (ite c!5720 (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_3!198 lt!129464)) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_4!22 lt!129464))) (ite c!5720 (select (arr!2278 (ite c!5698 (_3!195 lt!129188) (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) (_3!198 lt!129464)) (select (arr!2278 (ite c!5698 (_3!195 lt!129188) (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) (_4!22 lt!129464))) (ite c!5720 lt!129463 #b00000000000000000000000000000000) lt!129465))))

(declare-fun b!81372 () Bool)

(assert (=> b!81372 (= e!53469 e!53467)))

(assert (=> b!81372 (= c!5720 (= (_3!198 lt!129464) (_4!22 lt!129464)))))

(declare-fun b!81371 () Bool)

(assert (=> b!81371 (= e!53464 (arrayRangesEq!23 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5698 (_3!195 lt!129188) (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_1!3798 lt!129464) (_2!3798 lt!129464)))))

(declare-fun d!25416 () Bool)

(declare-fun res!67257 () Bool)

(assert (=> d!25416 (=> res!67257 e!53466)))

(assert (=> d!25416 (= res!67257 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!25416 (= (arrayBitRangesEq!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5698 (_3!195 lt!129188) (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5698 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))) e!53466)))

(assert (= (and d!25416 (not res!67257)) b!81368))

(assert (= (and b!81368 (not res!67255)) b!81371))

(assert (= (and b!81368 res!67254) b!81372))

(assert (= (and b!81372 c!5720) b!81367))

(assert (= (and b!81372 (not c!5720)) b!81369))

(assert (= (and b!81369 res!67258) b!81366))

(assert (= (and b!81366 (not res!67256)) b!81370))

(assert (= (or b!81367 b!81370) bm!1113))

(declare-fun m!127383 () Bool)

(assert (=> b!81368 m!127383))

(declare-fun m!127385 () Bool)

(assert (=> b!81369 m!127385))

(declare-fun m!127387 () Bool)

(assert (=> b!81369 m!127387))

(assert (=> b!81369 m!127385))

(assert (=> b!81369 m!127387))

(declare-fun m!127389 () Bool)

(assert (=> b!81369 m!127389))

(declare-fun m!127391 () Bool)

(assert (=> bm!1113 m!127391))

(assert (=> bm!1113 m!127387))

(declare-fun m!127393 () Bool)

(assert (=> bm!1113 m!127393))

(declare-fun m!127395 () Bool)

(assert (=> bm!1113 m!127395))

(assert (=> bm!1113 m!127385))

(declare-fun m!127397 () Bool)

(assert (=> b!81371 m!127397))

(assert (=> bm!1091 d!25416))

(declare-fun d!25418 () Bool)

(declare-fun e!53501 () Bool)

(assert (=> d!25418 e!53501))

(declare-fun res!67294 () Bool)

(assert (=> d!25418 (=> (not res!67294) (not e!53501))))

(declare-fun lt!129524 () (_ BitVec 64))

(declare-fun lt!129522 () (_ BitVec 64))

(declare-fun lt!129523 () (_ BitVec 64))

(assert (=> d!25418 (= res!67294 (= lt!129522 (bvsub lt!129523 lt!129524)))))

(assert (=> d!25418 (or (= (bvand lt!129523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129524 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129523 lt!129524) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25418 (= lt!129524 (remainingBits!0 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3788 lt!129188)))) ((_ sign_extend 32) (currentByte!3962 (_2!3788 lt!129188))) ((_ sign_extend 32) (currentBit!3957 (_2!3788 lt!129188)))))))

(declare-fun lt!129521 () (_ BitVec 64))

(declare-fun lt!129520 () (_ BitVec 64))

(assert (=> d!25418 (= lt!129523 (bvmul lt!129521 lt!129520))))

(assert (=> d!25418 (or (= lt!129521 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!129520 (bvsdiv (bvmul lt!129521 lt!129520) lt!129521)))))

(assert (=> d!25418 (= lt!129520 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25418 (= lt!129521 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3788 lt!129188)))))))

(assert (=> d!25418 (= lt!129522 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3962 (_2!3788 lt!129188))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3957 (_2!3788 lt!129188)))))))

(assert (=> d!25418 (invariant!0 (currentBit!3957 (_2!3788 lt!129188)) (currentByte!3962 (_2!3788 lt!129188)) (size!1656 (buf!2046 (_2!3788 lt!129188))))))

(assert (=> d!25418 (= (bitIndex!0 (size!1656 (buf!2046 (_2!3788 lt!129188))) (currentByte!3962 (_2!3788 lt!129188)) (currentBit!3957 (_2!3788 lt!129188))) lt!129522)))

(declare-fun b!81415 () Bool)

(declare-fun res!67293 () Bool)

(assert (=> b!81415 (=> (not res!67293) (not e!53501))))

(assert (=> b!81415 (= res!67293 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129522))))

(declare-fun b!81416 () Bool)

(declare-fun lt!129525 () (_ BitVec 64))

(assert (=> b!81416 (= e!53501 (bvsle lt!129522 (bvmul lt!129525 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81416 (or (= lt!129525 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!129525 #b0000000000000000000000000000000000000000000000000000000000001000) lt!129525)))))

(assert (=> b!81416 (= lt!129525 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3788 lt!129188)))))))

(assert (= (and d!25418 res!67294) b!81415))

(assert (= (and b!81415 res!67293) b!81416))

(declare-fun m!127421 () Bool)

(assert (=> d!25418 m!127421))

(declare-fun m!127423 () Bool)

(assert (=> d!25418 m!127423))

(assert (=> b!81232 d!25418))

(declare-fun d!25430 () Bool)

(assert (=> d!25430 (= (bitAt!0 (_3!195 lt!129188) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand ((_ sign_extend 24) (select (arr!2278 (_3!195 lt!129188)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!6222 () Bool)

(assert (= bs!6222 d!25430))

(declare-fun m!127427 () Bool)

(assert (=> bs!6222 m!127427))

(assert (=> bs!6222 m!127381))

(assert (=> b!81232 d!25430))

(declare-fun d!25432 () Bool)

(assert (=> d!25432 (arrayBitRangesEq!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!195 lt!129188) lt!129194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129531 () Unit!5418)

(declare-fun choose!49 (array!3597 array!3597 array!3597 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5418)

(assert (=> d!25432 (= lt!129531 (choose!49 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129192 (_3!195 lt!129188) lt!129194 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!25432 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129194) (bvsle lt!129194 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!25432 (= (arrayBitRangesEqTransitive!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!129192 (_3!195 lt!129188) lt!129194 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!129531)))

(declare-fun bs!6223 () Bool)

(assert (= bs!6223 d!25432))

(declare-fun m!127455 () Bool)

(assert (=> bs!6223 m!127455))

(declare-fun m!127459 () Bool)

(assert (=> bs!6223 m!127459))

(assert (=> b!81232 d!25432))

(declare-fun c!5727 () Bool)

(declare-fun lt!129543 () tuple3!348)

(declare-fun call!1123 () Bool)

(declare-fun bm!1120 () Bool)

(assert (=> bm!1120 (= call!1123 (arrayBitRangesEq!0 lt!129192 (ite c!5727 (_3!195 lt!129543) lt!129192) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5727 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvmul ((_ sign_extend 32) (size!1656 lt!129192)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!81431 () Bool)

(declare-fun e!53521 () tuple3!348)

(declare-fun lt!129540 () Unit!5418)

(assert (=> b!81431 (= e!53521 (tuple3!349 lt!129540 (_2!3790 lt!129190) lt!129192))))

(declare-fun lt!129568 () Unit!5418)

(assert (=> b!81431 (= lt!129568 (arrayBitRangesEqReflexiveLemma!0 lt!129192))))

(assert (=> b!81431 call!1123))

(declare-fun lt!129542 () Unit!5418)

(assert (=> b!81431 (= lt!129542 lt!129568)))

(declare-fun lt!129559 () array!3597)

(assert (=> b!81431 (= lt!129559 lt!129192)))

(declare-fun lt!129566 () array!3597)

(assert (=> b!81431 (= lt!129566 lt!129192)))

(declare-fun lt!129565 () (_ BitVec 64))

(assert (=> b!81431 (= lt!129565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129534 () (_ BitVec 64))

(assert (=> b!81431 (= lt!129534 ((_ sign_extend 32) (size!1656 lt!129192)))))

(declare-fun lt!129537 () (_ BitVec 64))

(assert (=> b!81431 (= lt!129537 (bvmul lt!129534 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!129546 () (_ BitVec 64))

(assert (=> b!81431 (= lt!129546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129558 () (_ BitVec 64))

(assert (=> b!81431 (= lt!129558 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!81431 (= lt!129540 (arrayBitRangesEqSlicedLemma!0 lt!129559 lt!129566 lt!129565 lt!129537 lt!129546 lt!129558))))

(declare-fun call!1124 () Bool)

(assert (=> b!81431 call!1124))

(declare-fun b!81432 () Bool)

(declare-fun res!67309 () Bool)

(declare-fun e!53520 () Bool)

(assert (=> b!81432 (=> (not res!67309) (not e!53520))))

(declare-fun e!53519 () Bool)

(assert (=> b!81432 (= res!67309 e!53519)))

(declare-fun res!67311 () Bool)

(assert (=> b!81432 (=> res!67311 e!53519)))

(assert (=> b!81432 (= res!67311 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516)))))

(declare-fun e!53518 () Bool)

(declare-fun b!81433 () Bool)

(assert (=> b!81433 (= e!53518 (and (= (buf!2046 (_2!3790 lt!129190)) (buf!2046 (_2!3788 lt!129543))) (= (size!1656 lt!129192) (size!1656 (_3!195 lt!129543)))))))

(declare-fun b!81434 () Bool)

(declare-fun lt!129570 () Unit!5418)

(assert (=> b!81434 (= e!53521 (tuple3!349 lt!129570 (_2!3788 lt!129543) (_3!195 lt!129543)))))

(declare-fun lt!129545 () tuple2!7186)

(assert (=> b!81434 (= lt!129545 (readBit!0 (_2!3790 lt!129190)))))

(declare-fun lt!129555 () (_ BitVec 32))

(assert (=> b!81434 (= lt!129555 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129562 () (_ BitVec 32))

(assert (=> b!81434 (= lt!129562 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129547 () array!3597)

(assert (=> b!81434 (= lt!129547 (array!3598 (store (arr!2278 lt!129192) lt!129555 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 lt!129192) lt!129555)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129562)))) ((_ sign_extend 24) (ite (_1!3790 lt!129545) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129562) #b00000000))))) (size!1656 lt!129192)))))

(declare-fun lt!129550 () (_ BitVec 64))

(assert (=> b!81434 (= lt!129550 (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!129541 () (_ BitVec 64))

(assert (=> b!81434 (= lt!129541 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!129544 () Unit!5418)

(assert (=> b!81434 (= lt!129544 (validateOffsetBitsIneqLemma!0 (_2!3790 lt!129190) (_2!3790 lt!129545) lt!129550 lt!129541))))

(assert (=> b!81434 (validate_offset_bits!1 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3790 lt!129545)))) ((_ sign_extend 32) (currentByte!3962 (_2!3790 lt!129545))) ((_ sign_extend 32) (currentBit!3957 (_2!3790 lt!129545))) (bvsub lt!129550 lt!129541))))

(declare-fun lt!129561 () Unit!5418)

(assert (=> b!81434 (= lt!129561 lt!129544)))

(assert (=> b!81434 (= lt!129543 (readBitsLoop!0 (_2!3790 lt!129545) nBits!516 lt!129547 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(declare-fun res!67307 () Bool)

(assert (=> b!81434 (= res!67307 (= (bvsub (bvadd (bitIndex!0 (size!1656 (buf!2046 (_2!3790 lt!129190))) (currentByte!3962 (_2!3790 lt!129190)) (currentBit!3957 (_2!3790 lt!129190))) nBits!516) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!1656 (buf!2046 (_2!3788 lt!129543))) (currentByte!3962 (_2!3788 lt!129543)) (currentBit!3957 (_2!3788 lt!129543)))))))

(assert (=> b!81434 (=> (not res!67307) (not e!53518))))

(assert (=> b!81434 e!53518))

(declare-fun lt!129548 () Unit!5418)

(declare-fun Unit!5434 () Unit!5418)

(assert (=> b!81434 (= lt!129548 Unit!5434)))

(declare-fun lt!129551 () (_ BitVec 32))

(assert (=> b!81434 (= lt!129551 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129552 () (_ BitVec 32))

(assert (=> b!81434 (= lt!129552 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129536 () Unit!5418)

(assert (=> b!81434 (= lt!129536 (arrayBitRangesUpdatedAtLemma!0 lt!129192 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (_1!3790 lt!129545)))))

(assert (=> b!81434 (arrayBitRangesEq!0 lt!129192 (array!3598 (store (arr!2278 lt!129192) lt!129551 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 lt!129192) lt!129551)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129552)))) ((_ sign_extend 24) (ite (_1!3790 lt!129545) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129552) #b00000000))))) (size!1656 lt!129192)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!129539 () Unit!5418)

(assert (=> b!81434 (= lt!129539 lt!129536)))

(declare-fun lt!129549 () (_ BitVec 64))

(assert (=> b!81434 (= lt!129549 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129557 () Unit!5418)

(assert (=> b!81434 (= lt!129557 (arrayBitRangesEqTransitive!0 lt!129192 lt!129547 (_3!195 lt!129543) lt!129549 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!81434 call!1124))

(declare-fun lt!129554 () Unit!5418)

(assert (=> b!81434 (= lt!129554 lt!129557)))

(assert (=> b!81434 call!1123))

(declare-fun lt!129533 () Unit!5418)

(declare-fun Unit!5435 () Unit!5418)

(assert (=> b!81434 (= lt!129533 Unit!5435)))

(declare-fun lt!129556 () Unit!5418)

(assert (=> b!81434 (= lt!129556 (arrayBitRangesEqImpliesEq!0 lt!129547 (_3!195 lt!129543) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!81434 (= (bitAt!0 lt!129547 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 (_3!195 lt!129543) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!129567 () Unit!5418)

(assert (=> b!81434 (= lt!129567 lt!129556)))

(declare-fun lt!129563 () Unit!5418)

(declare-fun Unit!5436 () Unit!5418)

(assert (=> b!81434 (= lt!129563 Unit!5436)))

(declare-fun lt!129569 () Bool)

(assert (=> b!81434 (= lt!129569 (= (bitAt!0 (_3!195 lt!129543) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (_1!3790 lt!129545)))))

(declare-fun Unit!5437 () Unit!5418)

(assert (=> b!81434 (= lt!129570 Unit!5437)))

(assert (=> b!81434 lt!129569))

(declare-fun b!81436 () Bool)

(declare-fun res!67306 () Bool)

(assert (=> b!81436 (=> (not res!67306) (not e!53520))))

(declare-fun lt!129560 () tuple3!348)

(assert (=> b!81436 (= res!67306 (and (= (buf!2046 (_2!3790 lt!129190)) (buf!2046 (_2!3788 lt!129560))) (= (size!1656 lt!129192) (size!1656 (_3!195 lt!129560)))))))

(declare-fun bm!1121 () Bool)

(assert (=> bm!1121 (= call!1124 (arrayBitRangesEq!0 (ite c!5727 lt!129192 lt!129559) (ite c!5727 (_3!195 lt!129543) lt!129566) (ite c!5727 lt!129549 lt!129546) (ite c!5727 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) lt!129558)))))

(declare-fun b!81437 () Bool)

(declare-fun res!67310 () Bool)

(assert (=> b!81437 (=> (not res!67310) (not e!53520))))

(assert (=> b!81437 (= res!67310 (invariant!0 (currentBit!3957 (_2!3788 lt!129560)) (currentByte!3962 (_2!3788 lt!129560)) (size!1656 (buf!2046 (_2!3788 lt!129560)))))))

(declare-fun b!81438 () Bool)

(assert (=> b!81438 (= e!53519 (= (bitAt!0 (_3!195 lt!129560) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (_2!3792 (readBitPure!0 (_2!3790 lt!129190)))))))

(declare-fun b!81439 () Bool)

(assert (=> b!81439 (= e!53520 (= (byteArrayBitContentToList!0 (_2!3788 lt!129560) (_3!195 lt!129560) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))) (bitStreamReadBitsIntoList!0 (_2!3788 lt!129560) (_2!3790 lt!129190) (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!81439 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!81439 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!81435 () Bool)

(declare-fun res!67302 () Bool)

(assert (=> b!81435 (=> (not res!67302) (not e!53520))))

(assert (=> b!81435 (= res!67302 (arrayBitRangesEq!0 lt!129192 (_3!195 lt!129560) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!25440 () Bool)

(assert (=> d!25440 e!53520))

(declare-fun res!67308 () Bool)

(assert (=> d!25440 (=> (not res!67308) (not e!53520))))

(declare-fun lt!129564 () (_ BitVec 64))

(assert (=> d!25440 (= res!67308 (= (bvsub lt!129564 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!1656 (buf!2046 (_2!3788 lt!129560))) (currentByte!3962 (_2!3788 lt!129560)) (currentBit!3957 (_2!3788 lt!129560)))))))

(assert (=> d!25440 (or (= (bvand lt!129564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129564 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!129553 () (_ BitVec 64))

(assert (=> d!25440 (= lt!129564 (bvadd lt!129553 nBits!516))))

(assert (=> d!25440 (or (not (= (bvand lt!129553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!129553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!129553 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25440 (= lt!129553 (bitIndex!0 (size!1656 (buf!2046 (_2!3790 lt!129190))) (currentByte!3962 (_2!3790 lt!129190)) (currentBit!3957 (_2!3790 lt!129190))))))

(assert (=> d!25440 (= lt!129560 e!53521)))

(assert (=> d!25440 (= c!5727 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(assert (=> d!25440 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!25440 (= (readBitsLoop!0 (_2!3790 lt!129190) nBits!516 lt!129192 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516) lt!129560)))

(assert (= (and d!25440 c!5727) b!81434))

(assert (= (and d!25440 (not c!5727)) b!81431))

(assert (= (and b!81434 res!67307) b!81433))

(assert (= (or b!81434 b!81431) bm!1121))

(assert (= (or b!81434 b!81431) bm!1120))

(assert (= (and d!25440 res!67308) b!81436))

(assert (= (and b!81436 res!67306) b!81435))

(assert (= (and b!81435 res!67302) b!81432))

(assert (= (and b!81432 (not res!67311)) b!81438))

(assert (= (and b!81432 res!67309) b!81437))

(assert (= (and b!81437 res!67310) b!81439))

(declare-fun m!127479 () Bool)

(assert (=> b!81435 m!127479))

(declare-fun m!127481 () Bool)

(assert (=> b!81434 m!127481))

(declare-fun m!127483 () Bool)

(assert (=> b!81434 m!127483))

(declare-fun m!127485 () Bool)

(assert (=> b!81434 m!127485))

(declare-fun m!127487 () Bool)

(assert (=> b!81434 m!127487))

(declare-fun m!127489 () Bool)

(assert (=> b!81434 m!127489))

(declare-fun m!127491 () Bool)

(assert (=> b!81434 m!127491))

(declare-fun m!127493 () Bool)

(assert (=> b!81434 m!127493))

(declare-fun m!127495 () Bool)

(assert (=> b!81434 m!127495))

(declare-fun m!127497 () Bool)

(assert (=> b!81434 m!127497))

(declare-fun m!127499 () Bool)

(assert (=> b!81434 m!127499))

(declare-fun m!127501 () Bool)

(assert (=> b!81434 m!127501))

(declare-fun m!127503 () Bool)

(assert (=> b!81434 m!127503))

(declare-fun m!127505 () Bool)

(assert (=> b!81434 m!127505))

(declare-fun m!127507 () Bool)

(assert (=> b!81434 m!127507))

(declare-fun m!127509 () Bool)

(assert (=> b!81434 m!127509))

(declare-fun m!127511 () Bool)

(assert (=> b!81434 m!127511))

(declare-fun m!127513 () Bool)

(assert (=> b!81434 m!127513))

(declare-fun m!127515 () Bool)

(assert (=> b!81434 m!127515))

(declare-fun m!127517 () Bool)

(assert (=> b!81439 m!127517))

(declare-fun m!127519 () Bool)

(assert (=> b!81439 m!127519))

(declare-fun m!127521 () Bool)

(assert (=> d!25440 m!127521))

(assert (=> d!25440 m!127509))

(declare-fun m!127523 () Bool)

(assert (=> b!81438 m!127523))

(declare-fun m!127525 () Bool)

(assert (=> b!81438 m!127525))

(declare-fun m!127527 () Bool)

(assert (=> bm!1120 m!127527))

(declare-fun m!127529 () Bool)

(assert (=> b!81431 m!127529))

(declare-fun m!127531 () Bool)

(assert (=> b!81431 m!127531))

(declare-fun m!127533 () Bool)

(assert (=> b!81437 m!127533))

(declare-fun m!127535 () Bool)

(assert (=> bm!1121 m!127535))

(assert (=> b!81232 d!25440))

(declare-fun d!25446 () Bool)

(assert (=> d!25446 (= (bitAt!0 lt!129192 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand ((_ sign_extend 24) (select (arr!2278 lt!129192) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!6224 () Bool)

(assert (= bs!6224 d!25446))

(declare-fun m!127537 () Bool)

(assert (=> bs!6224 m!127537))

(assert (=> bs!6224 m!127381))

(assert (=> b!81232 d!25446))

(declare-fun d!25448 () Bool)

(declare-fun e!53547 () Bool)

(assert (=> d!25448 e!53547))

(declare-fun res!67335 () Bool)

(assert (=> d!25448 (=> (not res!67335) (not e!53547))))

(declare-datatypes ((tuple2!7202 0))(
  ( (tuple2!7203 (_1!3801 Unit!5418) (_2!3801 BitStream!2874)) )
))
(declare-fun increaseBitIndex!0 (BitStream!2874) tuple2!7202)

(assert (=> d!25448 (= res!67335 (= (buf!2046 (_2!3801 (increaseBitIndex!0 thiss!1716))) (buf!2046 thiss!1716)))))

(declare-fun lt!129666 () Bool)

(assert (=> d!25448 (= lt!129666 (not (= (bvand ((_ sign_extend 24) (select (arr!2278 (buf!2046 thiss!1716)) (currentByte!3962 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3957 thiss!1716)))) #b00000000000000000000000000000000)))))

(declare-fun lt!129667 () tuple2!7186)

(assert (=> d!25448 (= lt!129667 (tuple2!7187 (not (= (bvand ((_ sign_extend 24) (select (arr!2278 (buf!2046 thiss!1716)) (currentByte!3962 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3957 thiss!1716)))) #b00000000000000000000000000000000)) (_2!3801 (increaseBitIndex!0 thiss!1716))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!25448 (validate_offset_bit!0 ((_ sign_extend 32) (size!1656 (buf!2046 thiss!1716))) ((_ sign_extend 32) (currentByte!3962 thiss!1716)) ((_ sign_extend 32) (currentBit!3957 thiss!1716)))))

(assert (=> d!25448 (= (readBit!0 thiss!1716) lt!129667)))

(declare-fun b!81467 () Bool)

(declare-fun lt!129672 () (_ BitVec 64))

(declare-fun lt!129670 () (_ BitVec 64))

(assert (=> b!81467 (= e!53547 (= (bitIndex!0 (size!1656 (buf!2046 (_2!3801 (increaseBitIndex!0 thiss!1716)))) (currentByte!3962 (_2!3801 (increaseBitIndex!0 thiss!1716))) (currentBit!3957 (_2!3801 (increaseBitIndex!0 thiss!1716)))) (bvadd lt!129672 lt!129670)))))

(assert (=> b!81467 (or (not (= (bvand lt!129672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129670 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!129672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!129672 lt!129670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!81467 (= lt!129670 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!81467 (= lt!129672 (bitIndex!0 (size!1656 (buf!2046 thiss!1716)) (currentByte!3962 thiss!1716) (currentBit!3957 thiss!1716)))))

(declare-fun lt!129668 () Bool)

(assert (=> b!81467 (= lt!129668 (not (= (bvand ((_ sign_extend 24) (select (arr!2278 (buf!2046 thiss!1716)) (currentByte!3962 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3957 thiss!1716)))) #b00000000000000000000000000000000)))))

(declare-fun lt!129669 () Bool)

(assert (=> b!81467 (= lt!129669 (not (= (bvand ((_ sign_extend 24) (select (arr!2278 (buf!2046 thiss!1716)) (currentByte!3962 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3957 thiss!1716)))) #b00000000000000000000000000000000)))))

(declare-fun lt!129671 () Bool)

(assert (=> b!81467 (= lt!129671 (not (= (bvand ((_ sign_extend 24) (select (arr!2278 (buf!2046 thiss!1716)) (currentByte!3962 thiss!1716))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3957 thiss!1716)))) #b00000000000000000000000000000000)))))

(assert (= (and d!25448 res!67335) b!81467))

(declare-fun m!127643 () Bool)

(assert (=> d!25448 m!127643))

(declare-fun m!127645 () Bool)

(assert (=> d!25448 m!127645))

(declare-fun m!127647 () Bool)

(assert (=> d!25448 m!127647))

(declare-fun m!127649 () Bool)

(assert (=> d!25448 m!127649))

(assert (=> b!81467 m!127139))

(declare-fun m!127651 () Bool)

(assert (=> b!81467 m!127651))

(assert (=> b!81467 m!127645))

(assert (=> b!81467 m!127647))

(assert (=> b!81467 m!127643))

(assert (=> b!81232 d!25448))

(declare-fun d!25474 () Bool)

(assert (=> d!25474 (= (bitAt!0 lt!129192 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!195 lt!129188) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129690 () Unit!5418)

(declare-fun choose!31 (array!3597 array!3597 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5418)

(assert (=> d!25474 (= lt!129690 (choose!31 lt!129192 (_3!195 lt!129188) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!25474 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!25474 (= (arrayBitRangesEqImpliesEq!0 lt!129192 (_3!195 lt!129188) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!129690)))

(declare-fun bs!6232 () Bool)

(assert (= bs!6232 d!25474))

(assert (=> bs!6232 m!127137))

(assert (=> bs!6232 m!127121))

(declare-fun m!127663 () Bool)

(assert (=> bs!6232 m!127663))

(assert (=> b!81232 d!25474))

(declare-fun b!81475 () Bool)

(declare-fun res!67344 () Bool)

(declare-fun lt!129693 () (_ BitVec 32))

(assert (=> b!81475 (= res!67344 (= lt!129693 #b00000000000000000000000000000000))))

(declare-fun e!53555 () Bool)

(assert (=> b!81475 (=> res!67344 e!53555)))

(declare-fun e!53558 () Bool)

(assert (=> b!81475 (= e!53558 e!53555)))

(declare-fun b!81476 () Bool)

(declare-fun e!53557 () Bool)

(declare-fun call!1128 () Bool)

(assert (=> b!81476 (= e!53557 call!1128)))

(declare-fun b!81477 () Bool)

(declare-fun e!53556 () Bool)

(declare-fun e!53559 () Bool)

(assert (=> b!81477 (= e!53556 e!53559)))

(declare-fun res!67342 () Bool)

(assert (=> b!81477 (=> (not res!67342) (not e!53559))))

(declare-fun e!53554 () Bool)

(assert (=> b!81477 (= res!67342 e!53554)))

(declare-fun res!67343 () Bool)

(assert (=> b!81477 (=> res!67343 e!53554)))

(declare-fun lt!129692 () tuple4!44)

(assert (=> b!81477 (= res!67343 (bvsge (_1!3798 lt!129692) (_2!3798 lt!129692)))))

(assert (=> b!81477 (= lt!129693 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129691 () (_ BitVec 32))

(assert (=> b!81477 (= lt!129691 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81477 (= lt!129692 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!81478 () Bool)

(assert (=> b!81478 (= e!53557 e!53558)))

(declare-fun res!67346 () Bool)

(assert (=> b!81478 (= res!67346 (byteRangesEq!0 (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_3!198 lt!129692)) (select (arr!2278 (array!3598 (store (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197)))) ((_ sign_extend 24) (ite (_1!3790 lt!129190) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197) #b00000000))))) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))) (_3!198 lt!129692)) lt!129691 #b00000000000000000000000000001000))))

(assert (=> b!81478 (=> (not res!67346) (not e!53558))))

(declare-fun b!81479 () Bool)

(assert (=> b!81479 (= e!53555 call!1128)))

(declare-fun bm!1125 () Bool)

(declare-fun c!5730 () Bool)

(assert (=> bm!1125 (= call!1128 (byteRangesEq!0 (ite c!5730 (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_3!198 lt!129692)) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_4!22 lt!129692))) (ite c!5730 (select (arr!2278 (array!3598 (store (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197)))) ((_ sign_extend 24) (ite (_1!3790 lt!129190) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197) #b00000000))))) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))) (_3!198 lt!129692)) (select (arr!2278 (array!3598 (store (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197)))) ((_ sign_extend 24) (ite (_1!3790 lt!129190) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197) #b00000000))))) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))) (_4!22 lt!129692))) (ite c!5730 lt!129691 #b00000000000000000000000000000000) lt!129693))))

(declare-fun b!81481 () Bool)

(assert (=> b!81481 (= e!53559 e!53557)))

(assert (=> b!81481 (= c!5730 (= (_3!198 lt!129692) (_4!22 lt!129692)))))

(declare-fun b!81480 () Bool)

(assert (=> b!81480 (= e!53554 (arrayRangesEq!23 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!3598 (store (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197)))) ((_ sign_extend 24) (ite (_1!3790 lt!129190) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197) #b00000000))))) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) (_1!3798 lt!129692) (_2!3798 lt!129692)))))

(declare-fun d!25478 () Bool)

(declare-fun res!67345 () Bool)

(assert (=> d!25478 (=> res!67345 e!53556)))

(assert (=> d!25478 (= res!67345 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!25478 (= (arrayBitRangesEq!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!3598 (store (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129196)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197)))) ((_ sign_extend 24) (ite (_1!3790 lt!129190) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129197) #b00000000))))) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) e!53556)))

(assert (= (and d!25478 (not res!67345)) b!81477))

(assert (= (and b!81477 (not res!67343)) b!81480))

(assert (= (and b!81477 res!67342) b!81481))

(assert (= (and b!81481 c!5730) b!81476))

(assert (= (and b!81481 (not c!5730)) b!81478))

(assert (= (and b!81478 res!67346) b!81475))

(assert (= (and b!81475 (not res!67344)) b!81479))

(assert (= (or b!81476 b!81479) bm!1125))

(declare-fun m!127667 () Bool)

(assert (=> b!81477 m!127667))

(declare-fun m!127669 () Bool)

(assert (=> b!81478 m!127669))

(declare-fun m!127671 () Bool)

(assert (=> b!81478 m!127671))

(assert (=> b!81478 m!127669))

(assert (=> b!81478 m!127671))

(declare-fun m!127673 () Bool)

(assert (=> b!81478 m!127673))

(declare-fun m!127675 () Bool)

(assert (=> bm!1125 m!127675))

(assert (=> bm!1125 m!127671))

(declare-fun m!127677 () Bool)

(assert (=> bm!1125 m!127677))

(declare-fun m!127679 () Bool)

(assert (=> bm!1125 m!127679))

(assert (=> bm!1125 m!127669))

(declare-fun m!127681 () Bool)

(assert (=> b!81480 m!127681))

(assert (=> b!81232 d!25478))

(declare-fun d!25482 () Bool)

(assert (=> d!25482 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3790 lt!129190)))) ((_ sign_extend 32) (currentByte!3962 (_2!3790 lt!129190))) ((_ sign_extend 32) (currentBit!3957 (_2!3790 lt!129190))) (bvsub lt!129195 lt!129186)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3790 lt!129190)))) ((_ sign_extend 32) (currentByte!3962 (_2!3790 lt!129190))) ((_ sign_extend 32) (currentBit!3957 (_2!3790 lt!129190)))) (bvsub lt!129195 lt!129186)))))

(declare-fun bs!6233 () Bool)

(assert (= bs!6233 d!25482))

(declare-fun m!127683 () Bool)

(assert (=> bs!6233 m!127683))

(assert (=> b!81232 d!25482))

(declare-fun d!25484 () Bool)

(declare-fun e!53564 () Bool)

(assert (=> d!25484 e!53564))

(declare-fun res!67351 () Bool)

(assert (=> d!25484 (=> (not res!67351) (not e!53564))))

(assert (=> d!25484 (= res!67351 (or (= (bvand lt!129195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129186 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129195 lt!129186) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!129704 () Unit!5418)

(declare-fun choose!27 (BitStream!2874 BitStream!2874 (_ BitVec 64) (_ BitVec 64)) Unit!5418)

(assert (=> d!25484 (= lt!129704 (choose!27 thiss!1716 (_2!3790 lt!129190) lt!129195 lt!129186))))

(assert (=> d!25484 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129186) (bvsle lt!129186 lt!129195))))

(assert (=> d!25484 (= (validateOffsetBitsIneqLemma!0 thiss!1716 (_2!3790 lt!129190) lt!129195 lt!129186) lt!129704)))

(declare-fun b!81487 () Bool)

(assert (=> b!81487 (= e!53564 (validate_offset_bits!1 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3790 lt!129190)))) ((_ sign_extend 32) (currentByte!3962 (_2!3790 lt!129190))) ((_ sign_extend 32) (currentBit!3957 (_2!3790 lt!129190))) (bvsub lt!129195 lt!129186)))))

(assert (= (and d!25484 res!67351) b!81487))

(declare-fun m!127685 () Bool)

(assert (=> d!25484 m!127685))

(assert (=> b!81487 m!127113))

(assert (=> b!81232 d!25484))

(declare-fun d!25486 () Bool)

(declare-fun e!53574 () Bool)

(assert (=> d!25486 e!53574))

(declare-fun res!67357 () Bool)

(assert (=> d!25486 (=> (not res!67357) (not e!53574))))

(declare-fun lt!129733 () (_ BitVec 32))

(assert (=> d!25486 (= res!67357 (and (bvsge lt!129733 #b00000000000000000000000000000000) (bvslt lt!129733 (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))))

(declare-fun lt!129734 () (_ BitVec 8))

(declare-fun lt!129732 () Unit!5418)

(declare-fun lt!129731 () (_ BitVec 32))

(declare-fun choose!53 (array!3597 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!5418)

(assert (=> d!25486 (= lt!129732 (choose!53 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3790 lt!129190) lt!129733 lt!129731 lt!129734))))

(assert (=> d!25486 (= lt!129734 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129733)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129731)))) ((_ sign_extend 24) (ite (_1!3790 lt!129190) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129731) #b00000000)))))))

(assert (=> d!25486 (= lt!129731 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!25486 (= lt!129733 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!25486 (= (arrayBitRangesUpdatedAtLemma!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3790 lt!129190)) lt!129732)))

(declare-fun b!81494 () Bool)

(assert (=> b!81494 (= e!53574 (arrayBitRangesEq!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!3598 (store (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!129733 lt!129734) (size!1656 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!25486 res!67357) b!81494))

(declare-fun m!127697 () Bool)

(assert (=> d!25486 m!127697))

(declare-fun m!127699 () Bool)

(assert (=> d!25486 m!127699))

(declare-fun m!127701 () Bool)

(assert (=> d!25486 m!127701))

(declare-fun m!127703 () Bool)

(assert (=> b!81494 m!127703))

(declare-fun m!127705 () Bool)

(assert (=> b!81494 m!127705))

(assert (=> b!81232 d!25486))

(declare-fun d!25488 () Bool)

(declare-fun e!53575 () Bool)

(assert (=> d!25488 e!53575))

(declare-fun res!67359 () Bool)

(assert (=> d!25488 (=> (not res!67359) (not e!53575))))

(declare-fun lt!129737 () (_ BitVec 64))

(declare-fun lt!129738 () (_ BitVec 64))

(declare-fun lt!129739 () (_ BitVec 64))

(assert (=> d!25488 (= res!67359 (= lt!129737 (bvsub lt!129738 lt!129739)))))

(assert (=> d!25488 (or (= (bvand lt!129738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129739 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129738 lt!129739) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25488 (= lt!129739 (remainingBits!0 ((_ sign_extend 32) (size!1656 (buf!2046 thiss!1716))) ((_ sign_extend 32) (currentByte!3962 thiss!1716)) ((_ sign_extend 32) (currentBit!3957 thiss!1716))))))

(declare-fun lt!129736 () (_ BitVec 64))

(declare-fun lt!129735 () (_ BitVec 64))

(assert (=> d!25488 (= lt!129738 (bvmul lt!129736 lt!129735))))

(assert (=> d!25488 (or (= lt!129736 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!129735 (bvsdiv (bvmul lt!129736 lt!129735) lt!129736)))))

(assert (=> d!25488 (= lt!129735 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25488 (= lt!129736 ((_ sign_extend 32) (size!1656 (buf!2046 thiss!1716))))))

(assert (=> d!25488 (= lt!129737 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3962 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3957 thiss!1716))))))

(assert (=> d!25488 (invariant!0 (currentBit!3957 thiss!1716) (currentByte!3962 thiss!1716) (size!1656 (buf!2046 thiss!1716)))))

(assert (=> d!25488 (= (bitIndex!0 (size!1656 (buf!2046 thiss!1716)) (currentByte!3962 thiss!1716) (currentBit!3957 thiss!1716)) lt!129737)))

(declare-fun b!81495 () Bool)

(declare-fun res!67358 () Bool)

(assert (=> b!81495 (=> (not res!67358) (not e!53575))))

(assert (=> b!81495 (= res!67358 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129737))))

(declare-fun b!81496 () Bool)

(declare-fun lt!129740 () (_ BitVec 64))

(assert (=> b!81496 (= e!53575 (bvsle lt!129737 (bvmul lt!129740 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81496 (or (= lt!129740 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!129740 #b0000000000000000000000000000000000000000000000000000000000001000) lt!129740)))))

(assert (=> b!81496 (= lt!129740 ((_ sign_extend 32) (size!1656 (buf!2046 thiss!1716))))))

(assert (= (and d!25488 res!67359) b!81495))

(assert (= (and b!81495 res!67358) b!81496))

(assert (=> d!25488 m!127167))

(assert (=> d!25488 m!127169))

(assert (=> b!81232 d!25488))

(declare-fun d!25490 () Bool)

(declare-fun e!53576 () Bool)

(assert (=> d!25490 e!53576))

(declare-fun res!67361 () Bool)

(assert (=> d!25490 (=> (not res!67361) (not e!53576))))

(declare-fun lt!129745 () (_ BitVec 64))

(declare-fun lt!129744 () (_ BitVec 64))

(declare-fun lt!129743 () (_ BitVec 64))

(assert (=> d!25490 (= res!67361 (= lt!129743 (bvsub lt!129744 lt!129745)))))

(assert (=> d!25490 (or (= (bvand lt!129744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!129745 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!129744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!129744 lt!129745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25490 (= lt!129745 (remainingBits!0 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3788 lt!129205)))) ((_ sign_extend 32) (currentByte!3962 (_2!3788 lt!129205))) ((_ sign_extend 32) (currentBit!3957 (_2!3788 lt!129205)))))))

(declare-fun lt!129742 () (_ BitVec 64))

(declare-fun lt!129741 () (_ BitVec 64))

(assert (=> d!25490 (= lt!129744 (bvmul lt!129742 lt!129741))))

(assert (=> d!25490 (or (= lt!129742 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!129741 (bvsdiv (bvmul lt!129742 lt!129741) lt!129742)))))

(assert (=> d!25490 (= lt!129741 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25490 (= lt!129742 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3788 lt!129205)))))))

(assert (=> d!25490 (= lt!129743 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3962 (_2!3788 lt!129205))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3957 (_2!3788 lt!129205)))))))

(assert (=> d!25490 (invariant!0 (currentBit!3957 (_2!3788 lt!129205)) (currentByte!3962 (_2!3788 lt!129205)) (size!1656 (buf!2046 (_2!3788 lt!129205))))))

(assert (=> d!25490 (= (bitIndex!0 (size!1656 (buf!2046 (_2!3788 lt!129205))) (currentByte!3962 (_2!3788 lt!129205)) (currentBit!3957 (_2!3788 lt!129205))) lt!129743)))

(declare-fun b!81497 () Bool)

(declare-fun res!67360 () Bool)

(assert (=> b!81497 (=> (not res!67360) (not e!53576))))

(assert (=> b!81497 (= res!67360 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!129743))))

(declare-fun b!81498 () Bool)

(declare-fun lt!129746 () (_ BitVec 64))

(assert (=> b!81498 (= e!53576 (bvsle lt!129743 (bvmul lt!129746 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81498 (or (= lt!129746 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!129746 #b0000000000000000000000000000000000000000000000000000000000001000) lt!129746)))))

(assert (=> b!81498 (= lt!129746 ((_ sign_extend 32) (size!1656 (buf!2046 (_2!3788 lt!129205)))))))

(assert (= (and d!25490 res!67361) b!81497))

(assert (= (and b!81497 res!67360) b!81498))

(declare-fun m!127707 () Bool)

(assert (=> d!25490 m!127707))

(assert (=> d!25490 m!127163))

(assert (=> d!25350 d!25490))

(assert (=> d!25350 d!25488))

(declare-fun b!81499 () Bool)

(declare-fun res!67364 () Bool)

(declare-fun lt!129749 () (_ BitVec 32))

(assert (=> b!81499 (= res!67364 (= lt!129749 #b00000000000000000000000000000000))))

(declare-fun e!53578 () Bool)

(assert (=> b!81499 (=> res!67364 e!53578)))

(declare-fun e!53581 () Bool)

(assert (=> b!81499 (= e!53581 e!53578)))

(declare-fun b!81500 () Bool)

(declare-fun e!53580 () Bool)

(declare-fun call!1129 () Bool)

(assert (=> b!81500 (= e!53580 call!1129)))

(declare-fun b!81501 () Bool)

(declare-fun e!53579 () Bool)

(declare-fun e!53582 () Bool)

(assert (=> b!81501 (= e!53579 e!53582)))

(declare-fun res!67362 () Bool)

(assert (=> b!81501 (=> (not res!67362) (not e!53582))))

(declare-fun e!53577 () Bool)

(assert (=> b!81501 (= res!67362 e!53577)))

(declare-fun res!67363 () Bool)

(assert (=> b!81501 (=> res!67363 e!53577)))

(declare-fun lt!129748 () tuple4!44)

(assert (=> b!81501 (= res!67363 (bvsge (_1!3798 lt!129748) (_2!3798 lt!129748)))))

(assert (=> b!81501 (= lt!129749 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129747 () (_ BitVec 32))

(assert (=> b!81501 (= lt!129747 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81501 (= lt!129748 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!81502 () Bool)

(assert (=> b!81502 (= e!53580 e!53581)))

(declare-fun res!67366 () Bool)

(assert (=> b!81502 (= res!67366 (byteRangesEq!0 (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_3!198 lt!129748)) (select (arr!2278 (_3!195 lt!129205)) (_3!198 lt!129748)) lt!129747 #b00000000000000000000000000001000))))

(assert (=> b!81502 (=> (not res!67366) (not e!53581))))

(declare-fun b!81503 () Bool)

(assert (=> b!81503 (= e!53578 call!1129)))

(declare-fun c!5731 () Bool)

(declare-fun bm!1126 () Bool)

(assert (=> bm!1126 (= call!1129 (byteRangesEq!0 (ite c!5731 (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_3!198 lt!129748)) (select (arr!2278 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (_4!22 lt!129748))) (ite c!5731 (select (arr!2278 (_3!195 lt!129205)) (_3!198 lt!129748)) (select (arr!2278 (_3!195 lt!129205)) (_4!22 lt!129748))) (ite c!5731 lt!129747 #b00000000000000000000000000000000) lt!129749))))

(declare-fun b!81505 () Bool)

(assert (=> b!81505 (= e!53582 e!53580)))

(assert (=> b!81505 (= c!5731 (= (_3!198 lt!129748) (_4!22 lt!129748)))))

(declare-fun b!81504 () Bool)

(assert (=> b!81504 (= e!53577 (arrayRangesEq!23 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!195 lt!129205) (_1!3798 lt!129748) (_2!3798 lt!129748)))))

(declare-fun d!25492 () Bool)

(declare-fun res!67365 () Bool)

(assert (=> d!25492 (=> res!67365 e!53579)))

(assert (=> d!25492 (= res!67365 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!25492 (= (arrayBitRangesEq!0 (array!3598 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!195 lt!129205) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) e!53579)))

(assert (= (and d!25492 (not res!67365)) b!81501))

(assert (= (and b!81501 (not res!67363)) b!81504))

(assert (= (and b!81501 res!67362) b!81505))

(assert (= (and b!81505 c!5731) b!81500))

(assert (= (and b!81505 (not c!5731)) b!81502))

(assert (= (and b!81502 res!67366) b!81499))

(assert (= (and b!81499 (not res!67364)) b!81503))

(assert (= (or b!81500 b!81503) bm!1126))

(assert (=> b!81501 m!127667))

(declare-fun m!127709 () Bool)

(assert (=> b!81502 m!127709))

(declare-fun m!127711 () Bool)

(assert (=> b!81502 m!127711))

(assert (=> b!81502 m!127709))

(assert (=> b!81502 m!127711))

(declare-fun m!127713 () Bool)

(assert (=> b!81502 m!127713))

(declare-fun m!127715 () Bool)

(assert (=> bm!1126 m!127715))

(assert (=> bm!1126 m!127711))

(declare-fun m!127717 () Bool)

(assert (=> bm!1126 m!127717))

(declare-fun m!127719 () Bool)

(assert (=> bm!1126 m!127719))

(assert (=> bm!1126 m!127709))

(declare-fun m!127721 () Bool)

(assert (=> b!81504 m!127721))

(assert (=> b!81233 d!25492))

(declare-fun d!25494 () Bool)

(declare-fun c!5735 () Bool)

(assert (=> d!25494 (= c!5735 (= (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!53590 () List!809)

(assert (=> d!25494 (= (byteArrayBitContentToList!0 (_2!3788 lt!129205) (_3!195 lt!129205) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) e!53590)))

(declare-fun b!81520 () Bool)

(assert (=> b!81520 (= e!53590 Nil!806)))

(declare-fun b!81521 () Bool)

(assert (=> b!81521 (= e!53590 (Cons!805 (not (= (bvand ((_ sign_extend 24) (select (arr!2278 (_3!195 lt!129205)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3788 lt!129205) (_3!195 lt!129205) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!25494 c!5735) b!81520))

(assert (= (and d!25494 (not c!5735)) b!81521))

(assert (=> b!81521 m!127379))

(assert (=> b!81521 m!127381))

(declare-fun m!127739 () Bool)

(assert (=> b!81521 m!127739))

(assert (=> b!81237 d!25494))

(declare-datatypes ((tuple2!7206 0))(
  ( (tuple2!7207 (_1!3803 List!809) (_2!3803 BitStream!2874)) )
))
(declare-fun e!53595 () tuple2!7206)

(declare-fun lt!129802 () tuple2!7186)

(declare-fun lt!129803 () (_ BitVec 64))

(declare-fun b!81531 () Bool)

(assert (=> b!81531 (= e!53595 (tuple2!7207 (Cons!805 (_1!3790 lt!129802) (bitStreamReadBitsIntoList!0 (_2!3788 lt!129205) (_2!3790 lt!129802) (bvsub (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) lt!129803))) (_2!3790 lt!129802)))))

(assert (=> b!81531 (= lt!129802 (readBit!0 thiss!1716))))

(assert (=> b!81531 (= lt!129803 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!81530 () Bool)

(assert (=> b!81530 (= e!53595 (tuple2!7207 Nil!806 thiss!1716))))

(declare-fun d!25502 () Bool)

(declare-fun e!53596 () Bool)

(assert (=> d!25502 e!53596))

(declare-fun c!5741 () Bool)

(assert (=> d!25502 (= c!5741 (= (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129804 () List!809)

(assert (=> d!25502 (= lt!129804 (_1!3803 e!53595))))

(declare-fun c!5740 () Bool)

(assert (=> d!25502 (= c!5740 (= (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!25502 (bvsge (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!25502 (= (bitStreamReadBitsIntoList!0 (_2!3788 lt!129205) thiss!1716 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) lt!129804)))

(declare-fun b!81532 () Bool)

(declare-fun isEmpty!242 (List!809) Bool)

(assert (=> b!81532 (= e!53596 (isEmpty!242 lt!129804))))

(declare-fun b!81533 () Bool)

(declare-fun length!401 (List!809) Int)

(assert (=> b!81533 (= e!53596 (> (length!401 lt!129804) 0))))

(assert (= (and d!25502 c!5740) b!81530))

(assert (= (and d!25502 (not c!5740)) b!81531))

(assert (= (and d!25502 c!5741) b!81532))

(assert (= (and d!25502 (not c!5741)) b!81533))

(declare-fun m!127799 () Bool)

(assert (=> b!81531 m!127799))

(assert (=> b!81531 m!127129))

(declare-fun m!127801 () Bool)

(assert (=> b!81532 m!127801))

(declare-fun m!127803 () Bool)

(assert (=> b!81533 m!127803))

(assert (=> b!81237 d!25502))

(declare-fun d!25506 () Bool)

(assert (=> d!25506 (= (remainingBits!0 ((_ sign_extend 32) (size!1656 (buf!2046 thiss!1716))) ((_ sign_extend 32) (currentByte!3962 thiss!1716)) ((_ sign_extend 32) (currentBit!3957 thiss!1716))) (bvsub (bvmul ((_ sign_extend 32) (size!1656 (buf!2046 thiss!1716))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3962 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3957 thiss!1716)))))))

(assert (=> d!25368 d!25506))

(check-sat (not b!81439) (not d!25490) (not b!81502) (not b!81361) (not b!81478) (not bm!1125) (not b!81521) (not b!81371) (not b!81368) (not b!81369) (not b!81435) (not d!25414) (not b!81531) (not d!25482) (not d!25474) (not b!81532) (not b!81293) (not d!25382) (not b!81467) (not d!25448) (not d!25484) (not d!25486) (not b!81504) (not bm!1113) (not b!81533) (not b!81437) (not b!81434) (not b!81477) (not b!81364) (not d!25440) (not bm!1112) (not d!25380) (not d!25488) (not bm!1126) (not b!81362) (not d!25432) (not b!81431) (not b!81494) (not d!25418) (not bm!1121) (not b!81438) (not b!81480) (not b!81487) (not bm!1120) (not b!81501))
(check-sat)
