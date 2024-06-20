; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40204 () Bool)

(assert start!40204)

(declare-fun b!184113 () Bool)

(declare-fun res!153143 () Bool)

(declare-fun e!127559 () Bool)

(assert (=> b!184113 (=> res!153143 e!127559)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!184113 (= res!153143 (bvsge i!590 nBits!348))))

(declare-fun b!184114 () Bool)

(declare-fun res!153146 () Bool)

(assert (=> b!184114 (=> res!153146 e!127559)))

(declare-datatypes ((array!9772 0))(
  ( (array!9773 (arr!5240 (Array (_ BitVec 32) (_ BitVec 8))) (size!4310 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7728 0))(
  ( (BitStream!7729 (buf!4765 array!9772) (currentByte!8999 (_ BitVec 32)) (currentBit!8994 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15916 0))(
  ( (tuple2!15917 (_1!8603 BitStream!7728) (_2!8603 BitStream!7728)) )
))
(declare-fun lt!283175 () tuple2!15916)

(declare-fun lt!283166 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184114 (= res!153146 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4310 (buf!4765 (_1!8603 lt!283175)))) ((_ sign_extend 32) (currentByte!8999 (_1!8603 lt!283175))) ((_ sign_extend 32) (currentBit!8994 (_1!8603 lt!283175))) lt!283166)))))

(declare-fun b!184115 () Bool)

(declare-fun e!127566 () Bool)

(declare-datatypes ((tuple2!15918 0))(
  ( (tuple2!15919 (_1!8604 BitStream!7728) (_2!8604 Bool)) )
))
(declare-fun lt!283165 () tuple2!15918)

(declare-fun lt!283188 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184115 (= e!127566 (= (bitIndex!0 (size!4310 (buf!4765 (_1!8604 lt!283165))) (currentByte!8999 (_1!8604 lt!283165)) (currentBit!8994 (_1!8604 lt!283165))) lt!283188))))

(declare-fun b!184116 () Bool)

(declare-fun e!127569 () Bool)

(declare-fun thiss!1204 () BitStream!7728)

(declare-fun array_inv!4051 (array!9772) Bool)

(assert (=> b!184116 (= e!127569 (array_inv!4051 (buf!4765 thiss!1204)))))

(declare-fun res!153141 () Bool)

(declare-fun e!127565 () Bool)

(assert (=> start!40204 (=> (not res!153141) (not e!127565))))

(assert (=> start!40204 (= res!153141 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40204 e!127565))

(assert (=> start!40204 true))

(declare-fun inv!12 (BitStream!7728) Bool)

(assert (=> start!40204 (and (inv!12 thiss!1204) e!127569)))

(declare-fun b!184117 () Bool)

(declare-fun res!153139 () Bool)

(declare-fun e!127562 () Bool)

(assert (=> b!184117 (=> (not res!153139) (not e!127562))))

(assert (=> b!184117 (= res!153139 (not (= i!590 nBits!348)))))

(declare-fun b!184118 () Bool)

(assert (=> b!184118 (= e!127559 true)))

(declare-fun lt!283182 () (_ BitVec 64))

(declare-datatypes ((tuple2!15920 0))(
  ( (tuple2!15921 (_1!8605 BitStream!7728) (_2!8605 (_ BitVec 64))) )
))
(declare-fun lt!283169 () tuple2!15920)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15920)

(declare-fun withMovedBitIndex!0 (BitStream!7728 (_ BitVec 64)) BitStream!7728)

(assert (=> b!184118 (= lt!283169 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8603 lt!283175) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283182))))

(declare-fun b!184119 () Bool)

(declare-fun e!127568 () Bool)

(declare-datatypes ((Unit!13195 0))(
  ( (Unit!13196) )
))
(declare-datatypes ((tuple2!15922 0))(
  ( (tuple2!15923 (_1!8606 Unit!13195) (_2!8606 BitStream!7728)) )
))
(declare-fun lt!283172 () tuple2!15922)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184119 (= e!127568 (invariant!0 (currentBit!8994 thiss!1204) (currentByte!8999 thiss!1204) (size!4310 (buf!4765 (_2!8606 lt!283172)))))))

(declare-fun b!184120 () Bool)

(declare-fun res!153156 () Bool)

(declare-fun e!127560 () Bool)

(assert (=> b!184120 (=> res!153156 e!127560)))

(declare-fun lt!283177 () tuple2!15922)

