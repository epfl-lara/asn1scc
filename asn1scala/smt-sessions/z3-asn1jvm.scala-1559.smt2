; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43748 () Bool)

(assert start!43748)

(declare-fun b!207977 () Bool)

(declare-fun e!142114 () Bool)

(declare-datatypes ((array!10438 0))(
  ( (array!10439 (arr!5519 (Array (_ BitVec 32) (_ BitVec 8))) (size!4589 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8286 0))(
  ( (BitStream!8287 (buf!5097 array!10438) (currentByte!9621 (_ BitVec 32)) (currentBit!9616 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17830 0))(
  ( (tuple2!17831 (_1!9570 BitStream!8286) (_2!9570 Bool)) )
))
(declare-fun lt!324955 () tuple2!17830)

(declare-fun lt!324964 () tuple2!17830)

(assert (=> b!207977 (= e!142114 (= (_2!9570 lt!324955) (_2!9570 lt!324964)))))

(declare-fun b!207978 () Bool)

(declare-fun res!174517 () Bool)

(declare-fun e!142109 () Bool)

(assert (=> b!207978 (=> (not res!174517) (not e!142109))))

(declare-fun thiss!1204 () BitStream!8286)

(declare-datatypes ((Unit!14811 0))(
  ( (Unit!14812) )
))
(declare-datatypes ((tuple2!17832 0))(
  ( (tuple2!17833 (_1!9571 Unit!14811) (_2!9571 BitStream!8286)) )
))
(declare-fun lt!324951 () tuple2!17832)

(declare-fun isPrefixOf!0 (BitStream!8286 BitStream!8286) Bool)

(assert (=> b!207978 (= res!174517 (isPrefixOf!0 thiss!1204 (_2!9571 lt!324951)))))

(declare-fun b!207979 () Bool)

(declare-fun res!174509 () Bool)

(declare-fun e!142115 () Bool)

(assert (=> b!207979 (=> res!174509 e!142115)))

(declare-fun lt!324962 () tuple2!17832)

(assert (=> b!207979 (= res!174509 (not (isPrefixOf!0 (_2!9571 lt!324951) (_2!9571 lt!324962))))))

(declare-fun b!207980 () Bool)

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!207980 (= e!142115 (or (not (= (bvand i!590 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!590 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000))))))

(declare-fun lt!324965 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207980 (validate_offset_bits!1 ((_ sign_extend 32) (size!4589 (buf!5097 (_2!9571 lt!324962)))) ((_ sign_extend 32) (currentByte!9621 (_2!9571 lt!324951))) ((_ sign_extend 32) (currentBit!9616 (_2!9571 lt!324951))) lt!324965)))

(declare-fun lt!324949 () Unit!14811)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8286 array!10438 (_ BitVec 64)) Unit!14811)

(assert (=> b!207980 (= lt!324949 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9571 lt!324951) (buf!5097 (_2!9571 lt!324962)) lt!324965))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!207980 (= lt!324965 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!17834 0))(
  ( (tuple2!17835 (_1!9572 BitStream!8286) (_2!9572 BitStream!8286)) )
))
(declare-fun lt!324957 () tuple2!17834)

(declare-datatypes ((tuple2!17836 0))(
  ( (tuple2!17837 (_1!9573 BitStream!8286) (_2!9573 (_ BitVec 64))) )
))
(declare-fun lt!324946 () tuple2!17836)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17836)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207980 (= lt!324946 (readNBitsLSBFirstsLoopPure!0 (_1!9572 lt!324957) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!324947 () (_ BitVec 64))

(assert (=> b!207980 (validate_offset_bits!1 ((_ sign_extend 32) (size!4589 (buf!5097 (_2!9571 lt!324962)))) ((_ sign_extend 32) (currentByte!9621 thiss!1204)) ((_ sign_extend 32) (currentBit!9616 thiss!1204)) lt!324947)))

(declare-fun lt!324958 () Unit!14811)

(assert (=> b!207980 (= lt!324958 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5097 (_2!9571 lt!324962)) lt!324947))))

(declare-fun lt!324956 () Bool)

(declare-fun readBitPure!0 (BitStream!8286) tuple2!17830)

(assert (=> b!207980 (= (_2!9570 (readBitPure!0 (_1!9572 lt!324957))) lt!324956)))

(declare-fun lt!324948 () tuple2!17834)

(declare-fun reader!0 (BitStream!8286 BitStream!8286) tuple2!17834)

(assert (=> b!207980 (= lt!324948 (reader!0 (_2!9571 lt!324951) (_2!9571 lt!324962)))))

(assert (=> b!207980 (= lt!324957 (reader!0 thiss!1204 (_2!9571 lt!324962)))))

(assert (=> b!207980 e!142114))

