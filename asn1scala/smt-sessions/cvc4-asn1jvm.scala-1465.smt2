; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40206 () Bool)

(assert start!40206)

(declare-fun b!184179 () Bool)

(declare-fun e!127601 () Bool)

(declare-datatypes ((array!9774 0))(
  ( (array!9775 (arr!5241 (Array (_ BitVec 32) (_ BitVec 8))) (size!4311 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7730 0))(
  ( (BitStream!7731 (buf!4766 array!9774) (currentByte!9000 (_ BitVec 32)) (currentBit!8995 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7730)

(declare-fun array_inv!4052 (array!9774) Bool)

(assert (=> b!184179 (= e!127601 (array_inv!4052 (buf!4766 thiss!1204)))))

(declare-fun b!184180 () Bool)

(declare-fun res!153215 () Bool)

(declare-fun e!127598 () Bool)

(assert (=> b!184180 (=> res!153215 e!127598)))

(declare-fun lt!283252 () (_ BitVec 64))

(assert (=> b!184180 (= res!153215 (not (= (bvand lt!283252 #b1111111111111111111111111111111111111111111111111111111111111111) lt!283252)))))

(declare-fun b!184181 () Bool)

(declare-fun e!127605 () Bool)

(declare-fun e!127606 () Bool)

(assert (=> b!184181 (= e!127605 e!127606)))

(declare-fun res!153209 () Bool)

(assert (=> b!184181 (=> res!153209 e!127606)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!283260 () (_ BitVec 64))

(declare-fun lt!283243 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!184181 (= res!153209 (not (= lt!283260 (bvsub (bvsub (bvadd lt!283243 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!13197 0))(
  ( (Unit!13198) )
))
(declare-datatypes ((tuple2!15924 0))(
  ( (tuple2!15925 (_1!8607 Unit!13197) (_2!8607 BitStream!7730)) )
))
(declare-fun lt!283245 () tuple2!15924)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184181 (= lt!283260 (bitIndex!0 (size!4311 (buf!4766 (_2!8607 lt!283245))) (currentByte!9000 (_2!8607 lt!283245)) (currentBit!8995 (_2!8607 lt!283245))))))

(declare-fun isPrefixOf!0 (BitStream!7730 BitStream!7730) Bool)

(assert (=> b!184181 (isPrefixOf!0 thiss!1204 (_2!8607 lt!283245))))

(declare-fun lt!283254 () Unit!13197)

(declare-fun lt!283267 () tuple2!15924)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7730 BitStream!7730 BitStream!7730) Unit!13197)

(assert (=> b!184181 (= lt!283254 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8607 lt!283267) (_2!8607 lt!283245)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7730 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15924)

(assert (=> b!184181 (= lt!283245 (appendBitsLSBFirstLoopTR!0 (_2!8607 lt!283267) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184182 () Bool)

(declare-fun res!153220 () Bool)

(declare-fun e!127604 () Bool)

(assert (=> b!184182 (=> (not res!153220) (not e!127604))))

(assert (=> b!184182 (= res!153220 (not (= i!590 nBits!348)))))

(declare-fun b!184183 () Bool)

(declare-fun res!153217 () Bool)

(declare-fun e!127599 () Bool)

(assert (=> b!184183 (=> (not res!153217) (not e!127599))))

(assert (=> b!184183 (= res!153217 (isPrefixOf!0 thiss!1204 (_2!8607 lt!283267)))))

(declare-fun b!184184 () Bool)

(declare-fun res!153218 () Bool)

(assert (=> b!184184 (=> res!153218 e!127598)))

(declare-datatypes ((tuple2!15926 0))(
  ( (tuple2!15927 (_1!8608 BitStream!7730) (_2!8608 BitStream!7730)) )
))
(declare-fun lt!283262 () tuple2!15926)

(declare-fun lt!283249 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184184 (= res!153218 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4311 (buf!4766 (_1!8608 lt!283262)))) ((_ sign_extend 32) (currentByte!9000 (_1!8608 lt!283262))) ((_ sign_extend 32) (currentBit!8995 (_1!8608 lt!283262))) lt!283249)))))

(declare-fun b!184185 () Bool)

(declare-fun e!127600 () Bool)

(declare-datatypes ((tuple2!15928 0))(
  ( (tuple2!15929 (_1!8609 BitStream!7730) (_2!8609 Bool)) )
))
(declare-fun lt!283266 () tuple2!15928)

(declare-fun lt!283248 () tuple2!15928)

(assert (=> b!184185 (= e!127600 (= (_2!8609 lt!283266) (_2!8609 lt!283248)))))

(declare-fun b!184186 () Bool)

(declare-fun e!127602 () Bool)

(declare-fun lt!283251 () tuple2!15928)

(declare-fun lt!283263 () (_ BitVec 64))

(assert (=> b!184186 (= e!127602 (= (bitIndex!0 (size!4311 (buf!4766 (_1!8609 lt!283251))) (currentByte!9000 (_1!8609 lt!283251)) (currentBit!8995 (_1!8609 lt!283251))) lt!283263))))

(declare-fun b!184187 () Bool)

(declare-fun res!153214 () Bool)

(assert (=> b!184187 (=> res!153214 e!127606)))

(assert (=> b!184187 (= res!153214 (not (isPrefixOf!0 thiss!1204 (_2!8607 lt!283267))))))

(declare-fun b!184188 () Bool)

(declare-fun res!153211 () Bool)

(assert (=> b!184188 (=> res!153211 e!127598)))

(assert (=> b!184188 (= res!153211 (bvsge i!590 nBits!348))))

(declare-fun res!153213 () Bool)

(declare-fun e!127603 () Bool)

(assert (=> start!40206 (=> (not res!153213) (not e!127603))))

(assert (=> start!40206 (= res!153213 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40206 e!127603))

(assert (=> start!40206 true))

(declare-fun inv!12 (BitStream!7730) Bool)

(assert (=> start!40206 (and (inv!12 thiss!1204) e!127601)))

(declare-fun b!184189 () Bool)

(assert (=> b!184189 (= e!127606 e!127598)))

(declare-fun res!153204 () Bool)

(assert (=> b!184189 (=> res!153204 e!127598)))

(declare-fun lt!283253 () tuple2!15926)

(declare-fun lt!283257 () (_ BitVec 64))

(declare-datatypes ((tuple2!15930 0))(
  ( (tuple2!15931 (_1!8610 BitStream!7730) (_2!8610 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15930)

(assert (=> b!184189 (= res!153204 (not (= (_1!8610 (readNBitsLSBFirstsLoopPure!0 (_1!8608 lt!283253) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283257)) (_2!8608 lt!283253))))))

(declare-fun lt!283250 () (_ BitVec 64))

(assert (=> b!184189 (validate_offset_bits!1 ((_ sign_extend 32) (size!4311 (buf!4766 (_2!8607 lt!283245)))) ((_ sign_extend 32) (currentByte!9000 (_2!8607 lt!283267))) ((_ sign_extend 32) (currentBit!8995 (_2!8607 lt!283267))) lt!283250)))

(declare-fun lt!283268 () Unit!13197)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7730 array!9774 (_ BitVec 64)) Unit!13197)

(assert (=> b!184189 (= lt!283268 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8607 lt!283267) (buf!4766 (_2!8607 lt!283245)) lt!283250))))

(assert (=> b!184189 (= lt!283250 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283258 () tuple2!15928)

(declare-fun lt!283244 () (_ BitVec 64))

(assert (=> b!184189 (= lt!283257 (bvor lt!283252 (ite (_2!8609 lt!283258) lt!283244 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!283264 () tuple2!15930)

(assert (=> b!184189 (= lt!283264 (readNBitsLSBFirstsLoopPure!0 (_1!8608 lt!283262) nBits!348 i!590 lt!283252))))

(assert (=> b!184189 (validate_offset_bits!1 ((_ sign_extend 32) (size!4311 (buf!4766 (_2!8607 lt!283245)))) ((_ sign_extend 32) (currentByte!9000 thiss!1204)) ((_ sign_extend 32) (currentBit!8995 thiss!1204)) lt!283249)))

(declare-fun lt!283261 () Unit!13197)

(assert (=> b!184189 (= lt!283261 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4766 (_2!8607 lt!283245)) lt!283249))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184189 (= lt!283252 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!283246 () Bool)

(assert (=> b!184189 (= (_2!8609 lt!283258) lt!283246)))

(declare-fun readBitPure!0 (BitStream!7730) tuple2!15928)

(assert (=> b!184189 (= lt!283258 (readBitPure!0 (_1!8608 lt!283262)))))

(declare-fun reader!0 (BitStream!7730 BitStream!7730) tuple2!15926)

(assert (=> b!184189 (= lt!283253 (reader!0 (_2!8607 lt!283267) (_2!8607 lt!283245)))))

(assert (=> b!184189 (= lt!283262 (reader!0 thiss!1204 (_2!8607 lt!283245)))))

(assert (=> b!184189 e!127600))

(declare-fun res!153208 () Bool)

(assert (=> b!184189 (=> (not res!153208) (not e!127600))))

(assert (=> b!184189 (= res!153208 (= (bitIndex!0 (size!4311 (buf!4766 (_1!8609 lt!283266))) (currentByte!9000 (_1!8609 lt!283266)) (currentBit!8995 (_1!8609 lt!283266))) (bitIndex!0 (size!4311 (buf!4766 (_1!8609 lt!283248))) (currentByte!9000 (_1!8609 lt!283248)) (currentBit!8995 (_1!8609 lt!283248)))))))

(declare-fun lt!283265 () Unit!13197)

(declare-fun lt!283256 () BitStream!7730)

(declare-fun readBitPrefixLemma!0 (BitStream!7730 BitStream!7730) Unit!13197)

(assert (=> b!184189 (= lt!283265 (readBitPrefixLemma!0 lt!283256 (_2!8607 lt!283245)))))

(assert (=> b!184189 (= lt!283248 (readBitPure!0 (BitStream!7731 (buf!4766 (_2!8607 lt!283245)) (currentByte!9000 thiss!1204) (currentBit!8995 thiss!1204))))))

(assert (=> b!184189 (= lt!283266 (readBitPure!0 lt!283256))))

(declare-fun e!127596 () Bool)

(assert (=> b!184189 e!127596))

(declare-fun res!153210 () Bool)

(assert (=> b!184189 (=> (not res!153210) (not e!127596))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184189 (= res!153210 (invariant!0 (currentBit!8995 thiss!1204) (currentByte!9000 thiss!1204) (size!4311 (buf!4766 (_2!8607 lt!283267)))))))

(assert (=> b!184189 (= lt!283256 (BitStream!7731 (buf!4766 (_2!8607 lt!283267)) (currentByte!9000 thiss!1204) (currentBit!8995 thiss!1204)))))

(declare-fun b!184190 () Bool)

(assert (=> b!184190 (= e!127604 (not e!127605))))

(declare-fun res!153212 () Bool)

(assert (=> b!184190 (=> res!153212 e!127605)))

(declare-fun lt!283247 () (_ BitVec 64))

(assert (=> b!184190 (= res!153212 (not (= lt!283243 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283247))))))

(assert (=> b!184190 (= lt!283243 (bitIndex!0 (size!4311 (buf!4766 (_2!8607 lt!283267))) (currentByte!9000 (_2!8607 lt!283267)) (currentBit!8995 (_2!8607 lt!283267))))))

(assert (=> b!184190 (= lt!283247 (bitIndex!0 (size!4311 (buf!4766 thiss!1204)) (currentByte!9000 thiss!1204) (currentBit!8995 thiss!1204)))))

(declare-fun e!127597 () Bool)

(assert (=> b!184190 e!127597))

(declare-fun res!153216 () Bool)

(assert (=> b!184190 (=> (not res!153216) (not e!127597))))

(assert (=> b!184190 (= res!153216 (= (size!4311 (buf!4766 thiss!1204)) (size!4311 (buf!4766 (_2!8607 lt!283267)))))))

(declare-fun appendBit!0 (BitStream!7730 Bool) tuple2!15924)

(assert (=> b!184190 (= lt!283267 (appendBit!0 thiss!1204 lt!283246))))

(assert (=> b!184190 (= lt!283246 (not (= (bvand v!189 lt!283244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184190 (= lt!283244 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184191 () Bool)

(assert (=> b!184191 (= e!127597 e!127599)))

(declare-fun res!153221 () Bool)

(assert (=> b!184191 (=> (not res!153221) (not e!127599))))

(declare-fun lt!283255 () (_ BitVec 64))

(assert (=> b!184191 (= res!153221 (= lt!283263 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283255)))))

(assert (=> b!184191 (= lt!283263 (bitIndex!0 (size!4311 (buf!4766 (_2!8607 lt!283267))) (currentByte!9000 (_2!8607 lt!283267)) (currentBit!8995 (_2!8607 lt!283267))))))

(assert (=> b!184191 (= lt!283255 (bitIndex!0 (size!4311 (buf!4766 thiss!1204)) (currentByte!9000 thiss!1204) (currentBit!8995 thiss!1204)))))

(declare-fun b!184192 () Bool)

(declare-fun res!153222 () Bool)

(assert (=> b!184192 (=> res!153222 e!127606)))

(assert (=> b!184192 (= res!153222 (or (not (= (size!4311 (buf!4766 (_2!8607 lt!283245))) (size!4311 (buf!4766 thiss!1204)))) (not (= lt!283260 (bvsub (bvadd lt!283247 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184193 () Bool)

(declare-fun res!153202 () Bool)

(assert (=> b!184193 (=> res!153202 e!127598)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184193 (= res!153202 (not (= (bvand lt!283252 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184194 () Bool)

(assert (=> b!184194 (= e!127596 (invariant!0 (currentBit!8995 thiss!1204) (currentByte!9000 thiss!1204) (size!4311 (buf!4766 (_2!8607 lt!283245)))))))

(declare-fun b!184195 () Bool)

(assert (=> b!184195 (= e!127603 e!127604)))

(declare-fun res!153206 () Bool)

(assert (=> b!184195 (=> (not res!153206) (not e!127604))))

(assert (=> b!184195 (= res!153206 (validate_offset_bits!1 ((_ sign_extend 32) (size!4311 (buf!4766 thiss!1204))) ((_ sign_extend 32) (currentByte!9000 thiss!1204)) ((_ sign_extend 32) (currentBit!8995 thiss!1204)) lt!283249))))

(assert (=> b!184195 (= lt!283249 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184196 () Bool)

(declare-fun res!153203 () Bool)

(assert (=> b!184196 (=> res!153203 e!127606)))

(assert (=> b!184196 (= res!153203 (not (invariant!0 (currentBit!8995 (_2!8607 lt!283245)) (currentByte!9000 (_2!8607 lt!283245)) (size!4311 (buf!4766 (_2!8607 lt!283245))))))))

(declare-fun b!184197 () Bool)

(assert (=> b!184197 (= e!127599 e!127602)))

(declare-fun res!153205 () Bool)

(assert (=> b!184197 (=> (not res!153205) (not e!127602))))

(assert (=> b!184197 (= res!153205 (and (= (_2!8609 lt!283251) lt!283246) (= (_1!8609 lt!283251) (_2!8607 lt!283267))))))

(declare-fun readerFrom!0 (BitStream!7730 (_ BitVec 32) (_ BitVec 32)) BitStream!7730)

(assert (=> b!184197 (= lt!283251 (readBitPure!0 (readerFrom!0 (_2!8607 lt!283267) (currentBit!8995 thiss!1204) (currentByte!9000 thiss!1204))))))

(declare-fun b!184198 () Bool)

(declare-fun res!153219 () Bool)

(assert (=> b!184198 (=> (not res!153219) (not e!127604))))

(assert (=> b!184198 (= res!153219 (invariant!0 (currentBit!8995 thiss!1204) (currentByte!9000 thiss!1204) (size!4311 (buf!4766 thiss!1204))))))

(declare-fun b!184199 () Bool)

(assert (=> b!184199 (= e!127598 true)))

(declare-fun lt!283259 () tuple2!15930)

(declare-fun withMovedBitIndex!0 (BitStream!7730 (_ BitVec 64)) BitStream!7730)

(assert (=> b!184199 (= lt!283259 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8608 lt!283262) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283257))))

(declare-fun b!184200 () Bool)

(declare-fun res!153207 () Bool)

(assert (=> b!184200 (=> res!153207 e!127606)))

(assert (=> b!184200 (= res!153207 (not (isPrefixOf!0 (_2!8607 lt!283267) (_2!8607 lt!283245))))))

(assert (= (and start!40206 res!153213) b!184195))

(assert (= (and b!184195 res!153206) b!184198))

(assert (= (and b!184198 res!153219) b!184182))

(assert (= (and b!184182 res!153220) b!184190))

(assert (= (and b!184190 res!153216) b!184191))

(assert (= (and b!184191 res!153221) b!184183))

(assert (= (and b!184183 res!153217) b!184197))

(assert (= (and b!184197 res!153205) b!184186))

(assert (= (and b!184190 (not res!153212)) b!184181))

(assert (= (and b!184181 (not res!153209)) b!184196))

(assert (= (and b!184196 (not res!153203)) b!184192))

(assert (= (and b!184192 (not res!153222)) b!184200))

(assert (= (and b!184200 (not res!153207)) b!184187))

(assert (= (and b!184187 (not res!153214)) b!184189))

(assert (= (and b!184189 res!153210) b!184194))

(assert (= (and b!184189 res!153208) b!184185))

(assert (= (and b!184189 (not res!153204)) b!184188))

(assert (= (and b!184188 (not res!153211)) b!184184))

(assert (= (and b!184184 (not res!153218)) b!184193))

(assert (= (and b!184193 (not res!153202)) b!184180))

(assert (= (and b!184180 (not res!153215)) b!184199))

(assert (= start!40206 b!184179))

(declare-fun m!286209 () Bool)

(assert (=> b!184193 m!286209))

(declare-fun m!286211 () Bool)

(assert (=> b!184181 m!286211))

(declare-fun m!286213 () Bool)

(assert (=> b!184181 m!286213))

(declare-fun m!286215 () Bool)

(assert (=> b!184181 m!286215))

(declare-fun m!286217 () Bool)

(assert (=> b!184181 m!286217))

(declare-fun m!286219 () Bool)

(assert (=> b!184195 m!286219))

(declare-fun m!286221 () Bool)

(assert (=> b!184189 m!286221))

(declare-fun m!286223 () Bool)

(assert (=> b!184189 m!286223))

(declare-fun m!286225 () Bool)

(assert (=> b!184189 m!286225))

(declare-fun m!286227 () Bool)

(assert (=> b!184189 m!286227))

(declare-fun m!286229 () Bool)

(assert (=> b!184189 m!286229))

(declare-fun m!286231 () Bool)

(assert (=> b!184189 m!286231))

(declare-fun m!286233 () Bool)

(assert (=> b!184189 m!286233))

(declare-fun m!286235 () Bool)

(assert (=> b!184189 m!286235))

(declare-fun m!286237 () Bool)

(assert (=> b!184189 m!286237))

(declare-fun m!286239 () Bool)

(assert (=> b!184189 m!286239))

(declare-fun m!286241 () Bool)

(assert (=> b!184189 m!286241))

(declare-fun m!286243 () Bool)

(assert (=> b!184189 m!286243))

(declare-fun m!286245 () Bool)

(assert (=> b!184189 m!286245))

(declare-fun m!286247 () Bool)

(assert (=> b!184189 m!286247))

(declare-fun m!286249 () Bool)

(assert (=> b!184189 m!286249))

(declare-fun m!286251 () Bool)

(assert (=> b!184189 m!286251))

(declare-fun m!286253 () Bool)

(assert (=> b!184194 m!286253))

(declare-fun m!286255 () Bool)

(assert (=> b!184186 m!286255))

(declare-fun m!286257 () Bool)

(assert (=> b!184191 m!286257))

(declare-fun m!286259 () Bool)

(assert (=> b!184191 m!286259))

(declare-fun m!286261 () Bool)

(assert (=> b!184196 m!286261))

(declare-fun m!286263 () Bool)

(assert (=> b!184187 m!286263))

(assert (=> b!184190 m!286257))

(assert (=> b!184190 m!286259))

(declare-fun m!286265 () Bool)

(assert (=> b!184190 m!286265))

(declare-fun m!286267 () Bool)

(assert (=> b!184199 m!286267))

(assert (=> b!184199 m!286267))

(declare-fun m!286269 () Bool)

(assert (=> b!184199 m!286269))

(declare-fun m!286271 () Bool)

(assert (=> b!184179 m!286271))

(assert (=> b!184183 m!286263))

(declare-fun m!286273 () Bool)

(assert (=> b!184184 m!286273))

(declare-fun m!286275 () Bool)

(assert (=> b!184197 m!286275))

(assert (=> b!184197 m!286275))

(declare-fun m!286277 () Bool)

(assert (=> b!184197 m!286277))

(declare-fun m!286279 () Bool)

(assert (=> b!184198 m!286279))

(declare-fun m!286281 () Bool)

(assert (=> b!184200 m!286281))

(declare-fun m!286283 () Bool)

(assert (=> start!40206 m!286283))

(push 1)

