; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5720 () Bool)

(assert start!5720)

(declare-fun b!24756 () Bool)

(declare-fun res!21396 () Bool)

(declare-fun e!16907 () Bool)

(assert (=> b!24756 (=> (not res!21396) (not e!16907))))

(declare-datatypes ((array!1643 0))(
  ( (array!1644 (arr!1163 (Array (_ BitVec 32) (_ BitVec 8))) (size!707 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1246 0))(
  ( (BitStream!1247 (buf!1028 array!1643) (currentByte!2341 (_ BitVec 32)) (currentBit!2336 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1246)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24756 (= res!21396 (validate_offset_bits!1 ((_ sign_extend 32) (size!707 (buf!1028 thiss!1379))) ((_ sign_extend 32) (currentByte!2341 thiss!1379)) ((_ sign_extend 32) (currentBit!2336 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24757 () Bool)

(declare-fun e!16905 () Bool)

(declare-fun array_inv!676 (array!1643) Bool)

(assert (=> b!24757 (= e!16905 (array_inv!676 (buf!1028 thiss!1379)))))

(declare-fun res!21388 () Bool)

(assert (=> start!5720 (=> (not res!21388) (not e!16907))))

(declare-fun srcBuffer!2 () array!1643)

(assert (=> start!5720 (= res!21388 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!707 srcBuffer!2))))))))

(assert (=> start!5720 e!16907))

(assert (=> start!5720 true))

(assert (=> start!5720 (array_inv!676 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1246) Bool)

(assert (=> start!5720 (and (inv!12 thiss!1379) e!16905)))

(declare-fun b!24758 () Bool)

(declare-fun res!21393 () Bool)

(declare-fun e!16911 () Bool)

(assert (=> b!24758 (=> res!21393 e!16911)))

(declare-datatypes ((Unit!2057 0))(
  ( (Unit!2058) )
))
(declare-datatypes ((tuple2!2810 0))(
  ( (tuple2!2811 (_1!1492 Unit!2057) (_2!1492 BitStream!1246)) )
))
(declare-fun lt!35240 () tuple2!2810)

(assert (=> b!24758 (= res!21393 (not (= (size!707 (buf!1028 thiss!1379)) (size!707 (buf!1028 (_2!1492 lt!35240))))))))

(declare-fun b!24759 () Bool)

(declare-fun e!16904 () Bool)

(assert (=> b!24759 (= e!16904 e!16911)))

(declare-fun res!21395 () Bool)

(assert (=> b!24759 (=> res!21395 e!16911)))

(declare-fun lt!35232 () (_ BitVec 64))

(declare-fun lt!35241 () (_ BitVec 64))

(assert (=> b!24759 (= res!21395 (not (= lt!35241 (bvsub (bvadd lt!35232 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24759 (= lt!35241 (bitIndex!0 (size!707 (buf!1028 (_2!1492 lt!35240))) (currentByte!2341 (_2!1492 lt!35240)) (currentBit!2336 (_2!1492 lt!35240))))))

(declare-fun b!24760 () Bool)

(declare-fun res!21390 () Bool)

(assert (=> b!24760 (=> res!21390 e!16911)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24760 (= res!21390 (not (invariant!0 (currentBit!2336 (_2!1492 lt!35240)) (currentByte!2341 (_2!1492 lt!35240)) (size!707 (buf!1028 (_2!1492 lt!35240))))))))

(declare-fun e!16906 () Bool)

(declare-fun lt!35239 () tuple2!2810)

(declare-fun b!24761 () Bool)

(assert (=> b!24761 (= e!16906 (= lt!35241 (bvsub (bvsub (bvadd (bitIndex!0 (size!707 (buf!1028 (_2!1492 lt!35239))) (currentByte!2341 (_2!1492 lt!35239)) (currentBit!2336 (_2!1492 lt!35239))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24762 () Bool)

(declare-fun res!21387 () Bool)

(declare-fun e!16910 () Bool)

(assert (=> b!24762 (=> res!21387 e!16910)))

(assert (=> b!24762 (= res!21387 (not (invariant!0 (currentBit!2336 (_2!1492 lt!35239)) (currentByte!2341 (_2!1492 lt!35239)) (size!707 (buf!1028 (_2!1492 lt!35239))))))))

(declare-fun b!24763 () Bool)

(assert (=> b!24763 (= e!16911 e!16910)))

(declare-fun res!21392 () Bool)

(assert (=> b!24763 (=> res!21392 e!16910)))

(assert (=> b!24763 (= res!21392 (not (= (size!707 (buf!1028 (_2!1492 lt!35239))) (size!707 (buf!1028 (_2!1492 lt!35240))))))))

(assert (=> b!24763 e!16906))

(declare-fun res!21389 () Bool)

(assert (=> b!24763 (=> (not res!21389) (not e!16906))))

(assert (=> b!24763 (= res!21389 (= (size!707 (buf!1028 (_2!1492 lt!35240))) (size!707 (buf!1028 thiss!1379))))))

(declare-fun b!24764 () Bool)

(assert (=> b!24764 (= e!16910 true)))

(declare-fun lt!35245 () (_ BitVec 64))

(assert (=> b!24764 (validate_offset_bits!1 ((_ sign_extend 32) (size!707 (buf!1028 (_2!1492 lt!35240)))) ((_ sign_extend 32) (currentByte!2341 (_2!1492 lt!35239))) ((_ sign_extend 32) (currentBit!2336 (_2!1492 lt!35239))) lt!35245)))

(declare-fun lt!35243 () Unit!2057)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1246 array!1643 (_ BitVec 64)) Unit!2057)

(assert (=> b!24764 (= lt!35243 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1492 lt!35239) (buf!1028 (_2!1492 lt!35240)) lt!35245))))

(declare-datatypes ((tuple2!2812 0))(
  ( (tuple2!2813 (_1!1493 BitStream!1246) (_2!1493 BitStream!1246)) )
))
(declare-fun lt!35237 () tuple2!2812)

(declare-fun reader!0 (BitStream!1246 BitStream!1246) tuple2!2812)

(assert (=> b!24764 (= lt!35237 (reader!0 (_2!1492 lt!35239) (_2!1492 lt!35240)))))

(assert (=> b!24764 (validate_offset_bits!1 ((_ sign_extend 32) (size!707 (buf!1028 (_2!1492 lt!35240)))) ((_ sign_extend 32) (currentByte!2341 thiss!1379)) ((_ sign_extend 32) (currentBit!2336 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35236 () Unit!2057)

(assert (=> b!24764 (= lt!35236 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1028 (_2!1492 lt!35240)) (bvsub to!314 i!635)))))

(declare-fun lt!35244 () tuple2!2812)

(assert (=> b!24764 (= lt!35244 (reader!0 thiss!1379 (_2!1492 lt!35240)))))

(declare-fun b!24765 () Bool)

(declare-fun e!16912 () Bool)

(assert (=> b!24765 (= e!16907 (not e!16912))))

(declare-fun res!21394 () Bool)

(assert (=> b!24765 (=> res!21394 e!16912)))

(assert (=> b!24765 (= res!21394 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1246 BitStream!1246) Bool)

(assert (=> b!24765 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35233 () Unit!2057)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1246) Unit!2057)

(assert (=> b!24765 (= lt!35233 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24765 (= lt!35232 (bitIndex!0 (size!707 (buf!1028 thiss!1379)) (currentByte!2341 thiss!1379) (currentBit!2336 thiss!1379)))))

(declare-fun b!24766 () Bool)

(declare-fun e!16908 () Bool)

(assert (=> b!24766 (= e!16912 e!16908)))

(declare-fun res!21384 () Bool)

(assert (=> b!24766 (=> res!21384 e!16908)))

(assert (=> b!24766 (= res!21384 (not (isPrefixOf!0 thiss!1379 (_2!1492 lt!35239))))))

(assert (=> b!24766 (validate_offset_bits!1 ((_ sign_extend 32) (size!707 (buf!1028 (_2!1492 lt!35239)))) ((_ sign_extend 32) (currentByte!2341 (_2!1492 lt!35239))) ((_ sign_extend 32) (currentBit!2336 (_2!1492 lt!35239))) lt!35245)))

(assert (=> b!24766 (= lt!35245 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35235 () Unit!2057)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1246 BitStream!1246 (_ BitVec 64) (_ BitVec 64)) Unit!2057)

(assert (=> b!24766 (= lt!35235 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1492 lt!35239) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1246 (_ BitVec 8) (_ BitVec 32)) tuple2!2810)

(assert (=> b!24766 (= lt!35239 (appendBitFromByte!0 thiss!1379 (select (arr!1163 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24767 () Bool)

(declare-fun res!21386 () Bool)

(assert (=> b!24767 (=> res!21386 e!16910)))

(assert (=> b!24767 (= res!21386 (not (invariant!0 (currentBit!2336 (_2!1492 lt!35239)) (currentByte!2341 (_2!1492 lt!35239)) (size!707 (buf!1028 (_2!1492 lt!35240))))))))

(declare-fun lt!35234 () tuple2!2812)

(declare-fun b!24768 () Bool)

(declare-fun e!16909 () Bool)

(declare-datatypes ((List!324 0))(
  ( (Nil!321) (Cons!320 (h!439 Bool) (t!1074 List!324)) )
))
(declare-fun head!161 (List!324) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1246 array!1643 (_ BitVec 64) (_ BitVec 64)) List!324)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1246 BitStream!1246 (_ BitVec 64)) List!324)

(assert (=> b!24768 (= e!16909 (= (head!161 (byteArrayBitContentToList!0 (_2!1492 lt!35239) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!161 (bitStreamReadBitsIntoList!0 (_2!1492 lt!35239) (_1!1493 lt!35234) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24769 () Bool)

(assert (=> b!24769 (= e!16908 e!16904)))

(declare-fun res!21391 () Bool)

(assert (=> b!24769 (=> res!21391 e!16904)))

(assert (=> b!24769 (= res!21391 (not (isPrefixOf!0 (_2!1492 lt!35239) (_2!1492 lt!35240))))))

(assert (=> b!24769 (isPrefixOf!0 thiss!1379 (_2!1492 lt!35240))))

(declare-fun lt!35238 () Unit!2057)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1246 BitStream!1246 BitStream!1246) Unit!2057)

(assert (=> b!24769 (= lt!35238 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1492 lt!35239) (_2!1492 lt!35240)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1246 array!1643 (_ BitVec 64) (_ BitVec 64)) tuple2!2810)

(assert (=> b!24769 (= lt!35240 (appendBitsMSBFirstLoop!0 (_2!1492 lt!35239) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24769 e!16909))

(declare-fun res!21385 () Bool)

(assert (=> b!24769 (=> (not res!21385) (not e!16909))))

(assert (=> b!24769 (= res!21385 (validate_offset_bits!1 ((_ sign_extend 32) (size!707 (buf!1028 (_2!1492 lt!35239)))) ((_ sign_extend 32) (currentByte!2341 thiss!1379)) ((_ sign_extend 32) (currentBit!2336 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35242 () Unit!2057)

(assert (=> b!24769 (= lt!35242 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1028 (_2!1492 lt!35239)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24769 (= lt!35234 (reader!0 thiss!1379 (_2!1492 lt!35239)))))

(assert (= (and start!5720 res!21388) b!24756))

(assert (= (and b!24756 res!21396) b!24765))

(assert (= (and b!24765 (not res!21394)) b!24766))

(assert (= (and b!24766 (not res!21384)) b!24769))

(assert (= (and b!24769 res!21385) b!24768))

(assert (= (and b!24769 (not res!21391)) b!24759))

(assert (= (and b!24759 (not res!21395)) b!24760))

(assert (= (and b!24760 (not res!21390)) b!24758))

(assert (= (and b!24758 (not res!21393)) b!24763))

(assert (= (and b!24763 res!21389) b!24761))

(assert (= (and b!24763 (not res!21392)) b!24762))

(assert (= (and b!24762 (not res!21387)) b!24767))

(assert (= (and b!24767 (not res!21386)) b!24764))

(assert (= start!5720 b!24757))

(declare-fun m!35025 () Bool)

(assert (=> b!24762 m!35025))

(declare-fun m!35027 () Bool)

(assert (=> b!24765 m!35027))

(declare-fun m!35029 () Bool)

(assert (=> b!24765 m!35029))

(declare-fun m!35031 () Bool)

(assert (=> b!24765 m!35031))

(declare-fun m!35033 () Bool)

(assert (=> b!24767 m!35033))

(declare-fun m!35035 () Bool)

(assert (=> b!24756 m!35035))

(declare-fun m!35037 () Bool)

(assert (=> b!24768 m!35037))

(assert (=> b!24768 m!35037))

(declare-fun m!35039 () Bool)

(assert (=> b!24768 m!35039))

(declare-fun m!35041 () Bool)

(assert (=> b!24768 m!35041))

(assert (=> b!24768 m!35041))

(declare-fun m!35043 () Bool)

(assert (=> b!24768 m!35043))

(declare-fun m!35045 () Bool)

(assert (=> b!24769 m!35045))

(declare-fun m!35047 () Bool)

(assert (=> b!24769 m!35047))

(declare-fun m!35049 () Bool)

(assert (=> b!24769 m!35049))

(declare-fun m!35051 () Bool)

(assert (=> b!24769 m!35051))

(declare-fun m!35053 () Bool)

(assert (=> b!24769 m!35053))

(declare-fun m!35055 () Bool)

(assert (=> b!24769 m!35055))

(declare-fun m!35057 () Bool)

(assert (=> b!24769 m!35057))

(declare-fun m!35059 () Bool)

(assert (=> b!24759 m!35059))

(declare-fun m!35061 () Bool)

(assert (=> b!24764 m!35061))

(declare-fun m!35063 () Bool)

(assert (=> b!24764 m!35063))

(declare-fun m!35065 () Bool)

(assert (=> b!24764 m!35065))

(declare-fun m!35067 () Bool)

(assert (=> b!24764 m!35067))

(declare-fun m!35069 () Bool)

(assert (=> b!24764 m!35069))

(declare-fun m!35071 () Bool)

(assert (=> b!24764 m!35071))

(declare-fun m!35073 () Bool)

(assert (=> start!5720 m!35073))

(declare-fun m!35075 () Bool)

(assert (=> start!5720 m!35075))

(declare-fun m!35077 () Bool)

(assert (=> b!24760 m!35077))

(declare-fun m!35079 () Bool)

(assert (=> b!24766 m!35079))

(declare-fun m!35081 () Bool)

(assert (=> b!24766 m!35081))

(declare-fun m!35083 () Bool)

(assert (=> b!24766 m!35083))

(assert (=> b!24766 m!35079))

(declare-fun m!35085 () Bool)

(assert (=> b!24766 m!35085))

(declare-fun m!35087 () Bool)

(assert (=> b!24766 m!35087))

(declare-fun m!35089 () Bool)

(assert (=> b!24761 m!35089))

(declare-fun m!35091 () Bool)

(assert (=> b!24757 m!35091))

(push 1)

