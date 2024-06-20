; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44824 () Bool)

(assert start!44824)

(declare-fun b!215114 () Bool)

(declare-fun res!180938 () Bool)

(declare-fun e!146387 () Bool)

(assert (=> b!215114 (=> (not res!180938) (not e!146387))))

(declare-datatypes ((array!10587 0))(
  ( (array!10588 (arr!5580 (Array (_ BitVec 32) (_ BitVec 8))) (size!4650 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8408 0))(
  ( (BitStream!8409 (buf!5185 array!10587) (currentByte!9763 (_ BitVec 32)) (currentBit!9758 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18426 0))(
  ( (tuple2!18427 (_1!9868 BitStream!8408) (_2!9868 BitStream!8408)) )
))
(declare-fun lt!339801 () tuple2!18426)

(declare-fun lt!339797 () (_ BitVec 64))

(declare-fun lt!339782 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8408 (_ BitVec 64)) BitStream!8408)

(assert (=> b!215114 (= res!180938 (= (_1!9868 lt!339801) (withMovedBitIndex!0 (_2!9868 lt!339801) (bvsub lt!339797 lt!339782))))))

(declare-fun b!215115 () Bool)

(declare-fun e!146396 () Bool)

(declare-fun e!146389 () Bool)

(assert (=> b!215115 (= e!146396 e!146389)))

(declare-fun res!180940 () Bool)

(assert (=> b!215115 (=> (not res!180940) (not e!146389))))

(declare-datatypes ((tuple2!18428 0))(
  ( (tuple2!18429 (_1!9869 BitStream!8408) (_2!9869 Bool)) )
))
(declare-fun lt!339778 () tuple2!18428)

(declare-fun lt!339787 () Bool)

(declare-datatypes ((Unit!15284 0))(
  ( (Unit!15285) )
))
(declare-datatypes ((tuple2!18430 0))(
  ( (tuple2!18431 (_1!9870 Unit!15284) (_2!9870 BitStream!8408)) )
))
(declare-fun lt!339781 () tuple2!18430)

(assert (=> b!215115 (= res!180940 (and (= (_2!9869 lt!339778) lt!339787) (= (_1!9869 lt!339778) (_2!9870 lt!339781))))))

(declare-fun thiss!1204 () BitStream!8408)

(declare-fun readBitPure!0 (BitStream!8408) tuple2!18428)

(declare-fun readerFrom!0 (BitStream!8408 (_ BitVec 32) (_ BitVec 32)) BitStream!8408)

(assert (=> b!215115 (= lt!339778 (readBitPure!0 (readerFrom!0 (_2!9870 lt!339781) (currentBit!9758 thiss!1204) (currentByte!9763 thiss!1204))))))

(declare-fun b!215116 () Bool)

(declare-fun res!180935 () Bool)

(declare-fun e!146390 () Bool)

(assert (=> b!215116 (=> (not res!180935) (not e!146390))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!215116 (= res!180935 (not (= i!590 nBits!348)))))

(declare-fun b!215117 () Bool)

(declare-fun lt!339785 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215117 (= e!146389 (= (bitIndex!0 (size!4650 (buf!5185 (_1!9869 lt!339778))) (currentByte!9763 (_1!9869 lt!339778)) (currentBit!9758 (_1!9869 lt!339778))) lt!339785))))

(declare-fun b!215119 () Bool)

(declare-fun res!180927 () Bool)

(declare-fun e!146388 () Bool)

(assert (=> b!215119 (=> res!180927 e!146388)))

(declare-fun lt!339784 () tuple2!18430)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!215119 (= res!180927 (not (invariant!0 (currentBit!9758 (_2!9870 lt!339784)) (currentByte!9763 (_2!9870 lt!339784)) (size!4650 (buf!5185 (_2!9870 lt!339784))))))))

(declare-fun b!215120 () Bool)

(declare-fun res!180922 () Bool)

(assert (=> b!215120 (=> res!180922 e!146388)))

(declare-fun isPrefixOf!0 (BitStream!8408 BitStream!8408) Bool)