(declare-fun res!174508 () Bool)

(assert (=> b!207980 (=> (not res!174508) (not e!142114))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207980 (= res!174508 (= (bitIndex!0 (size!4589 (buf!5097 (_1!9570 lt!324955))) (currentByte!9621 (_1!9570 lt!324955)) (currentBit!9616 (_1!9570 lt!324955))) (bitIndex!0 (size!4589 (buf!5097 (_1!9570 lt!324964))) (currentByte!9621 (_1!9570 lt!324964)) (currentBit!9616 (_1!9570 lt!324964)))))))

(declare-fun lt!324952 () Unit!14811)

(declare-fun lt!324961 () BitStream!8286)

(declare-fun readBitPrefixLemma!0 (BitStream!8286 BitStream!8286) Unit!14811)

(assert (=> b!207980 (= lt!324952 (readBitPrefixLemma!0 lt!324961 (_2!9571 lt!324962)))))

(assert (=> b!207980 (= lt!324964 (readBitPure!0 (BitStream!8287 (buf!5097 (_2!9571 lt!324962)) (currentByte!9621 thiss!1204) (currentBit!9616 thiss!1204))))))

(assert (=> b!207980 (= lt!324955 (readBitPure!0 lt!324961))))

(declare-fun e!142111 () Bool)

(assert (=> b!207980 e!142111))

(declare-fun res!174518 () Bool)

(assert (=> b!207980 (=> (not res!174518) (not e!142111))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207980 (= res!174518 (invariant!0 (currentBit!9616 thiss!1204) (currentByte!9621 thiss!1204) (size!4589 (buf!5097 (_2!9571 lt!324951)))))))

(assert (=> b!207980 (= lt!324961 (BitStream!8287 (buf!5097 (_2!9571 lt!324951)) (currentByte!9621 thiss!1204) (currentBit!9616 thiss!1204)))))

(declare-fun b!207981 () Bool)

(declare-fun res!174513 () Bool)

(assert (=> b!207981 (=> res!174513 e!142115)))

(declare-fun lt!324959 () (_ BitVec 64))

(declare-fun lt!324950 () (_ BitVec 64))

