; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5630 () Bool)

(assert start!5630)

(declare-fun b!22887 () Bool)

(declare-fun e!15430 () Bool)

(declare-datatypes ((array!1553 0))(
  ( (array!1554 (arr!1118 (Array (_ BitVec 32) (_ BitVec 8))) (size!662 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1156 0))(
  ( (BitStream!1157 (buf!983 array!1553) (currentByte!2296 (_ BitVec 32)) (currentBit!2291 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1156)

(declare-fun array_inv!631 (array!1553) Bool)

(assert (=> b!22887 (= e!15430 (array_inv!631 (buf!983 thiss!1379)))))

(declare-fun b!22888 () Bool)

(declare-fun e!15433 () Bool)

(declare-fun e!15428 () Bool)

(assert (=> b!22888 (= e!15433 e!15428)))

(declare-fun res!19657 () Bool)

(assert (=> b!22888 (=> res!19657 e!15428)))

(declare-datatypes ((Unit!1967 0))(
  ( (Unit!1968) )
))
(declare-datatypes ((tuple2!2630 0))(
  ( (tuple2!2631 (_1!1402 Unit!1967) (_2!1402 BitStream!1156)) )
))
(declare-fun lt!33569 () tuple2!2630)

(declare-fun isPrefixOf!0 (BitStream!1156 BitStream!1156) Bool)

(assert (=> b!22888 (= res!19657 (not (isPrefixOf!0 thiss!1379 (_2!1402 lt!33569))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22888 (validate_offset_bits!1 ((_ sign_extend 32) (size!662 (buf!983 (_2!1402 lt!33569)))) ((_ sign_extend 32) (currentByte!2296 (_2!1402 lt!33569))) ((_ sign_extend 32) (currentBit!2291 (_2!1402 lt!33569))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33570 () Unit!1967)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1156 BitStream!1156 (_ BitVec 64) (_ BitVec 64)) Unit!1967)

(assert (=> b!22888 (= lt!33570 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1402 lt!33569) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1553)

(declare-fun appendBitFromByte!0 (BitStream!1156 (_ BitVec 8) (_ BitVec 32)) tuple2!2630)

(assert (=> b!22888 (= lt!33569 (appendBitFromByte!0 thiss!1379 (select (arr!1118 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!22889 () Bool)

(declare-fun e!15424 () Bool)

(assert (=> b!22889 (= e!15428 e!15424)))

(declare-fun res!19653 () Bool)

(assert (=> b!22889 (=> res!19653 e!15424)))

(declare-fun lt!33574 () tuple2!2630)

(assert (=> b!22889 (= res!19653 (not (isPrefixOf!0 (_2!1402 lt!33569) (_2!1402 lt!33574))))))

(assert (=> b!22889 (isPrefixOf!0 thiss!1379 (_2!1402 lt!33574))))

(declare-fun lt!33571 () Unit!1967)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1156 BitStream!1156 BitStream!1156) Unit!1967)

(assert (=> b!22889 (= lt!33571 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1402 lt!33569) (_2!1402 lt!33574)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1156 array!1553 (_ BitVec 64) (_ BitVec 64)) tuple2!2630)

(assert (=> b!22889 (= lt!33574 (appendBitsMSBFirstLoop!0 (_2!1402 lt!33569) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15426 () Bool)

(assert (=> b!22889 e!15426))

(declare-fun res!19654 () Bool)

(assert (=> b!22889 (=> (not res!19654) (not e!15426))))

(assert (=> b!22889 (= res!19654 (validate_offset_bits!1 ((_ sign_extend 32) (size!662 (buf!983 (_2!1402 lt!33569)))) ((_ sign_extend 32) (currentByte!2296 thiss!1379)) ((_ sign_extend 32) (currentBit!2291 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33566 () Unit!1967)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1156 array!1553 (_ BitVec 64)) Unit!1967)

(assert (=> b!22889 (= lt!33566 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!983 (_2!1402 lt!33569)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2632 0))(
  ( (tuple2!2633 (_1!1403 BitStream!1156) (_2!1403 BitStream!1156)) )
))
(declare-fun lt!33568 () tuple2!2632)

(declare-fun reader!0 (BitStream!1156 BitStream!1156) tuple2!2632)

(assert (=> b!22889 (= lt!33568 (reader!0 thiss!1379 (_2!1402 lt!33569)))))

(declare-fun b!22890 () Bool)

(declare-fun res!19656 () Bool)

(declare-fun e!15425 () Bool)

(assert (=> b!22890 (=> res!19656 e!15425)))

(assert (=> b!22890 (= res!19656 (not (= (size!662 (buf!983 thiss!1379)) (size!662 (buf!983 (_2!1402 lt!33574))))))))

(declare-fun b!22891 () Bool)

(declare-datatypes ((List!279 0))(
  ( (Nil!276) (Cons!275 (h!394 Bool) (t!1029 List!279)) )
))
(declare-fun head!116 (List!279) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1156 array!1553 (_ BitVec 64) (_ BitVec 64)) List!279)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1156 BitStream!1156 (_ BitVec 64)) List!279)

(assert (=> b!22891 (= e!15426 (= (head!116 (byteArrayBitContentToList!0 (_2!1402 lt!33569) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!116 (bitStreamReadBitsIntoList!0 (_2!1402 lt!33569) (_1!1403 lt!33568) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!22892 () Bool)

(assert (=> b!22892 (= e!15425 true)))

(declare-fun e!15429 () Bool)

(assert (=> b!22892 e!15429))

(declare-fun res!19659 () Bool)

(assert (=> b!22892 (=> (not res!19659) (not e!15429))))

(assert (=> b!22892 (= res!19659 (= (size!662 (buf!983 (_2!1402 lt!33574))) (size!662 (buf!983 thiss!1379))))))

(declare-fun b!22893 () Bool)

(declare-fun res!19650 () Bool)

(declare-fun e!15432 () Bool)

(assert (=> b!22893 (=> (not res!19650) (not e!15432))))

(assert (=> b!22893 (= res!19650 (validate_offset_bits!1 ((_ sign_extend 32) (size!662 (buf!983 thiss!1379))) ((_ sign_extend 32) (currentByte!2296 thiss!1379)) ((_ sign_extend 32) (currentBit!2291 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!19658 () Bool)

(assert (=> start!5630 (=> (not res!19658) (not e!15432))))

(assert (=> start!5630 (= res!19658 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!662 srcBuffer!2))))))))

(assert (=> start!5630 e!15432))

(assert (=> start!5630 true))

(assert (=> start!5630 (array_inv!631 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1156) Bool)

(assert (=> start!5630 (and (inv!12 thiss!1379) e!15430)))

(declare-fun b!22894 () Bool)

(assert (=> b!22894 (= e!15424 e!15425)))

(declare-fun res!19651 () Bool)

(assert (=> b!22894 (=> res!19651 e!15425)))

(declare-fun lt!33572 () (_ BitVec 64))

(declare-fun lt!33573 () (_ BitVec 64))

(assert (=> b!22894 (= res!19651 (not (= lt!33572 (bvsub (bvadd lt!33573 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22894 (= lt!33572 (bitIndex!0 (size!662 (buf!983 (_2!1402 lt!33574))) (currentByte!2296 (_2!1402 lt!33574)) (currentBit!2291 (_2!1402 lt!33574))))))

(declare-fun b!22895 () Bool)

(assert (=> b!22895 (= e!15432 (not e!15433))))

(declare-fun res!19655 () Bool)

(assert (=> b!22895 (=> res!19655 e!15433)))

(assert (=> b!22895 (= res!19655 (bvsge i!635 to!314))))

(assert (=> b!22895 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33567 () Unit!1967)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1156) Unit!1967)

(assert (=> b!22895 (= lt!33567 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!22895 (= lt!33573 (bitIndex!0 (size!662 (buf!983 thiss!1379)) (currentByte!2296 thiss!1379) (currentBit!2291 thiss!1379)))))

(declare-fun b!22896 () Bool)

(assert (=> b!22896 (= e!15429 (= lt!33572 (bvsub (bvsub (bvadd (bitIndex!0 (size!662 (buf!983 (_2!1402 lt!33569))) (currentByte!2296 (_2!1402 lt!33569)) (currentBit!2291 (_2!1402 lt!33569))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!22897 () Bool)

(declare-fun res!19652 () Bool)

(assert (=> b!22897 (=> res!19652 e!15425)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22897 (= res!19652 (not (invariant!0 (currentBit!2291 (_2!1402 lt!33574)) (currentByte!2296 (_2!1402 lt!33574)) (size!662 (buf!983 (_2!1402 lt!33574))))))))

(assert (= (and start!5630 res!19658) b!22893))

(assert (= (and b!22893 res!19650) b!22895))

(assert (= (and b!22895 (not res!19655)) b!22888))

(assert (= (and b!22888 (not res!19657)) b!22889))

(assert (= (and b!22889 res!19654) b!22891))

(assert (= (and b!22889 (not res!19653)) b!22894))

(assert (= (and b!22894 (not res!19651)) b!22897))

(assert (= (and b!22897 (not res!19652)) b!22890))

(assert (= (and b!22890 (not res!19656)) b!22892))

(assert (= (and b!22892 res!19659) b!22896))

(assert (= start!5630 b!22887))

(declare-fun m!32157 () Bool)

(assert (=> b!22896 m!32157))

(declare-fun m!32159 () Bool)

(assert (=> start!5630 m!32159))

(declare-fun m!32161 () Bool)

(assert (=> start!5630 m!32161))

(declare-fun m!32163 () Bool)

(assert (=> b!22889 m!32163))

(declare-fun m!32165 () Bool)

(assert (=> b!22889 m!32165))

(declare-fun m!32167 () Bool)

(assert (=> b!22889 m!32167))

(declare-fun m!32169 () Bool)

(assert (=> b!22889 m!32169))

(declare-fun m!32171 () Bool)

(assert (=> b!22889 m!32171))

(declare-fun m!32173 () Bool)

(assert (=> b!22889 m!32173))

(declare-fun m!32175 () Bool)

(assert (=> b!22889 m!32175))

(declare-fun m!32177 () Bool)

(assert (=> b!22888 m!32177))

(declare-fun m!32179 () Bool)

(assert (=> b!22888 m!32179))

(declare-fun m!32181 () Bool)

(assert (=> b!22888 m!32181))

(declare-fun m!32183 () Bool)

(assert (=> b!22888 m!32183))

(assert (=> b!22888 m!32179))

(declare-fun m!32185 () Bool)

(assert (=> b!22888 m!32185))

(declare-fun m!32187 () Bool)

(assert (=> b!22887 m!32187))

(declare-fun m!32189 () Bool)

(assert (=> b!22894 m!32189))

(declare-fun m!32191 () Bool)

(assert (=> b!22897 m!32191))

(declare-fun m!32193 () Bool)

(assert (=> b!22895 m!32193))

(declare-fun m!32195 () Bool)

(assert (=> b!22895 m!32195))

(declare-fun m!32197 () Bool)

(assert (=> b!22895 m!32197))

(declare-fun m!32199 () Bool)

(assert (=> b!22893 m!32199))

(declare-fun m!32201 () Bool)

(assert (=> b!22891 m!32201))

(assert (=> b!22891 m!32201))

(declare-fun m!32203 () Bool)

(assert (=> b!22891 m!32203))

(declare-fun m!32205 () Bool)

(assert (=> b!22891 m!32205))

(assert (=> b!22891 m!32205))

(declare-fun m!32207 () Bool)

(assert (=> b!22891 m!32207))

(push 1)