(assert (=> b!215120 (= res!180922 (not (isPrefixOf!0 (_2!9870 lt!339781) (_2!9870 lt!339784))))))

(declare-fun b!215121 () Bool)

(declare-fun res!180930 () Bool)

(declare-fun e!146394 () Bool)

(assert (=> b!215121 (=> res!180930 e!146394)))

(declare-datatypes ((tuple2!18432 0))(
  ( (tuple2!18433 (_1!9871 BitStream!8408) (_2!9871 (_ BitVec 64))) )
))
(declare-fun lt!339780 () tuple2!18432)

(assert (=> b!215121 (= res!180930 (not (= (bitIndex!0 (size!4650 (buf!5185 (_1!9871 lt!339780))) (currentByte!9763 (_1!9871 lt!339780)) (currentBit!9758 (_1!9871 lt!339780))) (bitIndex!0 (size!4650 (buf!5185 (_2!9868 lt!339801))) (currentByte!9763 (_2!9868 lt!339801)) (currentBit!9758 (_2!9868 lt!339801))))))))

(declare-fun b!215122 () Bool)

(declare-fun res!180926 () Bool)

(assert (=> b!215122 (=> res!180926 e!146388)))

(assert (=> b!215122 (= res!180926 (or (not (= (size!4650 (buf!5185 (_2!9870 lt!339784))) (size!4650 (buf!5185 thiss!1204)))) (not (= lt!339782 (bvsub (bvadd lt!339797 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun lt!339800 () tuple2!18426)

(declare-fun lt!339802 () BitStream!8408)

(declare-fun lt!339792 () tuple2!18432)

(declare-fun lt!339789 () (_ BitVec 64))

(declare-fun b!215123 () Bool)

(assert (=> b!215123 (= e!146387 (and (= lt!339797 (bvsub lt!339789 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9868 lt!339800) lt!339802)) (= (_2!9871 lt!339780) (_2!9871 lt!339792)))))))

(declare-fun b!215124 () Bool)

(declare-fun e!146392 () Bool)

(declare-fun lt!339793 () tuple2!18428)

(declare-fun lt!339779 () tuple2!18428)

(assert (=> b!215124 (= e!146392 (= (_2!9869 lt!339793) (_2!9869 lt!339779)))))

(declare-fun b!215125 () Bool)

(declare-fun res!180939 () Bool)

(assert (=> b!215125 (=> (not res!180939) (not e!146390))))

(assert (=> b!215125 (= res!180939 (invariant!0 (currentBit!9758 thiss!1204) (currentByte!9763 thiss!1204) (size!4650 (buf!5185 thiss!1204))))))

(declare-fun b!215126 () Bool)

(declare-fun e!146393 () Bool)

(declare-fun array_inv!4391 (array!10587) Bool)

(assert (=> b!215126 (= e!146393 (array_inv!4391 (buf!5185 thiss!1204)))))

(declare-fun b!215127 () Bool)

(declare-fun e!146391 () Bool)

(assert (=> b!215127 (= e!146391 e!146396)))

(declare-fun res!180931 () Bool)

(assert (=> b!215127 (=> (not res!180931) (not e!146396))))

(declare-fun lt!339805 () (_ BitVec 64))

(assert (=> b!215127 (= res!180931 (= lt!339785 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339805)))))

(assert (=> b!215127 (= lt!339785 (bitIndex!0 (size!4650 (buf!5185 (_2!9870 lt!339781))) (currentByte!9763 (_2!9870 lt!339781)) (currentBit!9758 (_2!9870 lt!339781))))))

(assert (=> b!215127 (= lt!339805 (bitIndex!0 (size!4650 (buf!5185 thiss!1204)) (currentByte!9763 thiss!1204) (currentBit!9758 thiss!1204)))))

(declare-fun b!215128 () Bool)

(declare-fun res!180921 () Bool)

(assert (=> b!215128 (=> (not res!180921) (not e!146396))))

(assert (=> b!215128 (= res!180921 (isPrefixOf!0 thiss!1204 (_2!9870 lt!339781)))))

(declare-fun b!215129 () Bool)

(declare-fun e!146395 () Bool)

(assert (=> b!215129 (= e!146395 e!146388)))

(declare-fun res!180925 () Bool)

(assert (=> b!215129 (=> res!180925 e!146388)))

(assert (=> b!215129 (= res!180925 (not (= lt!339782 (bvsub (bvsub (bvadd lt!339789 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!215129 (= lt!339782 (bitIndex!0 (size!4650 (buf!5185 (_2!9870 lt!339784))) (currentByte!9763 (_2!9870 lt!339784)) (currentBit!9758 (_2!9870 lt!339784))))))

(assert (=> b!215129 (isPrefixOf!0 thiss!1204 (_2!9870 lt!339784))))

(declare-fun lt!339786 () Unit!15284)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8408 BitStream!8408 BitStream!8408) Unit!15284)

(assert (=> b!215129 (= lt!339786 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9870 lt!339781) (_2!9870 lt!339784)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8408 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18430)

(assert (=> b!215129 (= lt!339784 (appendBitsLSBFirstLoopTR!0 (_2!9870 lt!339781) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!215130 () Bool)

(declare-fun res!180932 () Bool)

(assert (=> b!215130 (=> res!180932 e!146388)))

(assert (=> b!215130 (= res!180932 (not (isPrefixOf!0 thiss!1204 (_2!9870 lt!339781))))))

(declare-fun res!180941 () Bool)

(declare-fun e!146397 () Bool)

(assert (=> start!44824 (=> (not res!180941) (not e!146397))))

(assert (=> start!44824 (= res!180941 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44824 e!146397))

(assert (=> start!44824 true))

(declare-fun inv!12 (BitStream!8408) Bool)

(assert (=> start!44824 (and (inv!12 thiss!1204) e!146393)))

(declare-fun b!215118 () Bool)

(assert (=> b!215118 (= e!146397 e!146390)))

(declare-fun res!180929 () Bool)

(assert (=> b!215118 (=> (not res!180929) (not e!146390))))

(declare-fun lt!339791 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!215118 (= res!180929 (validate_offset_bits!1 ((_ sign_extend 32) (size!4650 (buf!5185 thiss!1204))) ((_ sign_extend 32) (currentByte!9763 thiss!1204)) ((_ sign_extend 32) (currentBit!9758 thiss!1204)) lt!339791))))

(assert (=> b!215118 (= lt!339791 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!215131 () Bool)

(declare-fun e!146386 () Bool)

(assert (=> b!215131 (= e!146386 (invariant!0 (currentBit!9758 thiss!1204) (currentByte!9763 thiss!1204) (size!4650 (buf!5185 (_2!9870 lt!339784)))))))

(declare-fun b!215132 () Bool)

(declare-fun e!146384 () Bool)

(assert (=> b!215132 (= e!146384 e!146394)))

(declare-fun res!180924 () Bool)

(assert (=> b!215132 (=> res!180924 e!146394)))

(assert (=> b!215132 (= res!180924 (not (= (_1!9868 lt!339800) lt!339802)))))

(assert (=> b!215132 e!146387))

(declare-fun res!180923 () Bool)

(assert (=> b!215132 (=> (not res!180923) (not e!146387))))

(declare-fun lt!339798 () tuple2!18432)

(assert (=> b!215132 (= res!180923 (and (= (_2!9871 lt!339780) (_2!9871 lt!339798)) (= (_1!9871 lt!339780) (_1!9871 lt!339798))))))

(declare-fun lt!339790 () Unit!15284)

(declare-fun lt!339788 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15284)

(assert (=> b!215132 (= lt!339790 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9868 lt!339801) nBits!348 i!590 lt!339788))))

(declare-fun lt!339794 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18432)

(assert (=> b!215132 (= lt!339798 (readNBitsLSBFirstsLoopPure!0 lt!339802 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339794))))

(assert (=> b!215132 (= lt!339802 (withMovedBitIndex!0 (_1!9868 lt!339801) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!215133 () Bool)

(assert (=> b!215133 (= e!146390 (not e!146395))))

(declare-fun res!180928 () Bool)

(assert (=> b!215133 (=> res!180928 e!146395)))

(assert (=> b!215133 (= res!180928 (not (= lt!339789 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339797))))))

(assert (=> b!215133 (= lt!339789 (bitIndex!0 (size!4650 (buf!5185 (_2!9870 lt!339781))) (currentByte!9763 (_2!9870 lt!339781)) (currentBit!9758 (_2!9870 lt!339781))))))

(assert (=> b!215133 (= lt!339797 (bitIndex!0 (size!4650 (buf!5185 thiss!1204)) (currentByte!9763 thiss!1204) (currentBit!9758 thiss!1204)))))

(assert (=> b!215133 e!146391))

(declare-fun res!180934 () Bool)

(assert (=> b!215133 (=> (not res!180934) (not e!146391))))

(assert (=> b!215133 (= res!180934 (= (size!4650 (buf!5185 thiss!1204)) (size!4650 (buf!5185 (_2!9870 lt!339781)))))))

(declare-fun appendBit!0 (BitStream!8408 Bool) tuple2!18430)

(assert (=> b!215133 (= lt!339781 (appendBit!0 thiss!1204 lt!339787))))

(declare-fun lt!339803 () (_ BitVec 64))

(assert (=> b!215133 (= lt!339787 (not (= (bvand v!189 lt!339803) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215133 (= lt!339803 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!215134 () Bool)

(declare-fun res!180920 () Bool)

(assert (=> b!215134 (=> (not res!180920) (not e!146387))))

(assert (=> b!215134 (= res!180920 (= (_1!9868 lt!339800) (withMovedBitIndex!0 (_2!9868 lt!339800) (bvsub lt!339789 lt!339782))))))

(declare-fun b!215135 () Bool)

(assert (=> b!215135 (= e!146388 e!146384)))

(declare-fun res!180936 () Bool)

(assert (=> b!215135 (=> res!180936 e!146384)))

(assert (=> b!215135 (= res!180936 (not (= (_1!9871 lt!339792) (_2!9868 lt!339800))))))

(assert (=> b!215135 (= lt!339792 (readNBitsLSBFirstsLoopPure!0 (_1!9868 lt!339800) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339794))))

(declare-fun lt!339795 () (_ BitVec 64))

(assert (=> b!215135 (validate_offset_bits!1 ((_ sign_extend 32) (size!4650 (buf!5185 (_2!9870 lt!339784)))) ((_ sign_extend 32) (currentByte!9763 (_2!9870 lt!339781))) ((_ sign_extend 32) (currentBit!9758 (_2!9870 lt!339781))) lt!339795)))

(declare-fun lt!339783 () Unit!15284)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8408 array!10587 (_ BitVec 64)) Unit!15284)

(assert (=> b!215135 (= lt!339783 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9870 lt!339781) (buf!5185 (_2!9870 lt!339784)) lt!339795))))

(assert (=> b!215135 (= lt!339795 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!339796 () tuple2!18428)

(assert (=> b!215135 (= lt!339794 (bvor lt!339788 (ite (_2!9869 lt!339796) lt!339803 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215135 (= lt!339780 (readNBitsLSBFirstsLoopPure!0 (_1!9868 lt!339801) nBits!348 i!590 lt!339788))))

(assert (=> b!215135 (validate_offset_bits!1 ((_ sign_extend 32) (size!4650 (buf!5185 (_2!9870 lt!339784)))) ((_ sign_extend 32) (currentByte!9763 thiss!1204)) ((_ sign_extend 32) (currentBit!9758 thiss!1204)) lt!339791)))

(declare-fun lt!339804 () Unit!15284)

(assert (=> b!215135 (= lt!339804 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5185 (_2!9870 lt!339784)) lt!339791))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215135 (= lt!339788 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!215135 (= (_2!9869 lt!339796) lt!339787)))

(assert (=> b!215135 (= lt!339796 (readBitPure!0 (_1!9868 lt!339801)))))

(declare-fun reader!0 (BitStream!8408 BitStream!8408) tuple2!18426)

(assert (=> b!215135 (= lt!339800 (reader!0 (_2!9870 lt!339781) (_2!9870 lt!339784)))))

(assert (=> b!215135 (= lt!339801 (reader!0 thiss!1204 (_2!9870 lt!339784)))))

(assert (=> b!215135 e!146392))

(declare-fun res!180937 () Bool)

(assert (=> b!215135 (=> (not res!180937) (not e!146392))))

(assert (=> b!215135 (= res!180937 (= (bitIndex!0 (size!4650 (buf!5185 (_1!9869 lt!339793))) (currentByte!9763 (_1!9869 lt!339793)) (currentBit!9758 (_1!9869 lt!339793))) (bitIndex!0 (size!4650 (buf!5185 (_1!9869 lt!339779))) (currentByte!9763 (_1!9869 lt!339779)) (currentBit!9758 (_1!9869 lt!339779)))))))

(declare-fun lt!339806 () Unit!15284)

(declare-fun lt!339799 () BitStream!8408)

(declare-fun readBitPrefixLemma!0 (BitStream!8408 BitStream!8408) Unit!15284)

(assert (=> b!215135 (= lt!339806 (readBitPrefixLemma!0 lt!339799 (_2!9870 lt!339784)))))

(assert (=> b!215135 (= lt!339779 (readBitPure!0 (BitStream!8409 (buf!5185 (_2!9870 lt!339784)) (currentByte!9763 thiss!1204) (currentBit!9758 thiss!1204))))))

(assert (=> b!215135 (= lt!339793 (readBitPure!0 lt!339799))))

(assert (=> b!215135 e!146386))

(declare-fun res!180933 () Bool)

(assert (=> b!215135 (=> (not res!180933) (not e!146386))))

(assert (=> b!215135 (= res!180933 (invariant!0 (currentBit!9758 thiss!1204) (currentByte!9763 thiss!1204) (size!4650 (buf!5185 (_2!9870 lt!339781)))))))

(assert (=> b!215135 (= lt!339799 (BitStream!8409 (buf!5185 (_2!9870 lt!339781)) (currentByte!9763 thiss!1204) (currentBit!9758 thiss!1204)))))

(declare-fun b!215136 () Bool)

(assert (=> b!215136 (= e!146394 (bvsge lt!339791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215136 (= (size!4650 (buf!5185 thiss!1204)) (size!4650 (buf!5185 (_2!9870 lt!339784))))))

(assert (= (and start!44824 res!180941) b!215118))

(assert (= (and b!215118 res!180929) b!215125))

(assert (= (and b!215125 res!180939) b!215116))

(assert (= (and b!215116 res!180935) b!215133))

(assert (= (and b!215133 res!180934) b!215127))

(assert (= (and b!215127 res!180931) b!215128))

(assert (= (and b!215128 res!180921) b!215115))

(assert (= (and b!215115 res!180940) b!215117))

(assert (= (and b!215133 (not res!180928)) b!215129))

(assert (= (and b!215129 (not res!180925)) b!215119))

(assert (= (and b!215119 (not res!180927)) b!215122))

(assert (= (and b!215122 (not res!180926)) b!215120))

(assert (= (and b!215120 (not res!180922)) b!215130))

(assert (= (and b!215130 (not res!180932)) b!215135))

(assert (= (and b!215135 res!180933) b!215131))

(assert (= (and b!215135 res!180937) b!215124))

(assert (= (and b!215135 (not res!180936)) b!215132))

(assert (= (and b!215132 res!180923) b!215114))

(assert (= (and b!215114 res!180938) b!215134))

(assert (= (and b!215134 res!180920) b!215123))

(assert (= (and b!215132 (not res!180924)) b!215121))

(assert (= (and b!215121 (not res!180930)) b!215136))

(assert (= start!44824 b!215126))

(declare-fun m!331295 () Bool)

(assert (=> b!215118 m!331295))

(declare-fun m!331297 () Bool)

(assert (=> b!215132 m!331297))

(declare-fun m!331299 () Bool)

(assert (=> b!215132 m!331299))

(declare-fun m!331301 () Bool)

(assert (=> b!215132 m!331301))

(declare-fun m!331303 () Bool)

(assert (=> b!215120 m!331303))

(declare-fun m!331305 () Bool)

(assert (=> b!215115 m!331305))

(assert (=> b!215115 m!331305))

(declare-fun m!331307 () Bool)

(assert (=> b!215115 m!331307))

(declare-fun m!331309 () Bool)

(assert (=> b!215133 m!331309))

(declare-fun m!331311 () Bool)

(assert (=> b!215133 m!331311))

(declare-fun m!331313 () Bool)

(assert (=> b!215133 m!331313))

(declare-fun m!331315 () Bool)

(assert (=> b!215114 m!331315))

(assert (=> b!215127 m!331309))

(assert (=> b!215127 m!331311))

(declare-fun m!331317 () Bool)

(assert (=> b!215129 m!331317))

(declare-fun m!331319 () Bool)

(assert (=> b!215129 m!331319))

(declare-fun m!331321 () Bool)

(assert (=> b!215129 m!331321))

(declare-fun m!331323 () Bool)

(assert (=> b!215129 m!331323))

(declare-fun m!331325 () Bool)

(assert (=> b!215121 m!331325))

(declare-fun m!331327 () Bool)

(assert (=> b!215121 m!331327))

(declare-fun m!331329 () Bool)

(assert (=> b!215117 m!331329))

(declare-fun m!331331 () Bool)

(assert (=> b!215130 m!331331))

(declare-fun m!331333 () Bool)

(assert (=> b!215134 m!331333))

(declare-fun m!331335 () Bool)

(assert (=> b!215126 m!331335))

(declare-fun m!331337 () Bool)

(assert (=> b!215135 m!331337))

(declare-fun m!331339 () Bool)

(assert (=> b!215135 m!331339))

(declare-fun m!331341 () Bool)

(assert (=> b!215135 m!331341))

(declare-fun m!331343 () Bool)

(assert (=> b!215135 m!331343))

(declare-fun m!331345 () Bool)

(assert (=> b!215135 m!331345))

(declare-fun m!331347 () Bool)

(assert (=> b!215135 m!331347))

(declare-fun m!331349 () Bool)

(assert (=> b!215135 m!331349))

(declare-fun m!331351 () Bool)

(assert (=> b!215135 m!331351))

(declare-fun m!331353 () Bool)

(assert (=> b!215135 m!331353))

(declare-fun m!331355 () Bool)

(assert (=> b!215135 m!331355))

(declare-fun m!331357 () Bool)

(assert (=> b!215135 m!331357))

(declare-fun m!331359 () Bool)

(assert (=> b!215135 m!331359))

(declare-fun m!331361 () Bool)

(assert (=> b!215135 m!331361))

(declare-fun m!331363 () Bool)

(assert (=> b!215135 m!331363))

(declare-fun m!331365 () Bool)

(assert (=> b!215135 m!331365))

(declare-fun m!331367 () Bool)

(assert (=> b!215135 m!331367))

(declare-fun m!331369 () Bool)

(assert (=> start!44824 m!331369))

(declare-fun m!331371 () Bool)

(assert (=> b!215125 m!331371))

(assert (=> b!215128 m!331331))

(declare-fun m!331373 () Bool)

(assert (=> b!215119 m!331373))

(declare-fun m!331375 () Bool)

(assert (=> b!215131 m!331375))

(push 1)

(assert (not b!215118))

(assert (not b!215129))

(assert (not b!215128))

(assert (not b!215134))

(assert (not b!215119))

(assert (not b!215121))

(assert (not b!215125))

(assert (not b!215132))

(assert (not b!215126))

(assert (not b!215115))

(assert (not b!215127))

(assert (not b!215114))

(assert (not b!215130))

(assert (not b!215135))

(assert (not b!215120))

(assert (not b!215131))

(assert (not b!215133))

(assert (not start!44824))

(assert (not b!215117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

