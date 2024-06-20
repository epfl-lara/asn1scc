; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43746 () Bool)

(assert start!43746)

(declare-fun b!207926 () Bool)

(declare-fun res!174460 () Bool)

(declare-fun e!142078 () Bool)

(assert (=> b!207926 (=> (not res!174460) (not e!142078))))

(declare-datatypes ((array!10436 0))(
  ( (array!10437 (arr!5518 (Array (_ BitVec 32) (_ BitVec 8))) (size!4588 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8284 0))(
  ( (BitStream!8285 (buf!5096 array!10436) (currentByte!9620 (_ BitVec 32)) (currentBit!9615 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8284)

(declare-datatypes ((Unit!14809 0))(
  ( (Unit!14810) )
))
(declare-datatypes ((tuple2!17822 0))(
  ( (tuple2!17823 (_1!9566 Unit!14809) (_2!9566 BitStream!8284)) )
))
(declare-fun lt!324902 () tuple2!17822)

(declare-fun isPrefixOf!0 (BitStream!8284 BitStream!8284) Bool)

(assert (=> b!207926 (= res!174460 (isPrefixOf!0 thiss!1204 (_2!9566 lt!324902)))))

(declare-fun b!207927 () Bool)

(declare-fun e!142086 () Bool)

(declare-datatypes ((tuple2!17824 0))(
  ( (tuple2!17825 (_1!9567 BitStream!8284) (_2!9567 Bool)) )
))
(declare-fun lt!324893 () tuple2!17824)

(declare-fun lt!324900 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207927 (= e!142086 (= (bitIndex!0 (size!4588 (buf!5096 (_1!9567 lt!324893))) (currentByte!9620 (_1!9567 lt!324893)) (currentBit!9615 (_1!9567 lt!324893))) lt!324900))))

(declare-fun b!207929 () Bool)

(declare-fun e!142079 () Bool)

(declare-fun e!142084 () Bool)

(assert (=> b!207929 (= e!142079 (not e!142084))))

(declare-fun res!174468 () Bool)

(assert (=> b!207929 (=> res!174468 e!142084)))

(declare-fun lt!324882 () (_ BitVec 64))

(declare-fun lt!324883 () (_ BitVec 64))

(assert (=> b!207929 (= res!174468 (not (= lt!324882 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!324883))))))

(assert (=> b!207929 (= lt!324882 (bitIndex!0 (size!4588 (buf!5096 (_2!9566 lt!324902))) (currentByte!9620 (_2!9566 lt!324902)) (currentBit!9615 (_2!9566 lt!324902))))))

(assert (=> b!207929 (= lt!324883 (bitIndex!0 (size!4588 (buf!5096 thiss!1204)) (currentByte!9620 thiss!1204) (currentBit!9615 thiss!1204)))))

(declare-fun e!142077 () Bool)

(assert (=> b!207929 e!142077))

(declare-fun res!174459 () Bool)

(assert (=> b!207929 (=> (not res!174459) (not e!142077))))

(assert (=> b!207929 (= res!174459 (= (size!4588 (buf!5096 thiss!1204)) (size!4588 (buf!5096 (_2!9566 lt!324902)))))))

(declare-fun lt!324884 () Bool)

(declare-fun appendBit!0 (BitStream!8284 Bool) tuple2!17822)

(assert (=> b!207929 (= lt!324902 (appendBit!0 thiss!1204 lt!324884))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!207929 (= lt!324884 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207930 () Bool)

(declare-fun res!174472 () Bool)

(declare-fun e!142081 () Bool)

(assert (=> b!207930 (=> res!174472 e!142081)))

(declare-fun lt!324901 () tuple2!17822)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207930 (= res!174472 (not (invariant!0 (currentBit!9615 (_2!9566 lt!324901)) (currentByte!9620 (_2!9566 lt!324901)) (size!4588 (buf!5096 (_2!9566 lt!324901))))))))

(declare-fun b!207931 () Bool)

(declare-fun res!174471 () Bool)

(assert (=> b!207931 (=> (not res!174471) (not e!142079))))

(assert (=> b!207931 (= res!174471 (invariant!0 (currentBit!9615 thiss!1204) (currentByte!9620 thiss!1204) (size!4588 (buf!5096 thiss!1204))))))

(declare-fun b!207932 () Bool)

(declare-fun res!174466 () Bool)

(assert (=> b!207932 (=> res!174466 e!142081)))

(assert (=> b!207932 (= res!174466 (not (isPrefixOf!0 thiss!1204 (_2!9566 lt!324902))))))

(declare-fun b!207933 () Bool)

(declare-fun e!142085 () Bool)

(assert (=> b!207933 (= e!142085 e!142079)))

(declare-fun res!174465 () Bool)

(assert (=> b!207933 (=> (not res!174465) (not e!142079))))

(declare-fun lt!324892 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207933 (= res!174465 (validate_offset_bits!1 ((_ sign_extend 32) (size!4588 (buf!5096 thiss!1204))) ((_ sign_extend 32) (currentByte!9620 thiss!1204)) ((_ sign_extend 32) (currentBit!9615 thiss!1204)) lt!324892))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!207933 (= lt!324892 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207934 () Bool)

(declare-fun res!174463 () Bool)

(assert (=> b!207934 (=> res!174463 e!142081)))

(assert (=> b!207934 (= res!174463 (not (isPrefixOf!0 (_2!9566 lt!324902) (_2!9566 lt!324901))))))

(declare-fun b!207935 () Bool)

(assert (=> b!207935 (= e!142078 e!142086)))

(declare-fun res!174469 () Bool)

(assert (=> b!207935 (=> (not res!174469) (not e!142086))))

(assert (=> b!207935 (= res!174469 (and (= (_2!9567 lt!324893) lt!324884) (= (_1!9567 lt!324893) (_2!9566 lt!324902))))))

(declare-fun readBitPure!0 (BitStream!8284) tuple2!17824)

(declare-fun readerFrom!0 (BitStream!8284 (_ BitVec 32) (_ BitVec 32)) BitStream!8284)

(assert (=> b!207935 (= lt!324893 (readBitPure!0 (readerFrom!0 (_2!9566 lt!324902) (currentBit!9615 thiss!1204) (currentByte!9620 thiss!1204))))))

(declare-fun b!207936 () Bool)

(assert (=> b!207936 (= e!142084 e!142081)))

(declare-fun res!174458 () Bool)

(assert (=> b!207936 (=> res!174458 e!142081)))

(declare-fun lt!324894 () (_ BitVec 64))

(assert (=> b!207936 (= res!174458 (not (= lt!324894 (bvsub (bvsub (bvadd lt!324882 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!207936 (= lt!324894 (bitIndex!0 (size!4588 (buf!5096 (_2!9566 lt!324901))) (currentByte!9620 (_2!9566 lt!324901)) (currentBit!9615 (_2!9566 lt!324901))))))

(assert (=> b!207936 (isPrefixOf!0 thiss!1204 (_2!9566 lt!324901))))

(declare-fun lt!324886 () Unit!14809)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8284 BitStream!8284 BitStream!8284) Unit!14809)

(assert (=> b!207936 (= lt!324886 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9566 lt!324902) (_2!9566 lt!324901)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8284 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17822)

(assert (=> b!207936 (= lt!324901 (appendBitsLSBFirstLoopTR!0 (_2!9566 lt!324902) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207937 () Bool)

(declare-fun e!142082 () Bool)

(assert (=> b!207937 (= e!142082 (invariant!0 (currentBit!9615 thiss!1204) (currentByte!9620 thiss!1204) (size!4588 (buf!5096 (_2!9566 lt!324901)))))))

(declare-fun b!207938 () Bool)

(declare-fun e!142083 () Bool)

(declare-fun array_inv!4329 (array!10436) Bool)

(assert (=> b!207938 (= e!142083 (array_inv!4329 (buf!5096 thiss!1204)))))

(declare-fun res!174473 () Bool)

(assert (=> start!43746 (=> (not res!174473) (not e!142085))))

(assert (=> start!43746 (= res!174473 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43746 e!142085))

(assert (=> start!43746 true))

(declare-fun inv!12 (BitStream!8284) Bool)

(assert (=> start!43746 (and (inv!12 thiss!1204) e!142083)))

(declare-fun b!207928 () Bool)

(declare-fun e!142076 () Bool)

(declare-fun lt!324889 () tuple2!17824)

(declare-fun lt!324896 () tuple2!17824)

(assert (=> b!207928 (= e!142076 (= (_2!9567 lt!324889) (_2!9567 lt!324896)))))

(declare-fun b!207939 () Bool)

(declare-fun res!174461 () Bool)

(assert (=> b!207939 (=> res!174461 e!142081)))

(assert (=> b!207939 (= res!174461 (or (not (= (size!4588 (buf!5096 (_2!9566 lt!324901))) (size!4588 (buf!5096 thiss!1204)))) (not (= lt!324894 (bvsub (bvadd lt!324883 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207940 () Bool)

(assert (=> b!207940 (= e!142077 e!142078)))

(declare-fun res!174464 () Bool)

(assert (=> b!207940 (=> (not res!174464) (not e!142078))))

(declare-fun lt!324885 () (_ BitVec 64))

(assert (=> b!207940 (= res!174464 (= lt!324900 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!324885)))))

(assert (=> b!207940 (= lt!324900 (bitIndex!0 (size!4588 (buf!5096 (_2!9566 lt!324902))) (currentByte!9620 (_2!9566 lt!324902)) (currentBit!9615 (_2!9566 lt!324902))))))

(assert (=> b!207940 (= lt!324885 (bitIndex!0 (size!4588 (buf!5096 thiss!1204)) (currentByte!9620 thiss!1204) (currentBit!9615 thiss!1204)))))

(declare-fun b!207941 () Bool)

(assert (=> b!207941 (= e!142081 (or (not (= (bvand i!590 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!590 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000))))))

(declare-fun lt!324895 () (_ BitVec 64))

(assert (=> b!207941 (validate_offset_bits!1 ((_ sign_extend 32) (size!4588 (buf!5096 (_2!9566 lt!324901)))) ((_ sign_extend 32) (currentByte!9620 (_2!9566 lt!324902))) ((_ sign_extend 32) (currentBit!9615 (_2!9566 lt!324902))) lt!324895)))

(declare-fun lt!324897 () Unit!14809)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8284 array!10436 (_ BitVec 64)) Unit!14809)

(assert (=> b!207941 (= lt!324897 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9566 lt!324902) (buf!5096 (_2!9566 lt!324901)) lt!324895))))

(assert (=> b!207941 (= lt!324895 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!17826 0))(
  ( (tuple2!17827 (_1!9568 BitStream!8284) (_2!9568 BitStream!8284)) )
))
(declare-fun lt!324888 () tuple2!17826)

(declare-datatypes ((tuple2!17828 0))(
  ( (tuple2!17829 (_1!9569 BitStream!8284) (_2!9569 (_ BitVec 64))) )
))
(declare-fun lt!324891 () tuple2!17828)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17828)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207941 (= lt!324891 (readNBitsLSBFirstsLoopPure!0 (_1!9568 lt!324888) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!207941 (validate_offset_bits!1 ((_ sign_extend 32) (size!4588 (buf!5096 (_2!9566 lt!324901)))) ((_ sign_extend 32) (currentByte!9620 thiss!1204)) ((_ sign_extend 32) (currentBit!9615 thiss!1204)) lt!324892)))

(declare-fun lt!324899 () Unit!14809)

(assert (=> b!207941 (= lt!324899 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5096 (_2!9566 lt!324901)) lt!324892))))

(assert (=> b!207941 (= (_2!9567 (readBitPure!0 (_1!9568 lt!324888))) lt!324884)))

(declare-fun lt!324887 () tuple2!17826)

(declare-fun reader!0 (BitStream!8284 BitStream!8284) tuple2!17826)

(assert (=> b!207941 (= lt!324887 (reader!0 (_2!9566 lt!324902) (_2!9566 lt!324901)))))

(assert (=> b!207941 (= lt!324888 (reader!0 thiss!1204 (_2!9566 lt!324901)))))

(assert (=> b!207941 e!142076))

(declare-fun res!174467 () Bool)

(assert (=> b!207941 (=> (not res!174467) (not e!142076))))

(assert (=> b!207941 (= res!174467 (= (bitIndex!0 (size!4588 (buf!5096 (_1!9567 lt!324889))) (currentByte!9620 (_1!9567 lt!324889)) (currentBit!9615 (_1!9567 lt!324889))) (bitIndex!0 (size!4588 (buf!5096 (_1!9567 lt!324896))) (currentByte!9620 (_1!9567 lt!324896)) (currentBit!9615 (_1!9567 lt!324896)))))))

(declare-fun lt!324890 () Unit!14809)

(declare-fun lt!324898 () BitStream!8284)

(declare-fun readBitPrefixLemma!0 (BitStream!8284 BitStream!8284) Unit!14809)

(assert (=> b!207941 (= lt!324890 (readBitPrefixLemma!0 lt!324898 (_2!9566 lt!324901)))))

(assert (=> b!207941 (= lt!324896 (readBitPure!0 (BitStream!8285 (buf!5096 (_2!9566 lt!324901)) (currentByte!9620 thiss!1204) (currentBit!9615 thiss!1204))))))

(assert (=> b!207941 (= lt!324889 (readBitPure!0 lt!324898))))

(assert (=> b!207941 e!142082))

(declare-fun res!174462 () Bool)

(assert (=> b!207941 (=> (not res!174462) (not e!142082))))

(assert (=> b!207941 (= res!174462 (invariant!0 (currentBit!9615 thiss!1204) (currentByte!9620 thiss!1204) (size!4588 (buf!5096 (_2!9566 lt!324902)))))))

(assert (=> b!207941 (= lt!324898 (BitStream!8285 (buf!5096 (_2!9566 lt!324902)) (currentByte!9620 thiss!1204) (currentBit!9615 thiss!1204)))))

(declare-fun b!207942 () Bool)

(declare-fun res!174470 () Bool)

(assert (=> b!207942 (=> (not res!174470) (not e!142079))))

(assert (=> b!207942 (= res!174470 (not (= i!590 nBits!348)))))

(assert (= (and start!43746 res!174473) b!207933))

(assert (= (and b!207933 res!174465) b!207931))

(assert (= (and b!207931 res!174471) b!207942))

(assert (= (and b!207942 res!174470) b!207929))

(assert (= (and b!207929 res!174459) b!207940))

(assert (= (and b!207940 res!174464) b!207926))

(assert (= (and b!207926 res!174460) b!207935))

(assert (= (and b!207935 res!174469) b!207927))

(assert (= (and b!207929 (not res!174468)) b!207936))

(assert (= (and b!207936 (not res!174458)) b!207930))

(assert (= (and b!207930 (not res!174472)) b!207939))

(assert (= (and b!207939 (not res!174461)) b!207934))

(assert (= (and b!207934 (not res!174463)) b!207932))

(assert (= (and b!207932 (not res!174466)) b!207941))

(assert (= (and b!207941 res!174462) b!207937))

(assert (= (and b!207941 res!174467) b!207928))

(assert (= start!43746 b!207938))

(declare-fun m!319983 () Bool)

(assert (=> b!207941 m!319983))

(declare-fun m!319985 () Bool)

(assert (=> b!207941 m!319985))

(declare-fun m!319987 () Bool)

(assert (=> b!207941 m!319987))

(declare-fun m!319989 () Bool)

(assert (=> b!207941 m!319989))

(declare-fun m!319991 () Bool)

(assert (=> b!207941 m!319991))

(declare-fun m!319993 () Bool)

(assert (=> b!207941 m!319993))

(declare-fun m!319995 () Bool)

(assert (=> b!207941 m!319995))

(declare-fun m!319997 () Bool)

(assert (=> b!207941 m!319997))

(declare-fun m!319999 () Bool)

(assert (=> b!207941 m!319999))

(declare-fun m!320001 () Bool)

(assert (=> b!207941 m!320001))

(declare-fun m!320003 () Bool)

(assert (=> b!207941 m!320003))

(declare-fun m!320005 () Bool)

(assert (=> b!207941 m!320005))

(declare-fun m!320007 () Bool)

(assert (=> b!207941 m!320007))

(declare-fun m!320009 () Bool)

(assert (=> b!207941 m!320009))

(declare-fun m!320011 () Bool)

(assert (=> b!207941 m!320011))

(declare-fun m!320013 () Bool)

(assert (=> start!43746 m!320013))

(declare-fun m!320015 () Bool)

(assert (=> b!207926 m!320015))

(assert (=> b!207932 m!320015))

(declare-fun m!320017 () Bool)

(assert (=> b!207934 m!320017))

(declare-fun m!320019 () Bool)

(assert (=> b!207929 m!320019))

(declare-fun m!320021 () Bool)

(assert (=> b!207929 m!320021))

(declare-fun m!320023 () Bool)

(assert (=> b!207929 m!320023))

(assert (=> b!207940 m!320019))

(assert (=> b!207940 m!320021))

(declare-fun m!320025 () Bool)

(assert (=> b!207933 m!320025))

(declare-fun m!320027 () Bool)

(assert (=> b!207936 m!320027))

(declare-fun m!320029 () Bool)

(assert (=> b!207936 m!320029))

(declare-fun m!320031 () Bool)

(assert (=> b!207936 m!320031))

(declare-fun m!320033 () Bool)

(assert (=> b!207936 m!320033))

(declare-fun m!320035 () Bool)

(assert (=> b!207937 m!320035))

(declare-fun m!320037 () Bool)

(assert (=> b!207938 m!320037))

(declare-fun m!320039 () Bool)

(assert (=> b!207930 m!320039))

(declare-fun m!320041 () Bool)

(assert (=> b!207927 m!320041))

(declare-fun m!320043 () Bool)

(assert (=> b!207935 m!320043))

(assert (=> b!207935 m!320043))

(declare-fun m!320045 () Bool)

(assert (=> b!207935 m!320045))

(declare-fun m!320047 () Bool)

(assert (=> b!207931 m!320047))

(push 1)

(assert (not b!207935))

(assert (not b!207934))

(assert (not b!207929))

(assert (not b!207932))

(assert (not b!207930))

(assert (not b!207938))

(assert (not start!43746))

(assert (not b!207937))

(assert (not b!207931))

(assert (not b!207927))

(assert (not b!207933))

(assert (not b!207926))

(assert (not b!207941))

(assert (not b!207936))

(assert (not b!207940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

