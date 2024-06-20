; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39954 () Bool)

(assert start!39954)

(declare-fun b!181865 () Bool)

(declare-fun res!151098 () Bool)

(declare-fun e!126262 () Bool)

(assert (=> b!181865 (=> res!151098 e!126262)))

(declare-datatypes ((array!9714 0))(
  ( (array!9715 (arr!5214 (Array (_ BitVec 32) (_ BitVec 8))) (size!4284 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7676 0))(
  ( (BitStream!7677 (buf!4733 array!9714) (currentByte!8955 (_ BitVec 32)) (currentBit!8950 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7676)

(declare-datatypes ((Unit!13065 0))(
  ( (Unit!13066) )
))
(declare-datatypes ((tuple2!15684 0))(
  ( (tuple2!15685 (_1!8487 Unit!13065) (_2!8487 BitStream!7676)) )
))
(declare-fun lt!279313 () tuple2!15684)

(declare-fun isPrefixOf!0 (BitStream!7676 BitStream!7676) Bool)

(assert (=> b!181865 (= res!151098 (not (isPrefixOf!0 thiss!1204 (_2!8487 lt!279313))))))

(declare-fun b!181866 () Bool)

(declare-fun e!126260 () Bool)

(assert (=> b!181866 (= e!126260 e!126262)))

(declare-fun res!151090 () Bool)

(assert (=> b!181866 (=> res!151090 e!126262)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!279311 () (_ BitVec 64))

(declare-fun lt!279309 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!181866 (= res!151090 (not (= lt!279309 (bvsub (bvsub (bvadd lt!279311 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!279321 () tuple2!15684)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181866 (= lt!279309 (bitIndex!0 (size!4284 (buf!4733 (_2!8487 lt!279321))) (currentByte!8955 (_2!8487 lt!279321)) (currentBit!8950 (_2!8487 lt!279321))))))

(assert (=> b!181866 (isPrefixOf!0 thiss!1204 (_2!8487 lt!279321))))

(declare-fun lt!279317 () Unit!13065)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7676 BitStream!7676 BitStream!7676) Unit!13065)

(assert (=> b!181866 (= lt!279317 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8487 lt!279313) (_2!8487 lt!279321)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7676 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15684)

(assert (=> b!181866 (= lt!279321 (appendBitsLSBFirstLoopTR!0 (_2!8487 lt!279313) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181867 () Bool)

(declare-fun res!151103 () Bool)

(assert (=> b!181867 (=> res!151103 e!126262)))

(assert (=> b!181867 (= res!151103 (not (isPrefixOf!0 (_2!8487 lt!279313) (_2!8487 lt!279321))))))

(declare-fun b!181868 () Bool)

(assert (=> b!181868 (= e!126262 true)))

(declare-datatypes ((tuple2!15686 0))(
  ( (tuple2!15687 (_1!8488 BitStream!7676) (_2!8488 BitStream!7676)) )
))
(declare-fun lt!279319 () tuple2!15686)

(declare-datatypes ((tuple2!15688 0))(
  ( (tuple2!15689 (_1!8489 BitStream!7676) (_2!8489 (_ BitVec 64))) )
))
(declare-fun lt!279325 () tuple2!15688)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15688)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181868 (= lt!279325 (readNBitsLSBFirstsLoopPure!0 (_1!8488 lt!279319) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279318 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181868 (validate_offset_bits!1 ((_ sign_extend 32) (size!4284 (buf!4733 (_2!8487 lt!279321)))) ((_ sign_extend 32) (currentByte!8955 thiss!1204)) ((_ sign_extend 32) (currentBit!8950 thiss!1204)) lt!279318)))

(declare-fun lt!279315 () Unit!13065)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7676 array!9714 (_ BitVec 64)) Unit!13065)

(assert (=> b!181868 (= lt!279315 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4733 (_2!8487 lt!279321)) lt!279318))))

(declare-fun lt!279310 () Bool)

(declare-datatypes ((tuple2!15690 0))(
  ( (tuple2!15691 (_1!8490 BitStream!7676) (_2!8490 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7676) tuple2!15690)

(assert (=> b!181868 (= (_2!8490 (readBitPure!0 (_1!8488 lt!279319))) lt!279310)))

(declare-fun lt!279308 () tuple2!15686)

(declare-fun reader!0 (BitStream!7676 BitStream!7676) tuple2!15686)

(assert (=> b!181868 (= lt!279308 (reader!0 (_2!8487 lt!279313) (_2!8487 lt!279321)))))

(assert (=> b!181868 (= lt!279319 (reader!0 thiss!1204 (_2!8487 lt!279321)))))

(declare-fun e!126259 () Bool)

(assert (=> b!181868 e!126259))

(declare-fun res!151094 () Bool)

(assert (=> b!181868 (=> (not res!151094) (not e!126259))))

(declare-fun lt!279314 () tuple2!15690)

(declare-fun lt!279312 () tuple2!15690)

(assert (=> b!181868 (= res!151094 (= (bitIndex!0 (size!4284 (buf!4733 (_1!8490 lt!279314))) (currentByte!8955 (_1!8490 lt!279314)) (currentBit!8950 (_1!8490 lt!279314))) (bitIndex!0 (size!4284 (buf!4733 (_1!8490 lt!279312))) (currentByte!8955 (_1!8490 lt!279312)) (currentBit!8950 (_1!8490 lt!279312)))))))

(declare-fun lt!279323 () Unit!13065)

(declare-fun lt!279322 () BitStream!7676)

(declare-fun readBitPrefixLemma!0 (BitStream!7676 BitStream!7676) Unit!13065)

(assert (=> b!181868 (= lt!279323 (readBitPrefixLemma!0 lt!279322 (_2!8487 lt!279321)))))

(assert (=> b!181868 (= lt!279312 (readBitPure!0 (BitStream!7677 (buf!4733 (_2!8487 lt!279321)) (currentByte!8955 thiss!1204) (currentBit!8950 thiss!1204))))))

(assert (=> b!181868 (= lt!279314 (readBitPure!0 lt!279322))))

(declare-fun e!126255 () Bool)

(assert (=> b!181868 e!126255))

(declare-fun res!151097 () Bool)

(assert (=> b!181868 (=> (not res!151097) (not e!126255))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181868 (= res!151097 (invariant!0 (currentBit!8950 thiss!1204) (currentByte!8955 thiss!1204) (size!4284 (buf!4733 (_2!8487 lt!279313)))))))

(assert (=> b!181868 (= lt!279322 (BitStream!7677 (buf!4733 (_2!8487 lt!279313)) (currentByte!8955 thiss!1204) (currentBit!8950 thiss!1204)))))

(declare-fun b!181869 () Bool)

(declare-fun res!151093 () Bool)

(declare-fun e!126256 () Bool)

(assert (=> b!181869 (=> (not res!151093) (not e!126256))))

(assert (=> b!181869 (= res!151093 (not (= i!590 nBits!348)))))

(declare-fun b!181870 () Bool)

(assert (=> b!181870 (= e!126259 (= (_2!8490 lt!279314) (_2!8490 lt!279312)))))

(declare-fun b!181871 () Bool)

(declare-fun e!126253 () Bool)

(declare-fun e!126258 () Bool)

(assert (=> b!181871 (= e!126253 e!126258)))

(declare-fun res!151089 () Bool)

(assert (=> b!181871 (=> (not res!151089) (not e!126258))))

(declare-fun lt!279324 () tuple2!15690)

(assert (=> b!181871 (= res!151089 (and (= (_2!8490 lt!279324) lt!279310) (= (_1!8490 lt!279324) (_2!8487 lt!279313))))))

(declare-fun readerFrom!0 (BitStream!7676 (_ BitVec 32) (_ BitVec 32)) BitStream!7676)

(assert (=> b!181871 (= lt!279324 (readBitPure!0 (readerFrom!0 (_2!8487 lt!279313) (currentBit!8950 thiss!1204) (currentByte!8955 thiss!1204))))))

(declare-fun b!181872 () Bool)

(declare-fun e!126257 () Bool)

(declare-fun array_inv!4025 (array!9714) Bool)

(assert (=> b!181872 (= e!126257 (array_inv!4025 (buf!4733 thiss!1204)))))

(declare-fun b!181873 () Bool)

(declare-fun res!151104 () Bool)

(assert (=> b!181873 (=> res!151104 e!126262)))

(assert (=> b!181873 (= res!151104 (not (invariant!0 (currentBit!8950 (_2!8487 lt!279321)) (currentByte!8955 (_2!8487 lt!279321)) (size!4284 (buf!4733 (_2!8487 lt!279321))))))))

(declare-fun b!181874 () Bool)

(declare-fun res!151101 () Bool)

(assert (=> b!181874 (=> (not res!151101) (not e!126253))))

(assert (=> b!181874 (= res!151101 (isPrefixOf!0 thiss!1204 (_2!8487 lt!279313)))))

(declare-fun res!151095 () Bool)

(declare-fun e!126252 () Bool)

(assert (=> start!39954 (=> (not res!151095) (not e!126252))))

(assert (=> start!39954 (= res!151095 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39954 e!126252))

(assert (=> start!39954 true))

(declare-fun inv!12 (BitStream!7676) Bool)

(assert (=> start!39954 (and (inv!12 thiss!1204) e!126257)))

(declare-fun b!181875 () Bool)

(assert (=> b!181875 (= e!126252 e!126256)))

(declare-fun res!151091 () Bool)

(assert (=> b!181875 (=> (not res!151091) (not e!126256))))

(assert (=> b!181875 (= res!151091 (validate_offset_bits!1 ((_ sign_extend 32) (size!4284 (buf!4733 thiss!1204))) ((_ sign_extend 32) (currentByte!8955 thiss!1204)) ((_ sign_extend 32) (currentBit!8950 thiss!1204)) lt!279318))))

(assert (=> b!181875 (= lt!279318 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!181876 () Bool)

(declare-fun e!126261 () Bool)

(assert (=> b!181876 (= e!126261 e!126253)))

(declare-fun res!151102 () Bool)

(assert (=> b!181876 (=> (not res!151102) (not e!126253))))

(declare-fun lt!279316 () (_ BitVec 64))

(declare-fun lt!279326 () (_ BitVec 64))

(assert (=> b!181876 (= res!151102 (= lt!279316 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279326)))))

(assert (=> b!181876 (= lt!279316 (bitIndex!0 (size!4284 (buf!4733 (_2!8487 lt!279313))) (currentByte!8955 (_2!8487 lt!279313)) (currentBit!8950 (_2!8487 lt!279313))))))

(assert (=> b!181876 (= lt!279326 (bitIndex!0 (size!4284 (buf!4733 thiss!1204)) (currentByte!8955 thiss!1204) (currentBit!8950 thiss!1204)))))

(declare-fun b!181877 () Bool)

(declare-fun res!151100 () Bool)

(assert (=> b!181877 (=> (not res!151100) (not e!126256))))

(assert (=> b!181877 (= res!151100 (invariant!0 (currentBit!8950 thiss!1204) (currentByte!8955 thiss!1204) (size!4284 (buf!4733 thiss!1204))))))

(declare-fun b!181878 () Bool)

(declare-fun res!151092 () Bool)

(assert (=> b!181878 (=> res!151092 e!126262)))

(declare-fun lt!279320 () (_ BitVec 64))

(assert (=> b!181878 (= res!151092 (or (not (= (size!4284 (buf!4733 (_2!8487 lt!279321))) (size!4284 (buf!4733 thiss!1204)))) (not (= lt!279309 (bvsub (bvadd lt!279320 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181879 () Bool)

(assert (=> b!181879 (= e!126258 (= (bitIndex!0 (size!4284 (buf!4733 (_1!8490 lt!279324))) (currentByte!8955 (_1!8490 lt!279324)) (currentBit!8950 (_1!8490 lt!279324))) lt!279316))))

(declare-fun b!181880 () Bool)

(assert (=> b!181880 (= e!126256 (not e!126260))))

(declare-fun res!151099 () Bool)

(assert (=> b!181880 (=> res!151099 e!126260)))

(assert (=> b!181880 (= res!151099 (not (= lt!279311 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279320))))))

(assert (=> b!181880 (= lt!279311 (bitIndex!0 (size!4284 (buf!4733 (_2!8487 lt!279313))) (currentByte!8955 (_2!8487 lt!279313)) (currentBit!8950 (_2!8487 lt!279313))))))

(assert (=> b!181880 (= lt!279320 (bitIndex!0 (size!4284 (buf!4733 thiss!1204)) (currentByte!8955 thiss!1204) (currentBit!8950 thiss!1204)))))

(assert (=> b!181880 e!126261))

(declare-fun res!151096 () Bool)

(assert (=> b!181880 (=> (not res!151096) (not e!126261))))

(assert (=> b!181880 (= res!151096 (= (size!4284 (buf!4733 thiss!1204)) (size!4284 (buf!4733 (_2!8487 lt!279313)))))))

(declare-fun appendBit!0 (BitStream!7676 Bool) tuple2!15684)

(assert (=> b!181880 (= lt!279313 (appendBit!0 thiss!1204 lt!279310))))

(assert (=> b!181880 (= lt!279310 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181881 () Bool)

(assert (=> b!181881 (= e!126255 (invariant!0 (currentBit!8950 thiss!1204) (currentByte!8955 thiss!1204) (size!4284 (buf!4733 (_2!8487 lt!279321)))))))

(assert (= (and start!39954 res!151095) b!181875))

(assert (= (and b!181875 res!151091) b!181877))

(assert (= (and b!181877 res!151100) b!181869))

(assert (= (and b!181869 res!151093) b!181880))

(assert (= (and b!181880 res!151096) b!181876))

(assert (= (and b!181876 res!151102) b!181874))

(assert (= (and b!181874 res!151101) b!181871))

(assert (= (and b!181871 res!151089) b!181879))

(assert (= (and b!181880 (not res!151099)) b!181866))

(assert (= (and b!181866 (not res!151090)) b!181873))

(assert (= (and b!181873 (not res!151104)) b!181878))

(assert (= (and b!181878 (not res!151092)) b!181867))

(assert (= (and b!181867 (not res!151103)) b!181865))

(assert (= (and b!181865 (not res!151098)) b!181868))

(assert (= (and b!181868 res!151097) b!181881))

(assert (= (and b!181868 res!151094) b!181870))

(assert (= start!39954 b!181872))

(declare-fun m!282983 () Bool)

(assert (=> b!181867 m!282983))

(declare-fun m!282985 () Bool)

(assert (=> b!181871 m!282985))

(assert (=> b!181871 m!282985))

(declare-fun m!282987 () Bool)

(assert (=> b!181871 m!282987))

(declare-fun m!282989 () Bool)

(assert (=> b!181876 m!282989))

(declare-fun m!282991 () Bool)

(assert (=> b!181876 m!282991))

(declare-fun m!282993 () Bool)

(assert (=> b!181875 m!282993))

(declare-fun m!282995 () Bool)

(assert (=> b!181866 m!282995))

(declare-fun m!282997 () Bool)

(assert (=> b!181866 m!282997))

(declare-fun m!282999 () Bool)

(assert (=> b!181866 m!282999))

(declare-fun m!283001 () Bool)

(assert (=> b!181866 m!283001))

(declare-fun m!283003 () Bool)

(assert (=> b!181879 m!283003))

(declare-fun m!283005 () Bool)

(assert (=> b!181874 m!283005))

(declare-fun m!283007 () Bool)

(assert (=> b!181868 m!283007))

(declare-fun m!283009 () Bool)

(assert (=> b!181868 m!283009))

(declare-fun m!283011 () Bool)

(assert (=> b!181868 m!283011))

(declare-fun m!283013 () Bool)

(assert (=> b!181868 m!283013))

(declare-fun m!283015 () Bool)

(assert (=> b!181868 m!283015))

(declare-fun m!283017 () Bool)

(assert (=> b!181868 m!283017))

(declare-fun m!283019 () Bool)

(assert (=> b!181868 m!283019))

(declare-fun m!283021 () Bool)

(assert (=> b!181868 m!283021))

(declare-fun m!283023 () Bool)

(assert (=> b!181868 m!283023))

(declare-fun m!283025 () Bool)

(assert (=> b!181868 m!283025))

(declare-fun m!283027 () Bool)

(assert (=> b!181868 m!283027))

(declare-fun m!283029 () Bool)

(assert (=> b!181868 m!283029))

(declare-fun m!283031 () Bool)

(assert (=> b!181868 m!283031))

(declare-fun m!283033 () Bool)

(assert (=> start!39954 m!283033))

(assert (=> b!181865 m!283005))

(declare-fun m!283035 () Bool)

(assert (=> b!181877 m!283035))

(declare-fun m!283037 () Bool)

(assert (=> b!181881 m!283037))

(declare-fun m!283039 () Bool)

(assert (=> b!181872 m!283039))

(declare-fun m!283041 () Bool)

(assert (=> b!181873 m!283041))

(assert (=> b!181880 m!282989))

(assert (=> b!181880 m!282991))

(declare-fun m!283043 () Bool)

(assert (=> b!181880 m!283043))

(push 1)

