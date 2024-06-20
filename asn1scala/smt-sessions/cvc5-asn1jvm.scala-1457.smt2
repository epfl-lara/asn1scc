; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39956 () Bool)

(assert start!39956)

(declare-fun b!181916 () Bool)

(declare-fun e!126292 () Bool)

(declare-fun e!126290 () Bool)

(assert (=> b!181916 (= e!126292 e!126290)))

(declare-fun res!151138 () Bool)

(assert (=> b!181916 (=> (not res!151138) (not e!126290))))

(declare-datatypes ((array!9716 0))(
  ( (array!9717 (arr!5215 (Array (_ BitVec 32) (_ BitVec 8))) (size!4285 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7678 0))(
  ( (BitStream!7679 (buf!4734 array!9716) (currentByte!8956 (_ BitVec 32)) (currentBit!8951 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7678)

(declare-fun lt!279380 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181916 (= res!151138 (validate_offset_bits!1 ((_ sign_extend 32) (size!4285 (buf!4734 thiss!1204))) ((_ sign_extend 32) (currentByte!8956 thiss!1204)) ((_ sign_extend 32) (currentBit!8951 thiss!1204)) lt!279380))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!181916 (= lt!279380 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!181917 () Bool)

(declare-fun e!126295 () Bool)

(declare-fun e!126291 () Bool)

(assert (=> b!181917 (= e!126295 e!126291)))

(declare-fun res!151137 () Bool)

(assert (=> b!181917 (=> res!151137 e!126291)))

(declare-fun lt!279377 () (_ BitVec 64))

(declare-fun lt!279373 () (_ BitVec 64))

(assert (=> b!181917 (= res!151137 (not (= lt!279373 (bvsub (bvsub (bvadd lt!279377 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!13067 0))(
  ( (Unit!13068) )
))
(declare-datatypes ((tuple2!15692 0))(
  ( (tuple2!15693 (_1!8491 Unit!13067) (_2!8491 BitStream!7678)) )
))
(declare-fun lt!279369 () tuple2!15692)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181917 (= lt!279373 (bitIndex!0 (size!4285 (buf!4734 (_2!8491 lt!279369))) (currentByte!8956 (_2!8491 lt!279369)) (currentBit!8951 (_2!8491 lt!279369))))))

(declare-fun isPrefixOf!0 (BitStream!7678 BitStream!7678) Bool)

(assert (=> b!181917 (isPrefixOf!0 thiss!1204 (_2!8491 lt!279369))))

(declare-fun lt!279371 () Unit!13067)

(declare-fun lt!279376 () tuple2!15692)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7678 BitStream!7678 BitStream!7678) Unit!13067)

(assert (=> b!181917 (= lt!279371 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8491 lt!279376) (_2!8491 lt!279369)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15692)

(assert (=> b!181917 (= lt!279369 (appendBitsLSBFirstLoopTR!0 (_2!8491 lt!279376) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181919 () Bool)

(declare-fun e!126286 () Bool)

(declare-datatypes ((tuple2!15694 0))(
  ( (tuple2!15695 (_1!8492 BitStream!7678) (_2!8492 Bool)) )
))
(declare-fun lt!279368 () tuple2!15694)

(declare-fun lt!279370 () (_ BitVec 64))

(assert (=> b!181919 (= e!126286 (= (bitIndex!0 (size!4285 (buf!4734 (_1!8492 lt!279368))) (currentByte!8956 (_1!8492 lt!279368)) (currentBit!8951 (_1!8492 lt!279368))) lt!279370))))

(declare-fun b!181920 () Bool)

(declare-fun res!151140 () Bool)

(assert (=> b!181920 (=> res!151140 e!126291)))

(assert (=> b!181920 (= res!151140 (not (isPrefixOf!0 (_2!8491 lt!279376) (_2!8491 lt!279369))))))

(declare-fun b!181921 () Bool)

(declare-fun e!126285 () Bool)

(declare-fun e!126289 () Bool)

(assert (=> b!181921 (= e!126285 e!126289)))

(declare-fun res!151143 () Bool)

(assert (=> b!181921 (=> (not res!151143) (not e!126289))))

(declare-fun lt!279382 () (_ BitVec 64))

(assert (=> b!181921 (= res!151143 (= lt!279370 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279382)))))

(assert (=> b!181921 (= lt!279370 (bitIndex!0 (size!4285 (buf!4734 (_2!8491 lt!279376))) (currentByte!8956 (_2!8491 lt!279376)) (currentBit!8951 (_2!8491 lt!279376))))))

(assert (=> b!181921 (= lt!279382 (bitIndex!0 (size!4285 (buf!4734 thiss!1204)) (currentByte!8956 thiss!1204) (currentBit!8951 thiss!1204)))))

(declare-fun b!181922 () Bool)

(assert (=> b!181922 (= e!126291 true)))

(declare-datatypes ((tuple2!15696 0))(
  ( (tuple2!15697 (_1!8493 BitStream!7678) (_2!8493 (_ BitVec 64))) )
))
(declare-fun lt!279378 () tuple2!15696)

(declare-datatypes ((tuple2!15698 0))(
  ( (tuple2!15699 (_1!8494 BitStream!7678) (_2!8494 BitStream!7678)) )
))
(declare-fun lt!279379 () tuple2!15698)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15696)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181922 (= lt!279378 (readNBitsLSBFirstsLoopPure!0 (_1!8494 lt!279379) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!181922 (validate_offset_bits!1 ((_ sign_extend 32) (size!4285 (buf!4734 (_2!8491 lt!279369)))) ((_ sign_extend 32) (currentByte!8956 thiss!1204)) ((_ sign_extend 32) (currentBit!8951 thiss!1204)) lt!279380)))

(declare-fun lt!279374 () Unit!13067)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7678 array!9716 (_ BitVec 64)) Unit!13067)

(assert (=> b!181922 (= lt!279374 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4734 (_2!8491 lt!279369)) lt!279380))))

(declare-fun lt!279381 () Bool)

(declare-fun readBitPure!0 (BitStream!7678) tuple2!15694)

(assert (=> b!181922 (= (_2!8492 (readBitPure!0 (_1!8494 lt!279379))) lt!279381)))

(declare-fun lt!279375 () tuple2!15698)

(declare-fun reader!0 (BitStream!7678 BitStream!7678) tuple2!15698)

(assert (=> b!181922 (= lt!279375 (reader!0 (_2!8491 lt!279376) (_2!8491 lt!279369)))))

(assert (=> b!181922 (= lt!279379 (reader!0 thiss!1204 (_2!8491 lt!279369)))))

(declare-fun e!126287 () Bool)

(assert (=> b!181922 e!126287))

(declare-fun res!151145 () Bool)

(assert (=> b!181922 (=> (not res!151145) (not e!126287))))

(declare-fun lt!279372 () tuple2!15694)

(declare-fun lt!279365 () tuple2!15694)

(assert (=> b!181922 (= res!151145 (= (bitIndex!0 (size!4285 (buf!4734 (_1!8492 lt!279372))) (currentByte!8956 (_1!8492 lt!279372)) (currentBit!8951 (_1!8492 lt!279372))) (bitIndex!0 (size!4285 (buf!4734 (_1!8492 lt!279365))) (currentByte!8956 (_1!8492 lt!279365)) (currentBit!8951 (_1!8492 lt!279365)))))))

(declare-fun lt!279383 () Unit!13067)

(declare-fun lt!279367 () BitStream!7678)

(declare-fun readBitPrefixLemma!0 (BitStream!7678 BitStream!7678) Unit!13067)

(assert (=> b!181922 (= lt!279383 (readBitPrefixLemma!0 lt!279367 (_2!8491 lt!279369)))))

(assert (=> b!181922 (= lt!279365 (readBitPure!0 (BitStream!7679 (buf!4734 (_2!8491 lt!279369)) (currentByte!8956 thiss!1204) (currentBit!8951 thiss!1204))))))

(assert (=> b!181922 (= lt!279372 (readBitPure!0 lt!279367))))

(declare-fun e!126293 () Bool)

(assert (=> b!181922 e!126293))

(declare-fun res!151142 () Bool)

(assert (=> b!181922 (=> (not res!151142) (not e!126293))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181922 (= res!151142 (invariant!0 (currentBit!8951 thiss!1204) (currentByte!8956 thiss!1204) (size!4285 (buf!4734 (_2!8491 lt!279376)))))))

(assert (=> b!181922 (= lt!279367 (BitStream!7679 (buf!4734 (_2!8491 lt!279376)) (currentByte!8956 thiss!1204) (currentBit!8951 thiss!1204)))))

(declare-fun b!181923 () Bool)

(declare-fun res!151148 () Bool)

(assert (=> b!181923 (=> (not res!151148) (not e!126290))))

(assert (=> b!181923 (= res!151148 (not (= i!590 nBits!348)))))

(declare-fun b!181924 () Bool)

(assert (=> b!181924 (= e!126289 e!126286)))

(declare-fun res!151139 () Bool)

(assert (=> b!181924 (=> (not res!151139) (not e!126286))))

(assert (=> b!181924 (= res!151139 (and (= (_2!8492 lt!279368) lt!279381) (= (_1!8492 lt!279368) (_2!8491 lt!279376))))))

(declare-fun readerFrom!0 (BitStream!7678 (_ BitVec 32) (_ BitVec 32)) BitStream!7678)

(assert (=> b!181924 (= lt!279368 (readBitPure!0 (readerFrom!0 (_2!8491 lt!279376) (currentBit!8951 thiss!1204) (currentByte!8956 thiss!1204))))))

(declare-fun b!181925 () Bool)

(assert (=> b!181925 (= e!126290 (not e!126295))))

(declare-fun res!151144 () Bool)

(assert (=> b!181925 (=> res!151144 e!126295)))

(declare-fun lt!279366 () (_ BitVec 64))

(assert (=> b!181925 (= res!151144 (not (= lt!279377 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279366))))))

(assert (=> b!181925 (= lt!279377 (bitIndex!0 (size!4285 (buf!4734 (_2!8491 lt!279376))) (currentByte!8956 (_2!8491 lt!279376)) (currentBit!8951 (_2!8491 lt!279376))))))

(assert (=> b!181925 (= lt!279366 (bitIndex!0 (size!4285 (buf!4734 thiss!1204)) (currentByte!8956 thiss!1204) (currentBit!8951 thiss!1204)))))

(assert (=> b!181925 e!126285))

(declare-fun res!151146 () Bool)

(assert (=> b!181925 (=> (not res!151146) (not e!126285))))

(assert (=> b!181925 (= res!151146 (= (size!4285 (buf!4734 thiss!1204)) (size!4285 (buf!4734 (_2!8491 lt!279376)))))))

(declare-fun appendBit!0 (BitStream!7678 Bool) tuple2!15692)

(assert (=> b!181925 (= lt!279376 (appendBit!0 thiss!1204 lt!279381))))

(assert (=> b!181925 (= lt!279381 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181926 () Bool)

(declare-fun res!151149 () Bool)

(assert (=> b!181926 (=> res!151149 e!126291)))

(assert (=> b!181926 (= res!151149 (or (not (= (size!4285 (buf!4734 (_2!8491 lt!279369))) (size!4285 (buf!4734 thiss!1204)))) (not (= lt!279373 (bvsub (bvadd lt!279366 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181927 () Bool)

(assert (=> b!181927 (= e!126287 (= (_2!8492 lt!279372) (_2!8492 lt!279365)))))

(declare-fun b!181928 () Bool)

(declare-fun res!151151 () Bool)

(assert (=> b!181928 (=> (not res!151151) (not e!126289))))

(assert (=> b!181928 (= res!151151 (isPrefixOf!0 thiss!1204 (_2!8491 lt!279376)))))

(declare-fun b!181918 () Bool)

(assert (=> b!181918 (= e!126293 (invariant!0 (currentBit!8951 thiss!1204) (currentByte!8956 thiss!1204) (size!4285 (buf!4734 (_2!8491 lt!279369)))))))

(declare-fun res!151152 () Bool)

(assert (=> start!39956 (=> (not res!151152) (not e!126292))))

(assert (=> start!39956 (= res!151152 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39956 e!126292))

(assert (=> start!39956 true))

(declare-fun e!126294 () Bool)

(declare-fun inv!12 (BitStream!7678) Bool)

(assert (=> start!39956 (and (inv!12 thiss!1204) e!126294)))

(declare-fun b!181929 () Bool)

(declare-fun array_inv!4026 (array!9716) Bool)

(assert (=> b!181929 (= e!126294 (array_inv!4026 (buf!4734 thiss!1204)))))

(declare-fun b!181930 () Bool)

(declare-fun res!151150 () Bool)

(assert (=> b!181930 (=> res!151150 e!126291)))

(assert (=> b!181930 (= res!151150 (not (invariant!0 (currentBit!8951 (_2!8491 lt!279369)) (currentByte!8956 (_2!8491 lt!279369)) (size!4285 (buf!4734 (_2!8491 lt!279369))))))))

(declare-fun b!181931 () Bool)

(declare-fun res!151141 () Bool)

(assert (=> b!181931 (=> res!151141 e!126291)))

(assert (=> b!181931 (= res!151141 (not (isPrefixOf!0 thiss!1204 (_2!8491 lt!279376))))))

(declare-fun b!181932 () Bool)

(declare-fun res!151147 () Bool)

(assert (=> b!181932 (=> (not res!151147) (not e!126290))))

(assert (=> b!181932 (= res!151147 (invariant!0 (currentBit!8951 thiss!1204) (currentByte!8956 thiss!1204) (size!4285 (buf!4734 thiss!1204))))))

(assert (= (and start!39956 res!151152) b!181916))

(assert (= (and b!181916 res!151138) b!181932))

(assert (= (and b!181932 res!151147) b!181923))

(assert (= (and b!181923 res!151148) b!181925))

(assert (= (and b!181925 res!151146) b!181921))

(assert (= (and b!181921 res!151143) b!181928))

(assert (= (and b!181928 res!151151) b!181924))

(assert (= (and b!181924 res!151139) b!181919))

(assert (= (and b!181925 (not res!151144)) b!181917))

(assert (= (and b!181917 (not res!151137)) b!181930))

(assert (= (and b!181930 (not res!151150)) b!181926))

(assert (= (and b!181926 (not res!151149)) b!181920))

(assert (= (and b!181920 (not res!151140)) b!181931))

(assert (= (and b!181931 (not res!151141)) b!181922))

(assert (= (and b!181922 res!151142) b!181918))

(assert (= (and b!181922 res!151145) b!181927))

(assert (= start!39956 b!181929))

(declare-fun m!283045 () Bool)

(assert (=> b!181917 m!283045))

(declare-fun m!283047 () Bool)

(assert (=> b!181917 m!283047))

(declare-fun m!283049 () Bool)

(assert (=> b!181917 m!283049))

(declare-fun m!283051 () Bool)

(assert (=> b!181917 m!283051))

(declare-fun m!283053 () Bool)

(assert (=> b!181920 m!283053))

(declare-fun m!283055 () Bool)

(assert (=> b!181922 m!283055))

(declare-fun m!283057 () Bool)

(assert (=> b!181922 m!283057))

(declare-fun m!283059 () Bool)

(assert (=> b!181922 m!283059))

(declare-fun m!283061 () Bool)

(assert (=> b!181922 m!283061))

(declare-fun m!283063 () Bool)

(assert (=> b!181922 m!283063))

(declare-fun m!283065 () Bool)

(assert (=> b!181922 m!283065))

(declare-fun m!283067 () Bool)

(assert (=> b!181922 m!283067))

(declare-fun m!283069 () Bool)

(assert (=> b!181922 m!283069))

(declare-fun m!283071 () Bool)

(assert (=> b!181922 m!283071))

(declare-fun m!283073 () Bool)

(assert (=> b!181922 m!283073))

(declare-fun m!283075 () Bool)

(assert (=> b!181922 m!283075))

(declare-fun m!283077 () Bool)

(assert (=> b!181922 m!283077))

(declare-fun m!283079 () Bool)

(assert (=> b!181922 m!283079))

(declare-fun m!283081 () Bool)

(assert (=> b!181921 m!283081))

(declare-fun m!283083 () Bool)

(assert (=> b!181921 m!283083))

(declare-fun m!283085 () Bool)

(assert (=> b!181924 m!283085))

(assert (=> b!181924 m!283085))

(declare-fun m!283087 () Bool)

(assert (=> b!181924 m!283087))

(declare-fun m!283089 () Bool)

(assert (=> b!181928 m!283089))

(declare-fun m!283091 () Bool)

(assert (=> b!181932 m!283091))

(assert (=> b!181931 m!283089))

(declare-fun m!283093 () Bool)

(assert (=> b!181929 m!283093))

(declare-fun m!283095 () Bool)

(assert (=> start!39956 m!283095))

(declare-fun m!283097 () Bool)

(assert (=> b!181918 m!283097))

(declare-fun m!283099 () Bool)

(assert (=> b!181919 m!283099))

(declare-fun m!283101 () Bool)

(assert (=> b!181930 m!283101))

(assert (=> b!181925 m!283081))

(assert (=> b!181925 m!283083))

(declare-fun m!283103 () Bool)

(assert (=> b!181925 m!283103))

(declare-fun m!283105 () Bool)

(assert (=> b!181916 m!283105))

(push 1)

(assert (not b!181931))