(assert (=> b!207981 (= res!174513 (or (not (= (size!4589 (buf!5097 (_2!9571 lt!324962))) (size!4589 (buf!5097 thiss!1204)))) (not (= lt!324959 (bvsub (bvadd lt!324950 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207982 () Bool)

(declare-fun res!174506 () Bool)

(assert (=> b!207982 (=> res!174506 e!142115)))

(assert (=> b!207982 (= res!174506 (not (invariant!0 (currentBit!9616 (_2!9571 lt!324962)) (currentByte!9621 (_2!9571 lt!324962)) (size!4589 (buf!5097 (_2!9571 lt!324962))))))))

(declare-fun b!207983 () Bool)

(declare-fun e!142116 () Bool)

(assert (=> b!207983 (= e!142116 e!142115)))

(declare-fun res!174521 () Bool)

(assert (=> b!207983 (=> res!174521 e!142115)))

(declare-fun lt!324960 () (_ BitVec 64))

(assert (=> b!207983 (= res!174521 (not (= lt!324959 (bvsub (bvsub (bvadd lt!324960 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!207983 (= lt!324959 (bitIndex!0 (size!4589 (buf!5097 (_2!9571 lt!324962))) (currentByte!9621 (_2!9571 lt!324962)) (currentBit!9616 (_2!9571 lt!324962))))))

(assert (=> b!207983 (isPrefixOf!0 thiss!1204 (_2!9571 lt!324962))))

(declare-fun lt!324953 () Unit!14811)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8286 BitStream!8286 BitStream!8286) Unit!14811)

(assert (=> b!207983 (= lt!324953 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9571 lt!324951) (_2!9571 lt!324962)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8286 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17832)

(assert (=> b!207983 (= lt!324962 (appendBitsLSBFirstLoopTR!0 (_2!9571 lt!324951) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207984 () Bool)

(declare-fun res!174511 () Bool)

(assert (=> b!207984 (=> res!174511 e!142115)))

(assert (=> b!207984 (= res!174511 (not (isPrefixOf!0 thiss!1204 (_2!9571 lt!324951))))))

(declare-fun b!207986 () Bool)

(assert (=> b!207986 (= e!142111 (invariant!0 (currentBit!9616 thiss!1204) (currentByte!9621 thiss!1204) (size!4589 (buf!5097 (_2!9571 lt!324962)))))))

(declare-fun b!207987 () Bool)

(declare-fun e!142112 () Bool)

(declare-fun e!142113 () Bool)

(assert (=> b!207987 (= e!142112 e!142113)))

(declare-fun res!174510 () Bool)

(assert (=> b!207987 (=> (not res!174510) (not e!142113))))

(assert (=> b!207987 (= res!174510 (validate_offset_bits!1 ((_ sign_extend 32) (size!4589 (buf!5097 thiss!1204))) ((_ sign_extend 32) (currentByte!9621 thiss!1204)) ((_ sign_extend 32) (currentBit!9616 thiss!1204)) lt!324947))))

(assert (=> b!207987 (= lt!324947 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207988 () Bool)

(declare-fun e!142110 () Bool)

(declare-fun lt!324954 () tuple2!17830)

(declare-fun lt!324963 () (_ BitVec 64))

(assert (=> b!207988 (= e!142110 (= (bitIndex!0 (size!4589 (buf!5097 (_1!9570 lt!324954))) (currentByte!9621 (_1!9570 lt!324954)) (currentBit!9616 (_1!9570 lt!324954))) lt!324963))))

(declare-fun b!207989 () Bool)

(assert (=> b!207989 (= e!142113 (not e!142116))))

(declare-fun res!174519 () Bool)

(assert (=> b!207989 (=> res!174519 e!142116)))

(assert (=> b!207989 (= res!174519 (not (= lt!324960 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!324950))))))

(assert (=> b!207989 (= lt!324960 (bitIndex!0 (size!4589 (buf!5097 (_2!9571 lt!324951))) (currentByte!9621 (_2!9571 lt!324951)) (currentBit!9616 (_2!9571 lt!324951))))))

(assert (=> b!207989 (= lt!324950 (bitIndex!0 (size!4589 (buf!5097 thiss!1204)) (currentByte!9621 thiss!1204) (currentBit!9616 thiss!1204)))))

(declare-fun e!142118 () Bool)

(assert (=> b!207989 e!142118))

(declare-fun res!174512 () Bool)

(assert (=> b!207989 (=> (not res!174512) (not e!142118))))

(assert (=> b!207989 (= res!174512 (= (size!4589 (buf!5097 thiss!1204)) (size!4589 (buf!5097 (_2!9571 lt!324951)))))))

(declare-fun appendBit!0 (BitStream!8286 Bool) tuple2!17832)

(assert (=> b!207989 (= lt!324951 (appendBit!0 thiss!1204 lt!324956))))

(assert (=> b!207989 (= lt!324956 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207990 () Bool)

(assert (=> b!207990 (= e!142118 e!142109)))

(declare-fun res!174520 () Bool)

(assert (=> b!207990 (=> (not res!174520) (not e!142109))))

(declare-fun lt!324945 () (_ BitVec 64))

(assert (=> b!207990 (= res!174520 (= lt!324963 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!324945)))))

(assert (=> b!207990 (= lt!324963 (bitIndex!0 (size!4589 (buf!5097 (_2!9571 lt!324951))) (currentByte!9621 (_2!9571 lt!324951)) (currentBit!9616 (_2!9571 lt!324951))))))

(assert (=> b!207990 (= lt!324945 (bitIndex!0 (size!4589 (buf!5097 thiss!1204)) (currentByte!9621 thiss!1204) (currentBit!9616 thiss!1204)))))

(declare-fun b!207991 () Bool)

(declare-fun e!142117 () Bool)

(declare-fun array_inv!4330 (array!10438) Bool)

(assert (=> b!207991 (= e!142117 (array_inv!4330 (buf!5097 thiss!1204)))))

(declare-fun b!207985 () Bool)

(declare-fun res!174515 () Bool)

(assert (=> b!207985 (=> (not res!174515) (not e!142113))))

(assert (=> b!207985 (= res!174515 (invariant!0 (currentBit!9616 thiss!1204) (currentByte!9621 thiss!1204) (size!4589 (buf!5097 thiss!1204))))))

(declare-fun res!174516 () Bool)

(assert (=> start!43748 (=> (not res!174516) (not e!142112))))

(assert (=> start!43748 (= res!174516 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43748 e!142112))

(assert (=> start!43748 true))

(declare-fun inv!12 (BitStream!8286) Bool)

(assert (=> start!43748 (and (inv!12 thiss!1204) e!142117)))

(declare-fun b!207992 () Bool)

(declare-fun res!174507 () Bool)

(assert (=> b!207992 (=> (not res!174507) (not e!142113))))

(assert (=> b!207992 (= res!174507 (not (= i!590 nBits!348)))))

(declare-fun b!207993 () Bool)

(assert (=> b!207993 (= e!142109 e!142110)))

(declare-fun res!174514 () Bool)

(assert (=> b!207993 (=> (not res!174514) (not e!142110))))

(assert (=> b!207993 (= res!174514 (and (= (_2!9570 lt!324954) lt!324956) (= (_1!9570 lt!324954) (_2!9571 lt!324951))))))

(declare-fun readerFrom!0 (BitStream!8286 (_ BitVec 32) (_ BitVec 32)) BitStream!8286)

(assert (=> b!207993 (= lt!324954 (readBitPure!0 (readerFrom!0 (_2!9571 lt!324951) (currentBit!9616 thiss!1204) (currentByte!9621 thiss!1204))))))

(assert (= (and start!43748 res!174516) b!207987))

(assert (= (and b!207987 res!174510) b!207985))

(assert (= (and b!207985 res!174515) b!207992))

(assert (= (and b!207992 res!174507) b!207989))

(assert (= (and b!207989 res!174512) b!207990))

(assert (= (and b!207990 res!174520) b!207978))

(assert (= (and b!207978 res!174517) b!207993))

(assert (= (and b!207993 res!174514) b!207988))

(assert (= (and b!207989 (not res!174519)) b!207983))

(assert (= (and b!207983 (not res!174521)) b!207982))

(assert (= (and b!207982 (not res!174506)) b!207981))

(assert (= (and b!207981 (not res!174513)) b!207979))

(assert (= (and b!207979 (not res!174509)) b!207984))

(assert (= (and b!207984 (not res!174511)) b!207980))

(assert (= (and b!207980 res!174518) b!207986))

(assert (= (and b!207980 res!174508) b!207977))

(assert (= start!43748 b!207991))

(declare-fun m!320049 () Bool)

(assert (=> b!207979 m!320049))

(declare-fun m!320051 () Bool)

(assert (=> b!207989 m!320051))

(declare-fun m!320053 () Bool)

(assert (=> b!207989 m!320053))

(declare-fun m!320055 () Bool)

(assert (=> b!207989 m!320055))

(declare-fun m!320057 () Bool)

(assert (=> b!207986 m!320057))

(declare-fun m!320059 () Bool)

(assert (=> b!207985 m!320059))

(declare-fun m!320061 () Bool)

(assert (=> b!207978 m!320061))

(assert (=> b!207990 m!320051))

(assert (=> b!207990 m!320053))

(declare-fun m!320063 () Bool)

(assert (=> b!207988 m!320063))

(declare-fun m!320065 () Bool)

(assert (=> b!207987 m!320065))

(declare-fun m!320067 () Bool)

(assert (=> b!207991 m!320067))

(declare-fun m!320069 () Bool)

(assert (=> b!207982 m!320069))

(declare-fun m!320071 () Bool)

(assert (=> start!43748 m!320071))

(declare-fun m!320073 () Bool)

(assert (=> b!207993 m!320073))

(assert (=> b!207993 m!320073))

(declare-fun m!320075 () Bool)

(assert (=> b!207993 m!320075))

(declare-fun m!320077 () Bool)

(assert (=> b!207983 m!320077))

(declare-fun m!320079 () Bool)

(assert (=> b!207983 m!320079))

(declare-fun m!320081 () Bool)

(assert (=> b!207983 m!320081))

(declare-fun m!320083 () Bool)

(assert (=> b!207983 m!320083))

(declare-fun m!320085 () Bool)

(assert (=> b!207980 m!320085))

(declare-fun m!320087 () Bool)

(assert (=> b!207980 m!320087))

(declare-fun m!320089 () Bool)

(assert (=> b!207980 m!320089))

(declare-fun m!320091 () Bool)

(assert (=> b!207980 m!320091))

(declare-fun m!320093 () Bool)

(assert (=> b!207980 m!320093))

(declare-fun m!320095 () Bool)

(assert (=> b!207980 m!320095))

(declare-fun m!320097 () Bool)

(assert (=> b!207980 m!320097))

(declare-fun m!320099 () Bool)

(assert (=> b!207980 m!320099))

(declare-fun m!320101 () Bool)

(assert (=> b!207980 m!320101))

(declare-fun m!320103 () Bool)

(assert (=> b!207980 m!320103))

(declare-fun m!320105 () Bool)

(assert (=> b!207980 m!320105))

(declare-fun m!320107 () Bool)

(assert (=> b!207980 m!320107))

(declare-fun m!320109 () Bool)

(assert (=> b!207980 m!320109))

(declare-fun m!320111 () Bool)

(assert (=> b!207980 m!320111))

(declare-fun m!320113 () Bool)

(assert (=> b!207980 m!320113))

(assert (=> b!207984 m!320061))

(check-sat (not b!207986) (not b!207984) (not b!207985) (not b!207991) (not b!207987) (not b!207983) (not b!207982) (not b!207988) (not b!207978) (not b!207993) (not b!207980) (not start!43748) (not b!207989) (not b!207990) (not b!207979))
(check-sat)