(declare-fun isPrefixOf!0 (BitStream!7728 BitStream!7728) Bool)

(assert (=> b!184120 (= res!153156 (not (isPrefixOf!0 (_2!8606 lt!283177) (_2!8606 lt!283172))))))

(declare-fun b!184121 () Bool)

(declare-fun res!153159 () Bool)

(assert (=> b!184121 (=> res!153159 e!127560)))

(assert (=> b!184121 (= res!153159 (not (isPrefixOf!0 thiss!1204 (_2!8606 lt!283177))))))

(declare-fun b!184122 () Bool)

(declare-fun e!127564 () Bool)

(declare-fun lt!283189 () tuple2!15918)

(declare-fun lt!283185 () tuple2!15918)

(assert (=> b!184122 (= e!127564 (= (_2!8604 lt!283189) (_2!8604 lt!283185)))))

(declare-fun b!184123 () Bool)

(declare-fun res!153154 () Bool)

(assert (=> b!184123 (=> res!153154 e!127559)))

(declare-fun lt!283181 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184123 (= res!153154 (not (= (bvand lt!283181 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184124 () Bool)

(declare-fun e!127567 () Bool)

(assert (=> b!184124 (= e!127562 (not e!127567))))

(declare-fun res!153151 () Bool)

(assert (=> b!184124 (=> res!153151 e!127567)))

(declare-fun lt!283190 () (_ BitVec 64))

(declare-fun lt!283183 () (_ BitVec 64))

(assert (=> b!184124 (= res!153151 (not (= lt!283190 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283183))))))

(assert (=> b!184124 (= lt!283190 (bitIndex!0 (size!4310 (buf!4765 (_2!8606 lt!283177))) (currentByte!8999 (_2!8606 lt!283177)) (currentBit!8994 (_2!8606 lt!283177))))))

(assert (=> b!184124 (= lt!283183 (bitIndex!0 (size!4310 (buf!4765 thiss!1204)) (currentByte!8999 thiss!1204) (currentBit!8994 thiss!1204)))))

(declare-fun e!127561 () Bool)

(assert (=> b!184124 e!127561))

(declare-fun res!153152 () Bool)

(assert (=> b!184124 (=> (not res!153152) (not e!127561))))

(assert (=> b!184124 (= res!153152 (= (size!4310 (buf!4765 thiss!1204)) (size!4310 (buf!4765 (_2!8606 lt!283177)))))))

(declare-fun lt!283179 () Bool)

(declare-fun appendBit!0 (BitStream!7728 Bool) tuple2!15922)

(assert (=> b!184124 (= lt!283177 (appendBit!0 thiss!1204 lt!283179))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!283171 () (_ BitVec 64))

(assert (=> b!184124 (= lt!283179 (not (= (bvand v!189 lt!283171) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184124 (= lt!283171 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184125 () Bool)

(declare-fun res!153155 () Bool)

(assert (=> b!184125 (=> (not res!153155) (not e!127562))))

(assert (=> b!184125 (= res!153155 (invariant!0 (currentBit!8994 thiss!1204) (currentByte!8999 thiss!1204) (size!4310 (buf!4765 thiss!1204))))))

(declare-fun b!184126 () Bool)

(declare-fun res!153148 () Bool)

(assert (=> b!184126 (=> res!153148 e!127560)))

(declare-fun lt!283174 () (_ BitVec 64))

(assert (=> b!184126 (= res!153148 (or (not (= (size!4310 (buf!4765 (_2!8606 lt!283172))) (size!4310 (buf!4765 thiss!1204)))) (not (= lt!283174 (bvsub (bvadd lt!283183 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184127 () Bool)

(declare-fun res!153157 () Bool)

(declare-fun e!127563 () Bool)

(assert (=> b!184127 (=> (not res!153157) (not e!127563))))

(assert (=> b!184127 (= res!153157 (isPrefixOf!0 thiss!1204 (_2!8606 lt!283177)))))

(declare-fun b!184128 () Bool)

(assert (=> b!184128 (= e!127565 e!127562)))

(declare-fun res!153149 () Bool)

(assert (=> b!184128 (=> (not res!153149) (not e!127562))))

(assert (=> b!184128 (= res!153149 (validate_offset_bits!1 ((_ sign_extend 32) (size!4310 (buf!4765 thiss!1204))) ((_ sign_extend 32) (currentByte!8999 thiss!1204)) ((_ sign_extend 32) (currentBit!8994 thiss!1204)) lt!283166))))

(assert (=> b!184128 (= lt!283166 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184129 () Bool)

(assert (=> b!184129 (= e!127561 e!127563)))

(declare-fun res!153144 () Bool)

(assert (=> b!184129 (=> (not res!153144) (not e!127563))))

(declare-fun lt!283168 () (_ BitVec 64))

(assert (=> b!184129 (= res!153144 (= lt!283188 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283168)))))

(assert (=> b!184129 (= lt!283188 (bitIndex!0 (size!4310 (buf!4765 (_2!8606 lt!283177))) (currentByte!8999 (_2!8606 lt!283177)) (currentBit!8994 (_2!8606 lt!283177))))))

(assert (=> b!184129 (= lt!283168 (bitIndex!0 (size!4310 (buf!4765 thiss!1204)) (currentByte!8999 thiss!1204) (currentBit!8994 thiss!1204)))))

(declare-fun b!184130 () Bool)

(assert (=> b!184130 (= e!127560 e!127559)))

(declare-fun res!153153 () Bool)

(assert (=> b!184130 (=> res!153153 e!127559)))

(declare-fun lt!283167 () tuple2!15916)

(assert (=> b!184130 (= res!153153 (not (= (_1!8605 (readNBitsLSBFirstsLoopPure!0 (_1!8603 lt!283167) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283182)) (_2!8603 lt!283167))))))

(declare-fun lt!283184 () (_ BitVec 64))

(assert (=> b!184130 (validate_offset_bits!1 ((_ sign_extend 32) (size!4310 (buf!4765 (_2!8606 lt!283172)))) ((_ sign_extend 32) (currentByte!8999 (_2!8606 lt!283177))) ((_ sign_extend 32) (currentBit!8994 (_2!8606 lt!283177))) lt!283184)))

(declare-fun lt!283180 () Unit!13195)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7728 array!9772 (_ BitVec 64)) Unit!13195)

(assert (=> b!184130 (= lt!283180 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8606 lt!283177) (buf!4765 (_2!8606 lt!283172)) lt!283184))))

(assert (=> b!184130 (= lt!283184 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283173 () tuple2!15918)

(assert (=> b!184130 (= lt!283182 (bvor lt!283181 (ite (_2!8604 lt!283173) lt!283171 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!283170 () tuple2!15920)

(assert (=> b!184130 (= lt!283170 (readNBitsLSBFirstsLoopPure!0 (_1!8603 lt!283175) nBits!348 i!590 lt!283181))))

(assert (=> b!184130 (validate_offset_bits!1 ((_ sign_extend 32) (size!4310 (buf!4765 (_2!8606 lt!283172)))) ((_ sign_extend 32) (currentByte!8999 thiss!1204)) ((_ sign_extend 32) (currentBit!8994 thiss!1204)) lt!283166)))

(declare-fun lt!283178 () Unit!13195)

(assert (=> b!184130 (= lt!283178 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4765 (_2!8606 lt!283172)) lt!283166))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184130 (= lt!283181 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!184130 (= (_2!8604 lt!283173) lt!283179)))

(declare-fun readBitPure!0 (BitStream!7728) tuple2!15918)

(assert (=> b!184130 (= lt!283173 (readBitPure!0 (_1!8603 lt!283175)))))

(declare-fun reader!0 (BitStream!7728 BitStream!7728) tuple2!15916)

(assert (=> b!184130 (= lt!283167 (reader!0 (_2!8606 lt!283177) (_2!8606 lt!283172)))))

(assert (=> b!184130 (= lt!283175 (reader!0 thiss!1204 (_2!8606 lt!283172)))))

(assert (=> b!184130 e!127564))

(declare-fun res!153158 () Bool)

(assert (=> b!184130 (=> (not res!153158) (not e!127564))))

(assert (=> b!184130 (= res!153158 (= (bitIndex!0 (size!4310 (buf!4765 (_1!8604 lt!283189))) (currentByte!8999 (_1!8604 lt!283189)) (currentBit!8994 (_1!8604 lt!283189))) (bitIndex!0 (size!4310 (buf!4765 (_1!8604 lt!283185))) (currentByte!8999 (_1!8604 lt!283185)) (currentBit!8994 (_1!8604 lt!283185)))))))

(declare-fun lt!283176 () Unit!13195)

(declare-fun lt!283186 () BitStream!7728)

(declare-fun readBitPrefixLemma!0 (BitStream!7728 BitStream!7728) Unit!13195)

(assert (=> b!184130 (= lt!283176 (readBitPrefixLemma!0 lt!283186 (_2!8606 lt!283172)))))

(assert (=> b!184130 (= lt!283185 (readBitPure!0 (BitStream!7729 (buf!4765 (_2!8606 lt!283172)) (currentByte!8999 thiss!1204) (currentBit!8994 thiss!1204))))))

(assert (=> b!184130 (= lt!283189 (readBitPure!0 lt!283186))))

(assert (=> b!184130 e!127568))

(declare-fun res!153150 () Bool)

(assert (=> b!184130 (=> (not res!153150) (not e!127568))))

(assert (=> b!184130 (= res!153150 (invariant!0 (currentBit!8994 thiss!1204) (currentByte!8999 thiss!1204) (size!4310 (buf!4765 (_2!8606 lt!283177)))))))

(assert (=> b!184130 (= lt!283186 (BitStream!7729 (buf!4765 (_2!8606 lt!283177)) (currentByte!8999 thiss!1204) (currentBit!8994 thiss!1204)))))

(declare-fun b!184131 () Bool)

(declare-fun res!153142 () Bool)

(assert (=> b!184131 (=> res!153142 e!127559)))

(assert (=> b!184131 (= res!153142 (not (= (bvand lt!283181 #b1111111111111111111111111111111111111111111111111111111111111111) lt!283181)))))

(declare-fun b!184132 () Bool)

(declare-fun res!153145 () Bool)

(assert (=> b!184132 (=> res!153145 e!127560)))

(assert (=> b!184132 (= res!153145 (not (invariant!0 (currentBit!8994 (_2!8606 lt!283172)) (currentByte!8999 (_2!8606 lt!283172)) (size!4310 (buf!4765 (_2!8606 lt!283172))))))))

(declare-fun b!184133 () Bool)

(assert (=> b!184133 (= e!127563 e!127566)))

(declare-fun res!153147 () Bool)

(assert (=> b!184133 (=> (not res!153147) (not e!127566))))

(assert (=> b!184133 (= res!153147 (and (= (_2!8604 lt!283165) lt!283179) (= (_1!8604 lt!283165) (_2!8606 lt!283177))))))

(declare-fun readerFrom!0 (BitStream!7728 (_ BitVec 32) (_ BitVec 32)) BitStream!7728)

(assert (=> b!184133 (= lt!283165 (readBitPure!0 (readerFrom!0 (_2!8606 lt!283177) (currentBit!8994 thiss!1204) (currentByte!8999 thiss!1204))))))

(declare-fun b!184134 () Bool)

(assert (=> b!184134 (= e!127567 e!127560)))

(declare-fun res!153140 () Bool)

(assert (=> b!184134 (=> res!153140 e!127560)))

(assert (=> b!184134 (= res!153140 (not (= lt!283174 (bvsub (bvsub (bvadd lt!283190 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!184134 (= lt!283174 (bitIndex!0 (size!4310 (buf!4765 (_2!8606 lt!283172))) (currentByte!8999 (_2!8606 lt!283172)) (currentBit!8994 (_2!8606 lt!283172))))))

(assert (=> b!184134 (isPrefixOf!0 thiss!1204 (_2!8606 lt!283172))))

(declare-fun lt!283187 () Unit!13195)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7728 BitStream!7728 BitStream!7728) Unit!13195)

(assert (=> b!184134 (= lt!283187 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8606 lt!283177) (_2!8606 lt!283172)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7728 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15922)

(assert (=> b!184134 (= lt!283172 (appendBitsLSBFirstLoopTR!0 (_2!8606 lt!283177) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!40204 res!153141) b!184128))

(assert (= (and b!184128 res!153149) b!184125))

(assert (= (and b!184125 res!153155) b!184117))

(assert (= (and b!184117 res!153139) b!184124))

(assert (= (and b!184124 res!153152) b!184129))

(assert (= (and b!184129 res!153144) b!184127))

(assert (= (and b!184127 res!153157) b!184133))

(assert (= (and b!184133 res!153147) b!184115))

(assert (= (and b!184124 (not res!153151)) b!184134))

(assert (= (and b!184134 (not res!153140)) b!184132))

(assert (= (and b!184132 (not res!153145)) b!184126))

(assert (= (and b!184126 (not res!153148)) b!184120))

(assert (= (and b!184120 (not res!153156)) b!184121))

(assert (= (and b!184121 (not res!153159)) b!184130))

(assert (= (and b!184130 res!153150) b!184119))

(assert (= (and b!184130 res!153158) b!184122))

(assert (= (and b!184130 (not res!153153)) b!184113))

(assert (= (and b!184113 (not res!153143)) b!184114))

(assert (= (and b!184114 (not res!153146)) b!184123))

(assert (= (and b!184123 (not res!153154)) b!184131))

(assert (= (and b!184131 (not res!153142)) b!184118))

(assert (= start!40204 b!184116))

(declare-fun m!286133 () Bool)

(assert (=> b!184120 m!286133))

(declare-fun m!286135 () Bool)

(assert (=> b!184132 m!286135))

(declare-fun m!286137 () Bool)

(assert (=> b!184118 m!286137))

(assert (=> b!184118 m!286137))

(declare-fun m!286139 () Bool)

(assert (=> b!184118 m!286139))

(declare-fun m!286141 () Bool)

(assert (=> b!184127 m!286141))

(declare-fun m!286143 () Bool)

(assert (=> start!40204 m!286143))

(declare-fun m!286145 () Bool)

(assert (=> b!184133 m!286145))

(assert (=> b!184133 m!286145))

(declare-fun m!286147 () Bool)

(assert (=> b!184133 m!286147))

(declare-fun m!286149 () Bool)

(assert (=> b!184129 m!286149))

(declare-fun m!286151 () Bool)

(assert (=> b!184129 m!286151))

(declare-fun m!286153 () Bool)

(assert (=> b!184119 m!286153))

(declare-fun m!286155 () Bool)

(assert (=> b!184134 m!286155))

(declare-fun m!286157 () Bool)

(assert (=> b!184134 m!286157))

(declare-fun m!286159 () Bool)

(assert (=> b!184134 m!286159))

(declare-fun m!286161 () Bool)

(assert (=> b!184134 m!286161))

(declare-fun m!286163 () Bool)

(assert (=> b!184114 m!286163))

(assert (=> b!184121 m!286141))

(declare-fun m!286165 () Bool)

(assert (=> b!184125 m!286165))

(declare-fun m!286167 () Bool)

(assert (=> b!184123 m!286167))

(assert (=> b!184124 m!286149))

(assert (=> b!184124 m!286151))

(declare-fun m!286169 () Bool)

(assert (=> b!184124 m!286169))

(declare-fun m!286171 () Bool)

(assert (=> b!184130 m!286171))

(declare-fun m!286173 () Bool)

(assert (=> b!184130 m!286173))

(declare-fun m!286175 () Bool)

(assert (=> b!184130 m!286175))

(declare-fun m!286177 () Bool)

(assert (=> b!184130 m!286177))

(declare-fun m!286179 () Bool)

(assert (=> b!184130 m!286179))

(declare-fun m!286181 () Bool)

(assert (=> b!184130 m!286181))

(declare-fun m!286183 () Bool)

(assert (=> b!184130 m!286183))

(declare-fun m!286185 () Bool)

(assert (=> b!184130 m!286185))

(declare-fun m!286187 () Bool)

(assert (=> b!184130 m!286187))

(declare-fun m!286189 () Bool)

(assert (=> b!184130 m!286189))

(declare-fun m!286191 () Bool)

(assert (=> b!184130 m!286191))

(declare-fun m!286193 () Bool)

(assert (=> b!184130 m!286193))

(declare-fun m!286195 () Bool)

(assert (=> b!184130 m!286195))

(declare-fun m!286197 () Bool)

(assert (=> b!184130 m!286197))

(declare-fun m!286199 () Bool)

(assert (=> b!184130 m!286199))

(declare-fun m!286201 () Bool)

(assert (=> b!184130 m!286201))

(declare-fun m!286203 () Bool)

(assert (=> b!184115 m!286203))

(declare-fun m!286205 () Bool)

(assert (=> b!184128 m!286205))

(declare-fun m!286207 () Bool)

(assert (=> b!184116 m!286207))

(check-sat (not b!184119) (not b!184116) (not start!40204) (not b!184118) (not b!184114) (not b!184121) (not b!184132) (not b!184134) (not b!184130) (not b!184120) (not b!184133) (not b!184115) (not b!184125) (not b!184123) (not b!184129) (not b!184128) (not b!184127) (not b!184124))
