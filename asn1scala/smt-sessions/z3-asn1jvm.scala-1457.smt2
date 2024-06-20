; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39958 () Bool)

(assert start!39958)

(declare-fun b!181967 () Bool)

(declare-fun e!126319 () Bool)

(declare-datatypes ((array!9718 0))(
  ( (array!9719 (arr!5216 (Array (_ BitVec 32) (_ BitVec 8))) (size!4286 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7680 0))(
  ( (BitStream!7681 (buf!4735 array!9718) (currentByte!8957 (_ BitVec 32)) (currentBit!8952 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7680)

(declare-fun array_inv!4027 (array!9718) Bool)

(assert (=> b!181967 (= e!126319 (array_inv!4027 (buf!4735 thiss!1204)))))

(declare-fun b!181968 () Bool)

(declare-fun e!126328 () Bool)

(declare-fun e!126325 () Bool)

(assert (=> b!181968 (= e!126328 (not e!126325))))

(declare-fun res!151189 () Bool)

(assert (=> b!181968 (=> res!151189 e!126325)))

(declare-fun lt!279424 () (_ BitVec 64))

(declare-fun lt!279430 () (_ BitVec 64))

(assert (=> b!181968 (= res!151189 (not (= lt!279424 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279430))))))

(declare-datatypes ((Unit!13069 0))(
  ( (Unit!13070) )
))
(declare-datatypes ((tuple2!15700 0))(
  ( (tuple2!15701 (_1!8495 Unit!13069) (_2!8495 BitStream!7680)) )
))
(declare-fun lt!279428 () tuple2!15700)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181968 (= lt!279424 (bitIndex!0 (size!4286 (buf!4735 (_2!8495 lt!279428))) (currentByte!8957 (_2!8495 lt!279428)) (currentBit!8952 (_2!8495 lt!279428))))))

(assert (=> b!181968 (= lt!279430 (bitIndex!0 (size!4286 (buf!4735 thiss!1204)) (currentByte!8957 thiss!1204) (currentBit!8952 thiss!1204)))))

(declare-fun e!126320 () Bool)

(assert (=> b!181968 e!126320))

(declare-fun res!151185 () Bool)

(assert (=> b!181968 (=> (not res!151185) (not e!126320))))

(assert (=> b!181968 (= res!151185 (= (size!4286 (buf!4735 thiss!1204)) (size!4286 (buf!4735 (_2!8495 lt!279428)))))))

(declare-fun lt!279439 () Bool)

(declare-fun appendBit!0 (BitStream!7680 Bool) tuple2!15700)

(assert (=> b!181968 (= lt!279428 (appendBit!0 thiss!1204 lt!279439))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!181968 (= lt!279439 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181969 () Bool)

(declare-fun res!151187 () Bool)

(declare-fun e!126323 () Bool)

(assert (=> b!181969 (=> res!151187 e!126323)))

(declare-fun lt!279434 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!279427 () tuple2!15700)

(assert (=> b!181969 (= res!151187 (or (not (= (size!4286 (buf!4735 (_2!8495 lt!279427))) (size!4286 (buf!4735 thiss!1204)))) (not (= lt!279434 (bvsub (bvadd lt!279430 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181970 () Bool)

(declare-fun e!126322 () Bool)

(assert (=> b!181970 (= e!126320 e!126322)))

(declare-fun res!151196 () Bool)

(assert (=> b!181970 (=> (not res!151196) (not e!126322))))

(declare-fun lt!279422 () (_ BitVec 64))

(declare-fun lt!279426 () (_ BitVec 64))

(assert (=> b!181970 (= res!151196 (= lt!279422 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279426)))))

(assert (=> b!181970 (= lt!279422 (bitIndex!0 (size!4286 (buf!4735 (_2!8495 lt!279428))) (currentByte!8957 (_2!8495 lt!279428)) (currentBit!8952 (_2!8495 lt!279428))))))

(assert (=> b!181970 (= lt!279426 (bitIndex!0 (size!4286 (buf!4735 thiss!1204)) (currentByte!8957 thiss!1204) (currentBit!8952 thiss!1204)))))

(declare-fun b!181971 () Bool)

(declare-fun e!126327 () Bool)

(assert (=> b!181971 (= e!126322 e!126327)))

(declare-fun res!151186 () Bool)

(assert (=> b!181971 (=> (not res!151186) (not e!126327))))

(declare-datatypes ((tuple2!15702 0))(
  ( (tuple2!15703 (_1!8496 BitStream!7680) (_2!8496 Bool)) )
))
(declare-fun lt!279435 () tuple2!15702)

(assert (=> b!181971 (= res!151186 (and (= (_2!8496 lt!279435) lt!279439) (= (_1!8496 lt!279435) (_2!8495 lt!279428))))))

(declare-fun readBitPure!0 (BitStream!7680) tuple2!15702)

(declare-fun readerFrom!0 (BitStream!7680 (_ BitVec 32) (_ BitVec 32)) BitStream!7680)

(assert (=> b!181971 (= lt!279435 (readBitPure!0 (readerFrom!0 (_2!8495 lt!279428) (currentBit!8952 thiss!1204) (currentByte!8957 thiss!1204))))))

(declare-fun b!181972 () Bool)

(declare-fun res!151197 () Bool)

(assert (=> b!181972 (=> res!151197 e!126323)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181972 (= res!151197 (not (invariant!0 (currentBit!8952 (_2!8495 lt!279427)) (currentByte!8957 (_2!8495 lt!279427)) (size!4286 (buf!4735 (_2!8495 lt!279427))))))))

(declare-fun b!181973 () Bool)

(assert (=> b!181973 (= e!126325 e!126323)))

(declare-fun res!151199 () Bool)

(assert (=> b!181973 (=> res!151199 e!126323)))

(assert (=> b!181973 (= res!151199 (not (= lt!279434 (bvsub (bvsub (bvadd lt!279424 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!181973 (= lt!279434 (bitIndex!0 (size!4286 (buf!4735 (_2!8495 lt!279427))) (currentByte!8957 (_2!8495 lt!279427)) (currentBit!8952 (_2!8495 lt!279427))))))

(declare-fun isPrefixOf!0 (BitStream!7680 BitStream!7680) Bool)

(assert (=> b!181973 (isPrefixOf!0 thiss!1204 (_2!8495 lt!279427))))

(declare-fun lt!279429 () Unit!13069)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7680 BitStream!7680 BitStream!7680) Unit!13069)

(assert (=> b!181973 (= lt!279429 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8495 lt!279428) (_2!8495 lt!279427)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15700)

(assert (=> b!181973 (= lt!279427 (appendBitsLSBFirstLoopTR!0 (_2!8495 lt!279428) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181974 () Bool)

(declare-fun e!126326 () Bool)

(declare-fun lt!279440 () tuple2!15702)

(declare-fun lt!279433 () tuple2!15702)

(assert (=> b!181974 (= e!126326 (= (_2!8496 lt!279440) (_2!8496 lt!279433)))))

(declare-fun b!181975 () Bool)

(declare-fun res!151194 () Bool)

(assert (=> b!181975 (=> (not res!151194) (not e!126322))))

(assert (=> b!181975 (= res!151194 (isPrefixOf!0 thiss!1204 (_2!8495 lt!279428)))))

(declare-fun b!181976 () Bool)

(assert (=> b!181976 (= e!126327 (= (bitIndex!0 (size!4286 (buf!4735 (_1!8496 lt!279435))) (currentByte!8957 (_1!8496 lt!279435)) (currentBit!8952 (_1!8496 lt!279435))) lt!279422))))

(declare-fun b!181977 () Bool)

(assert (=> b!181977 (= e!126323 true)))

(declare-datatypes ((tuple2!15704 0))(
  ( (tuple2!15705 (_1!8497 BitStream!7680) (_2!8497 BitStream!7680)) )
))
(declare-fun lt!279437 () tuple2!15704)

(declare-datatypes ((tuple2!15706 0))(
  ( (tuple2!15707 (_1!8498 BitStream!7680) (_2!8498 (_ BitVec 64))) )
))
(declare-fun lt!279436 () tuple2!15706)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15706)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181977 (= lt!279436 (readNBitsLSBFirstsLoopPure!0 (_1!8497 lt!279437) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279425 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181977 (validate_offset_bits!1 ((_ sign_extend 32) (size!4286 (buf!4735 (_2!8495 lt!279427)))) ((_ sign_extend 32) (currentByte!8957 thiss!1204)) ((_ sign_extend 32) (currentBit!8952 thiss!1204)) lt!279425)))

(declare-fun lt!279423 () Unit!13069)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7680 array!9718 (_ BitVec 64)) Unit!13069)

(assert (=> b!181977 (= lt!279423 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4735 (_2!8495 lt!279427)) lt!279425))))

(assert (=> b!181977 (= (_2!8496 (readBitPure!0 (_1!8497 lt!279437))) lt!279439)))

(declare-fun lt!279432 () tuple2!15704)

(declare-fun reader!0 (BitStream!7680 BitStream!7680) tuple2!15704)

(assert (=> b!181977 (= lt!279432 (reader!0 (_2!8495 lt!279428) (_2!8495 lt!279427)))))

(assert (=> b!181977 (= lt!279437 (reader!0 thiss!1204 (_2!8495 lt!279427)))))

(assert (=> b!181977 e!126326))

(declare-fun res!151195 () Bool)

(assert (=> b!181977 (=> (not res!151195) (not e!126326))))

(assert (=> b!181977 (= res!151195 (= (bitIndex!0 (size!4286 (buf!4735 (_1!8496 lt!279440))) (currentByte!8957 (_1!8496 lt!279440)) (currentBit!8952 (_1!8496 lt!279440))) (bitIndex!0 (size!4286 (buf!4735 (_1!8496 lt!279433))) (currentByte!8957 (_1!8496 lt!279433)) (currentBit!8952 (_1!8496 lt!279433)))))))

(declare-fun lt!279431 () Unit!13069)

(declare-fun lt!279438 () BitStream!7680)

(declare-fun readBitPrefixLemma!0 (BitStream!7680 BitStream!7680) Unit!13069)

(assert (=> b!181977 (= lt!279431 (readBitPrefixLemma!0 lt!279438 (_2!8495 lt!279427)))))

(assert (=> b!181977 (= lt!279433 (readBitPure!0 (BitStream!7681 (buf!4735 (_2!8495 lt!279427)) (currentByte!8957 thiss!1204) (currentBit!8952 thiss!1204))))))

(assert (=> b!181977 (= lt!279440 (readBitPure!0 lt!279438))))

(declare-fun e!126321 () Bool)

(assert (=> b!181977 e!126321))

(declare-fun res!151190 () Bool)

(assert (=> b!181977 (=> (not res!151190) (not e!126321))))

(assert (=> b!181977 (= res!151190 (invariant!0 (currentBit!8952 thiss!1204) (currentByte!8957 thiss!1204) (size!4286 (buf!4735 (_2!8495 lt!279428)))))))

(assert (=> b!181977 (= lt!279438 (BitStream!7681 (buf!4735 (_2!8495 lt!279428)) (currentByte!8957 thiss!1204) (currentBit!8952 thiss!1204)))))

(declare-fun b!181978 () Bool)

(declare-fun res!151200 () Bool)

(assert (=> b!181978 (=> (not res!151200) (not e!126328))))

(assert (=> b!181978 (= res!151200 (not (= i!590 nBits!348)))))

(declare-fun b!181979 () Bool)

(declare-fun res!151188 () Bool)

(assert (=> b!181979 (=> res!151188 e!126323)))

(assert (=> b!181979 (= res!151188 (not (isPrefixOf!0 (_2!8495 lt!279428) (_2!8495 lt!279427))))))

(declare-fun b!181980 () Bool)

(declare-fun res!151193 () Bool)

(assert (=> b!181980 (=> (not res!151193) (not e!126328))))

(assert (=> b!181980 (= res!151193 (invariant!0 (currentBit!8952 thiss!1204) (currentByte!8957 thiss!1204) (size!4286 (buf!4735 thiss!1204))))))

(declare-fun b!181981 () Bool)

(declare-fun e!126318 () Bool)

(assert (=> b!181981 (= e!126318 e!126328)))

(declare-fun res!151192 () Bool)

(assert (=> b!181981 (=> (not res!151192) (not e!126328))))

(assert (=> b!181981 (= res!151192 (validate_offset_bits!1 ((_ sign_extend 32) (size!4286 (buf!4735 thiss!1204))) ((_ sign_extend 32) (currentByte!8957 thiss!1204)) ((_ sign_extend 32) (currentBit!8952 thiss!1204)) lt!279425))))

(assert (=> b!181981 (= lt!279425 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!151191 () Bool)

(assert (=> start!39958 (=> (not res!151191) (not e!126318))))

(assert (=> start!39958 (= res!151191 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39958 e!126318))

(assert (=> start!39958 true))

(declare-fun inv!12 (BitStream!7680) Bool)

(assert (=> start!39958 (and (inv!12 thiss!1204) e!126319)))

(declare-fun b!181982 () Bool)

(declare-fun res!151198 () Bool)

(assert (=> b!181982 (=> res!151198 e!126323)))

(assert (=> b!181982 (= res!151198 (not (isPrefixOf!0 thiss!1204 (_2!8495 lt!279428))))))

(declare-fun b!181983 () Bool)

(assert (=> b!181983 (= e!126321 (invariant!0 (currentBit!8952 thiss!1204) (currentByte!8957 thiss!1204) (size!4286 (buf!4735 (_2!8495 lt!279427)))))))

(assert (= (and start!39958 res!151191) b!181981))

(assert (= (and b!181981 res!151192) b!181980))

(assert (= (and b!181980 res!151193) b!181978))

(assert (= (and b!181978 res!151200) b!181968))

(assert (= (and b!181968 res!151185) b!181970))

(assert (= (and b!181970 res!151196) b!181975))

(assert (= (and b!181975 res!151194) b!181971))

(assert (= (and b!181971 res!151186) b!181976))

(assert (= (and b!181968 (not res!151189)) b!181973))

(assert (= (and b!181973 (not res!151199)) b!181972))

(assert (= (and b!181972 (not res!151197)) b!181969))

(assert (= (and b!181969 (not res!151187)) b!181979))

(assert (= (and b!181979 (not res!151188)) b!181982))

(assert (= (and b!181982 (not res!151198)) b!181977))

(assert (= (and b!181977 res!151190) b!181983))

(assert (= (and b!181977 res!151195) b!181974))

(assert (= start!39958 b!181967))

(declare-fun m!283107 () Bool)

(assert (=> b!181970 m!283107))

(declare-fun m!283109 () Bool)

(assert (=> b!181970 m!283109))

(declare-fun m!283111 () Bool)

(assert (=> b!181983 m!283111))

(declare-fun m!283113 () Bool)

(assert (=> b!181967 m!283113))

(declare-fun m!283115 () Bool)

(assert (=> b!181982 m!283115))

(declare-fun m!283117 () Bool)

(assert (=> b!181979 m!283117))

(declare-fun m!283119 () Bool)

(assert (=> b!181971 m!283119))

(assert (=> b!181971 m!283119))

(declare-fun m!283121 () Bool)

(assert (=> b!181971 m!283121))

(declare-fun m!283123 () Bool)

(assert (=> start!39958 m!283123))

(declare-fun m!283125 () Bool)

(assert (=> b!181972 m!283125))

(declare-fun m!283127 () Bool)

(assert (=> b!181976 m!283127))

(assert (=> b!181975 m!283115))

(assert (=> b!181968 m!283107))

(assert (=> b!181968 m!283109))

(declare-fun m!283129 () Bool)

(assert (=> b!181968 m!283129))

(declare-fun m!283131 () Bool)

(assert (=> b!181980 m!283131))

(declare-fun m!283133 () Bool)

(assert (=> b!181981 m!283133))

(declare-fun m!283135 () Bool)

(assert (=> b!181977 m!283135))

(declare-fun m!283137 () Bool)

(assert (=> b!181977 m!283137))

(declare-fun m!283139 () Bool)

(assert (=> b!181977 m!283139))

(declare-fun m!283141 () Bool)

(assert (=> b!181977 m!283141))

(declare-fun m!283143 () Bool)

(assert (=> b!181977 m!283143))

(declare-fun m!283145 () Bool)

(assert (=> b!181977 m!283145))

(declare-fun m!283147 () Bool)

(assert (=> b!181977 m!283147))

(declare-fun m!283149 () Bool)

(assert (=> b!181977 m!283149))

(declare-fun m!283151 () Bool)

(assert (=> b!181977 m!283151))

(declare-fun m!283153 () Bool)

(assert (=> b!181977 m!283153))

(declare-fun m!283155 () Bool)

(assert (=> b!181977 m!283155))

(declare-fun m!283157 () Bool)

(assert (=> b!181977 m!283157))

(declare-fun m!283159 () Bool)

(assert (=> b!181977 m!283159))

(declare-fun m!283161 () Bool)

(assert (=> b!181973 m!283161))

(declare-fun m!283163 () Bool)

(assert (=> b!181973 m!283163))

(declare-fun m!283165 () Bool)

(assert (=> b!181973 m!283165))

(declare-fun m!283167 () Bool)

(assert (=> b!181973 m!283167))

(check-sat (not b!181968) (not b!181972) (not start!39958) (not b!181970) (not b!181971) (not b!181982) (not b!181979) (not b!181983) (not b!181980) (not b!181973) (not b!181977) (not b!181976) (not b!181981) (not b!181975) (not b!181967))
