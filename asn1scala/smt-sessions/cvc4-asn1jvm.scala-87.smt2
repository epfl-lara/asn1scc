; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1824 () Bool)

(assert start!1824)

(declare-fun b!8649 () Bool)

(declare-fun res!9160 () Bool)

(declare-fun e!5399 () Bool)

(assert (=> b!8649 (=> (not res!9160) (not e!5399))))

(declare-datatypes ((array!574 0))(
  ( (array!575 (arr!651 (Array (_ BitVec 32) (_ BitVec 8))) (size!246 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!470 0))(
  ( (BitStream!471 (buf!582 array!574) (currentByte!1621 (_ BitVec 32)) (currentBit!1616 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!470)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8649 (= res!9160 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) nBits!460))))

(declare-fun res!9158 () Bool)

(assert (=> start!1824 (=> (not res!9158) (not e!5399))))

(declare-fun srcBuffer!6 () array!574)

(declare-fun from!367 () (_ BitVec 64))

(assert (=> start!1824 (= res!9158 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!246 srcBuffer!6))))))))

(assert (=> start!1824 e!5399))

(assert (=> start!1824 true))

(declare-fun array_inv!241 (array!574) Bool)

(assert (=> start!1824 (array_inv!241 srcBuffer!6)))

(declare-fun e!5401 () Bool)

(declare-fun inv!12 (BitStream!470) Bool)

(assert (=> start!1824 (and (inv!12 thiss!1486) e!5401)))

(declare-fun b!8650 () Bool)

(declare-fun res!9159 () Bool)

(declare-fun e!5402 () Bool)

(assert (=> b!8650 (=> (not res!9159) (not e!5402))))

(declare-datatypes ((Unit!746 0))(
  ( (Unit!747) )
))
(declare-datatypes ((tuple2!1168 0))(
  ( (tuple2!1169 (_1!615 Unit!746) (_2!615 BitStream!470)) )
))
(declare-fun lt!12526 () tuple2!1168)

(assert (=> b!8650 (= res!9159 (= (size!246 (buf!582 thiss!1486)) (size!246 (buf!582 (_2!615 lt!12526)))))))

(declare-fun b!8651 () Bool)

(declare-fun res!9161 () Bool)

(assert (=> b!8651 (=> (not res!9161) (not e!5402))))

(declare-fun isPrefixOf!0 (BitStream!470 BitStream!470) Bool)

(assert (=> b!8651 (= res!9161 (isPrefixOf!0 thiss!1486 (_2!615 lt!12526)))))

(declare-fun b!8652 () Bool)

(declare-fun res!9162 () Bool)

(assert (=> b!8652 (=> (not res!9162) (not e!5402))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8652 (= res!9162 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12526))) (currentByte!1621 (_2!615 lt!12526)) (currentBit!1616 (_2!615 lt!12526))) (bvadd (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)) nBits!460)))))

(declare-fun b!8653 () Bool)

(declare-datatypes ((tuple2!1170 0))(
  ( (tuple2!1171 (_1!616 BitStream!470) (_2!616 BitStream!470)) )
))
(declare-fun lt!12525 () tuple2!1170)

(declare-datatypes ((List!143 0))(
  ( (Nil!140) (Cons!139 (h!258 Bool) (t!893 List!143)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!470 array!574 (_ BitVec 64) (_ BitVec 64)) List!143)

(declare-datatypes ((tuple2!1172 0))(
  ( (tuple2!1173 (_1!617 array!574) (_2!617 BitStream!470)) )
))
(declare-fun readBits!0 (BitStream!470 (_ BitVec 64)) tuple2!1172)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!470 BitStream!470 (_ BitVec 64)) List!143)

(assert (=> b!8653 (= e!5402 (not (= (byteArrayBitContentToList!0 (_2!615 lt!12526) (_1!617 (readBits!0 (_1!616 lt!12525) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!615 lt!12526) (_1!616 lt!12525) nBits!460))))))

(assert (=> b!8653 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) nBits!460)))

(declare-fun lt!12527 () Unit!746)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!470 array!574 (_ BitVec 64)) Unit!746)

(assert (=> b!8653 (= lt!12527 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!582 (_2!615 lt!12526)) nBits!460))))

(declare-fun reader!0 (BitStream!470 BitStream!470) tuple2!1170)

(assert (=> b!8653 (= lt!12525 (reader!0 thiss!1486 (_2!615 lt!12526)))))

(declare-fun b!8654 () Bool)

(assert (=> b!8654 (= e!5401 (array_inv!241 (buf!582 thiss!1486)))))

(declare-fun b!8655 () Bool)

(assert (=> b!8655 (= e!5399 e!5402)))

(declare-fun res!9163 () Bool)

(assert (=> b!8655 (=> (not res!9163) (not e!5402))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8655 (= res!9163 (invariant!0 (currentBit!1616 (_2!615 lt!12526)) (currentByte!1621 (_2!615 lt!12526)) (size!246 (buf!582 (_2!615 lt!12526)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!470 array!574 (_ BitVec 64) (_ BitVec 64)) tuple2!1168)

(assert (=> b!8655 (= lt!12526 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1824 res!9158) b!8649))

(assert (= (and b!8649 res!9160) b!8655))

(assert (= (and b!8655 res!9163) b!8650))

(assert (= (and b!8650 res!9159) b!8652))

(assert (= (and b!8652 res!9162) b!8651))

(assert (= (and b!8651 res!9161) b!8653))

(assert (= start!1824 b!8654))

(declare-fun m!11835 () Bool)

(assert (=> b!8649 m!11835))

(declare-fun m!11837 () Bool)

(assert (=> b!8654 m!11837))

(declare-fun m!11839 () Bool)

(assert (=> b!8655 m!11839))

(declare-fun m!11841 () Bool)

(assert (=> b!8655 m!11841))

(declare-fun m!11843 () Bool)

(assert (=> b!8653 m!11843))

(declare-fun m!11845 () Bool)

(assert (=> b!8653 m!11845))

(declare-fun m!11847 () Bool)

(assert (=> b!8653 m!11847))

(declare-fun m!11849 () Bool)

(assert (=> b!8653 m!11849))

(declare-fun m!11851 () Bool)

(assert (=> b!8653 m!11851))

(declare-fun m!11853 () Bool)

(assert (=> b!8653 m!11853))

(declare-fun m!11855 () Bool)

(assert (=> start!1824 m!11855))

(declare-fun m!11857 () Bool)

(assert (=> start!1824 m!11857))

(declare-fun m!11859 () Bool)

(assert (=> b!8651 m!11859))

(declare-fun m!11861 () Bool)

(assert (=> b!8652 m!11861))

(declare-fun m!11863 () Bool)

(assert (=> b!8652 m!11863))

(push 1)

(assert (not b!8655))

(assert (not b!8654))

(assert (not start!1824))

(assert (not b!8649))

(assert (not b!8652))

(assert (not b!8653))

(assert (not b!8651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2554 () Bool)

(assert (=> d!2554 (= (invariant!0 (currentBit!1616 (_2!615 lt!12526)) (currentByte!1621 (_2!615 lt!12526)) (size!246 (buf!582 (_2!615 lt!12526)))) (and (bvsge (currentBit!1616 (_2!615 lt!12526)) #b00000000000000000000000000000000) (bvslt (currentBit!1616 (_2!615 lt!12526)) #b00000000000000000000000000001000) (bvsge (currentByte!1621 (_2!615 lt!12526)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1621 (_2!615 lt!12526)) (size!246 (buf!582 (_2!615 lt!12526)))) (and (= (currentBit!1616 (_2!615 lt!12526)) #b00000000000000000000000000000000) (= (currentByte!1621 (_2!615 lt!12526)) (size!246 (buf!582 (_2!615 lt!12526))))))))))

(assert (=> b!8655 d!2554))

(declare-fun b!8721 () Bool)

(declare-fun e!5430 () Bool)

(declare-fun lt!12839 () (_ BitVec 64))

(assert (=> b!8721 (= e!5430 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12839))))

(declare-fun b!8722 () Bool)

(declare-fun res!9219 () Bool)

(declare-fun e!5431 () Bool)

(assert (=> b!8722 (=> (not res!9219) (not e!5431))))

(declare-fun lt!12867 () tuple2!1168)

(assert (=> b!8722 (= res!9219 (invariant!0 (currentBit!1616 (_2!615 lt!12867)) (currentByte!1621 (_2!615 lt!12867)) (size!246 (buf!582 (_2!615 lt!12867)))))))

(declare-fun b!8723 () Bool)

(declare-fun res!9217 () Bool)

(assert (=> b!8723 (=> (not res!9217) (not e!5431))))

(assert (=> b!8723 (= res!9217 (= (size!246 (buf!582 (_2!615 lt!12867))) (size!246 (buf!582 thiss!1486))))))

(declare-fun b!8724 () Bool)

(declare-fun e!5432 () tuple2!1168)

(declare-fun Unit!752 () Unit!746)

(assert (=> b!8724 (= e!5432 (tuple2!1169 Unit!752 thiss!1486))))

(assert (=> b!8724 (= (size!246 (buf!582 thiss!1486)) (size!246 (buf!582 thiss!1486)))))

(declare-fun lt!12858 () Unit!746)

(declare-fun Unit!754 () Unit!746)

(assert (=> b!8724 (= lt!12858 Unit!754)))

(declare-fun call!136 () tuple2!1170)

(declare-fun checkByteArrayBitContent!0 (BitStream!470 array!574 array!574 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8724 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!617 (readBits!0 (_1!616 call!136) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8725 () Bool)

(declare-fun lt!12840 () tuple2!1168)

(declare-fun Unit!757 () Unit!746)

(assert (=> b!8725 (= e!5432 (tuple2!1169 Unit!757 (_2!615 lt!12840)))))

(declare-fun lt!12862 () tuple2!1168)

(declare-fun appendBitFromByte!0 (BitStream!470 (_ BitVec 8) (_ BitVec 32)) tuple2!1168)

(assert (=> b!8725 (= lt!12862 (appendBitFromByte!0 thiss!1486 (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!12852 () (_ BitVec 64))

(assert (=> b!8725 (= lt!12852 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12837 () (_ BitVec 64))

(assert (=> b!8725 (= lt!12837 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12854 () Unit!746)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!470 BitStream!470 (_ BitVec 64) (_ BitVec 64)) Unit!746)

(assert (=> b!8725 (= lt!12854 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!615 lt!12862) lt!12852 lt!12837))))

(assert (=> b!8725 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) (bvsub lt!12852 lt!12837))))

(declare-fun lt!12844 () Unit!746)

(assert (=> b!8725 (= lt!12844 lt!12854)))

(declare-fun lt!12864 () tuple2!1170)

(assert (=> b!8725 (= lt!12864 (reader!0 thiss!1486 (_2!615 lt!12862)))))

(declare-fun lt!12848 () (_ BitVec 64))

(assert (=> b!8725 (= lt!12848 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12847 () Unit!746)

(assert (=> b!8725 (= lt!12847 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!582 (_2!615 lt!12862)) lt!12848))))

(assert (=> b!8725 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12848)))

(declare-fun lt!12843 () Unit!746)

(assert (=> b!8725 (= lt!12843 lt!12847)))

(declare-fun head!48 (List!143) Bool)

(assert (=> b!8725 (= (head!48 (byteArrayBitContentToList!0 (_2!615 lt!12862) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!48 (bitStreamReadBitsIntoList!0 (_2!615 lt!12862) (_1!616 lt!12864) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12868 () Unit!746)

(declare-fun Unit!758 () Unit!746)

(assert (=> b!8725 (= lt!12868 Unit!758)))

(assert (=> b!8725 (= lt!12840 (appendBitsMSBFirstLoop!0 (_2!615 lt!12862) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!12866 () Unit!746)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!470 BitStream!470 BitStream!470) Unit!746)

(assert (=> b!8725 (= lt!12866 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!615 lt!12862) (_2!615 lt!12840)))))

(assert (=> b!8725 (isPrefixOf!0 thiss!1486 (_2!615 lt!12840))))

(declare-fun lt!12871 () Unit!746)

(assert (=> b!8725 (= lt!12871 lt!12866)))

(assert (=> b!8725 (= (size!246 (buf!582 (_2!615 lt!12840))) (size!246 (buf!582 thiss!1486)))))

(declare-fun lt!12857 () Unit!746)

(declare-fun Unit!761 () Unit!746)

(assert (=> b!8725 (= lt!12857 Unit!761)))

(assert (=> b!8725 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12840))) (currentByte!1621 (_2!615 lt!12840)) (currentBit!1616 (_2!615 lt!12840))) (bvsub (bvadd (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!12878 () Unit!746)

(declare-fun Unit!763 () Unit!746)

(assert (=> b!8725 (= lt!12878 Unit!763)))

(assert (=> b!8725 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12840))) (currentByte!1621 (_2!615 lt!12840)) (currentBit!1616 (_2!615 lt!12840))) (bvsub (bvsub (bvadd (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12875 () Unit!746)

(declare-fun Unit!764 () Unit!746)

(assert (=> b!8725 (= lt!12875 Unit!764)))

(declare-fun lt!12850 () tuple2!1170)

(assert (=> b!8725 (= lt!12850 (reader!0 thiss!1486 (_2!615 lt!12840)))))

(declare-fun lt!12846 () (_ BitVec 64))

(assert (=> b!8725 (= lt!12846 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12853 () Unit!746)

(assert (=> b!8725 (= lt!12853 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!582 (_2!615 lt!12840)) lt!12846))))

(assert (=> b!8725 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12846)))

(declare-fun lt!12863 () Unit!746)

(assert (=> b!8725 (= lt!12863 lt!12853)))

(declare-fun lt!12865 () tuple2!1170)

(assert (=> b!8725 (= lt!12865 call!136)))

(declare-fun lt!12849 () (_ BitVec 64))

(assert (=> b!8725 (= lt!12849 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12842 () Unit!746)

(assert (=> b!8725 (= lt!12842 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!615 lt!12862) (buf!582 (_2!615 lt!12840)) lt!12849))))

(assert (=> b!8725 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) lt!12849)))

(declare-fun lt!12860 () Unit!746)

(assert (=> b!8725 (= lt!12860 lt!12842)))

(declare-fun lt!12851 () List!143)

(assert (=> b!8725 (= lt!12851 (byteArrayBitContentToList!0 (_2!615 lt!12840) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12838 () List!143)

(assert (=> b!8725 (= lt!12838 (byteArrayBitContentToList!0 (_2!615 lt!12840) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12861 () List!143)

(assert (=> b!8725 (= lt!12861 (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_1!616 lt!12850) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12879 () List!143)

(assert (=> b!8725 (= lt!12879 (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_1!616 lt!12865) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12836 () (_ BitVec 64))

(assert (=> b!8725 (= lt!12836 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12873 () Unit!746)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!470 BitStream!470 BitStream!470 BitStream!470 (_ BitVec 64) List!143) Unit!746)

(assert (=> b!8725 (= lt!12873 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!615 lt!12840) (_2!615 lt!12840) (_1!616 lt!12850) (_1!616 lt!12865) lt!12836 lt!12861))))

(declare-fun tail!56 (List!143) List!143)

(assert (=> b!8725 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_1!616 lt!12865) (bvsub lt!12836 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!56 lt!12861))))

(declare-fun lt!12869 () Unit!746)

(assert (=> b!8725 (= lt!12869 lt!12873)))

(declare-fun lt!12859 () Unit!746)

(declare-fun lt!12872 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!574 array!574 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!746)

(assert (=> b!8725 (= lt!12859 (arrayBitRangesEqImpliesEq!0 (buf!582 (_2!615 lt!12862)) (buf!582 (_2!615 lt!12840)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12872 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862)))))))

(declare-fun bitAt!0 (array!574 (_ BitVec 64)) Bool)

(assert (=> b!8725 (= (bitAt!0 (buf!582 (_2!615 lt!12862)) lt!12872) (bitAt!0 (buf!582 (_2!615 lt!12840)) lt!12872))))

(declare-fun lt!12855 () Unit!746)

(assert (=> b!8725 (= lt!12855 lt!12859)))

(declare-fun b!8727 () Bool)

(declare-fun res!9215 () Bool)

(assert (=> b!8727 (=> (not res!9215) (not e!5431))))

(assert (=> b!8727 (= res!9215 (= (size!246 (buf!582 thiss!1486)) (size!246 (buf!582 (_2!615 lt!12867)))))))

(declare-fun c!481 () Bool)

(declare-fun bm!133 () Bool)

(assert (=> bm!133 (= call!136 (reader!0 (ite c!481 (_2!615 lt!12862) thiss!1486) (ite c!481 (_2!615 lt!12840) thiss!1486)))))

(declare-fun b!8728 () Bool)

(declare-fun res!9218 () Bool)

(assert (=> b!8728 (=> (not res!9218) (not e!5431))))

(assert (=> b!8728 (= res!9218 (isPrefixOf!0 thiss!1486 (_2!615 lt!12867)))))

(declare-fun lt!12841 () tuple2!1170)

(declare-fun b!8726 () Bool)

(assert (=> b!8726 (= e!5431 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12867) (_1!616 lt!12841) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!615 lt!12867) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8726 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8726 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12877 () Unit!746)

(declare-fun lt!12874 () Unit!746)

(assert (=> b!8726 (= lt!12877 lt!12874)))

(assert (=> b!8726 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12867)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12839)))

(assert (=> b!8726 (= lt!12874 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!582 (_2!615 lt!12867)) lt!12839))))

(assert (=> b!8726 e!5430))

(declare-fun res!9216 () Bool)

(assert (=> b!8726 (=> (not res!9216) (not e!5430))))

(assert (=> b!8726 (= res!9216 (and (= (size!246 (buf!582 thiss!1486)) (size!246 (buf!582 (_2!615 lt!12867)))) (bvsge lt!12839 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8726 (= lt!12839 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8726 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8726 (= lt!12841 (reader!0 thiss!1486 (_2!615 lt!12867)))))

(declare-fun d!2558 () Bool)

(assert (=> d!2558 e!5431))

(declare-fun res!9220 () Bool)

(assert (=> d!2558 (=> (not res!9220) (not e!5431))))

(declare-fun lt!12856 () (_ BitVec 64))

(assert (=> d!2558 (= res!9220 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12867))) (currentByte!1621 (_2!615 lt!12867)) (currentBit!1616 (_2!615 lt!12867))) (bvsub lt!12856 from!367)))))

(assert (=> d!2558 (or (= (bvand lt!12856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12856 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12870 () (_ BitVec 64))

(assert (=> d!2558 (= lt!12856 (bvadd lt!12870 from!367 nBits!460))))

(assert (=> d!2558 (or (not (= (bvand lt!12870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!12870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!12870 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2558 (= lt!12870 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(assert (=> d!2558 (= lt!12867 e!5432)))

(assert (=> d!2558 (= c!481 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!12845 () Unit!746)

(declare-fun lt!12876 () Unit!746)

(assert (=> d!2558 (= lt!12845 lt!12876)))

(assert (=> d!2558 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!470) Unit!746)

(assert (=> d!2558 (= lt!12876 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2558 (= lt!12872 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(assert (=> d!2558 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2558 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!12867)))

(assert (= (and d!2558 c!481) b!8725))

(assert (= (and d!2558 (not c!481)) b!8724))

(assert (= (or b!8725 b!8724) bm!133))

(assert (= (and d!2558 res!9220) b!8722))

(assert (= (and b!8722 res!9219) b!8727))

(assert (= (and b!8727 res!9215) b!8728))

(assert (= (and b!8728 res!9218) b!8723))

(assert (= (and b!8723 res!9217) b!8726))

(assert (= (and b!8726 res!9216) b!8721))

(declare-fun m!11895 () Bool)

(assert (=> b!8721 m!11895))

(declare-fun m!11901 () Bool)

(assert (=> bm!133 m!11901))

(declare-fun m!11905 () Bool)

(assert (=> b!8728 m!11905))

(declare-fun m!11909 () Bool)

(assert (=> b!8722 m!11909))

(declare-fun m!11911 () Bool)

(assert (=> b!8726 m!11911))

(declare-fun m!11915 () Bool)

(assert (=> b!8726 m!11915))

(declare-fun m!11919 () Bool)

(assert (=> b!8726 m!11919))

(declare-fun m!11921 () Bool)

(assert (=> b!8726 m!11921))

(declare-fun m!11925 () Bool)

(assert (=> b!8726 m!11925))

(declare-fun m!11929 () Bool)

(assert (=> b!8724 m!11929))

(declare-fun m!11933 () Bool)

(assert (=> b!8724 m!11933))

(declare-fun m!11937 () Bool)

(assert (=> b!8725 m!11937))

(declare-fun m!11943 () Bool)

(assert (=> b!8725 m!11943))

(declare-fun m!11945 () Bool)

(assert (=> b!8725 m!11945))

(declare-fun m!11947 () Bool)

(assert (=> b!8725 m!11947))

(declare-fun m!11951 () Bool)

(assert (=> b!8725 m!11951))

(declare-fun m!11953 () Bool)

(assert (=> b!8725 m!11953))

(declare-fun m!11957 () Bool)

(assert (=> b!8725 m!11957))

(declare-fun m!11961 () Bool)

(assert (=> b!8725 m!11961))

(assert (=> b!8725 m!11937))

(declare-fun m!11965 () Bool)

(assert (=> b!8725 m!11965))

(declare-fun m!11969 () Bool)

(assert (=> b!8725 m!11969))

(declare-fun m!11973 () Bool)

(assert (=> b!8725 m!11973))

(declare-fun m!11977 () Bool)

(assert (=> b!8725 m!11977))

(declare-fun m!11983 () Bool)

(assert (=> b!8725 m!11983))

(declare-fun m!11987 () Bool)

(assert (=> b!8725 m!11987))

(declare-fun m!11991 () Bool)

(assert (=> b!8725 m!11991))

(declare-fun m!11993 () Bool)

(assert (=> b!8725 m!11993))

(declare-fun m!11997 () Bool)

(assert (=> b!8725 m!11997))

(declare-fun m!12001 () Bool)

(assert (=> b!8725 m!12001))

(assert (=> b!8725 m!11957))

(declare-fun m!12007 () Bool)

(assert (=> b!8725 m!12007))

(declare-fun m!12013 () Bool)

(assert (=> b!8725 m!12013))

(declare-fun m!12015 () Bool)

(assert (=> b!8725 m!12015))

(declare-fun m!12019 () Bool)

(assert (=> b!8725 m!12019))

(declare-fun m!12023 () Bool)

(assert (=> b!8725 m!12023))

(declare-fun m!12027 () Bool)

(assert (=> b!8725 m!12027))

(declare-fun m!12029 () Bool)

(assert (=> b!8725 m!12029))

(declare-fun m!12031 () Bool)

(assert (=> b!8725 m!12031))

(declare-fun m!12033 () Bool)

(assert (=> b!8725 m!12033))

(assert (=> b!8725 m!12027))

(declare-fun m!12035 () Bool)

(assert (=> b!8725 m!12035))

(declare-fun m!12037 () Bool)

(assert (=> b!8725 m!12037))

(declare-fun m!12039 () Bool)

(assert (=> b!8725 m!12039))

(assert (=> b!8725 m!11863))

(assert (=> b!8725 m!11977))

(declare-fun m!12041 () Bool)

(assert (=> b!8725 m!12041))

(declare-fun m!12043 () Bool)

(assert (=> d!2558 m!12043))

(assert (=> d!2558 m!11863))

(declare-fun m!12045 () Bool)

(assert (=> d!2558 m!12045))

(declare-fun m!12047 () Bool)

(assert (=> d!2558 m!12047))

(assert (=> b!8655 d!2558))

(declare-fun d!2562 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2562 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486))) nBits!460))))

(declare-fun bs!850 () Bool)

(assert (= bs!850 d!2562))

(declare-fun m!12051 () Bool)

(assert (=> bs!850 m!12051))

(assert (=> b!8649 d!2562))

(declare-fun d!2566 () Bool)

(assert (=> d!2566 (= (array_inv!241 (buf!582 thiss!1486)) (bvsge (size!246 (buf!582 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8654 d!2566))

(declare-fun d!2568 () Bool)

(declare-fun c!485 () Bool)

(assert (=> d!2568 (= c!485 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5438 () List!143)

(assert (=> d!2568 (= (byteArrayBitContentToList!0 (_2!615 lt!12526) (_1!617 (readBits!0 (_1!616 lt!12525) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!5438)))

(declare-fun b!8741 () Bool)

(assert (=> b!8741 (= e!5438 Nil!140)))

(declare-fun b!8742 () Bool)

(assert (=> b!8742 (= e!5438 (Cons!139 (not (= (bvand ((_ sign_extend 24) (select (arr!651 (_1!617 (readBits!0 (_1!616 lt!12525) nBits!460))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!615 lt!12526) (_1!617 (readBits!0 (_1!616 lt!12525) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2568 c!485) b!8741))

(assert (= (and d!2568 (not c!485)) b!8742))

(declare-fun m!12053 () Bool)

(assert (=> b!8742 m!12053))

(declare-fun m!12055 () Bool)

(assert (=> b!8742 m!12055))

(declare-fun m!12057 () Bool)

(assert (=> b!8742 m!12057))

(assert (=> b!8653 d!2568))

(declare-fun b!8768 () Bool)

(declare-fun e!5451 () Bool)

(declare-fun lt!12956 () List!143)

(declare-fun length!21 (List!143) Int)

(assert (=> b!8768 (= e!5451 (> (length!21 lt!12956) 0))))

(declare-fun d!2570 () Bool)

(assert (=> d!2570 e!5451))

(declare-fun c!493 () Bool)

(assert (=> d!2570 (= c!493 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!1178 0))(
  ( (tuple2!1179 (_1!622 List!143) (_2!622 BitStream!470)) )
))
(declare-fun e!5450 () tuple2!1178)

(assert (=> d!2570 (= lt!12956 (_1!622 e!5450))))

(declare-fun c!494 () Bool)

(assert (=> d!2570 (= c!494 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2570 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2570 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12526) (_1!616 lt!12525) nBits!460) lt!12956)))

(declare-fun lt!12955 () (_ BitVec 64))

(declare-datatypes ((tuple2!1180 0))(
  ( (tuple2!1181 (_1!623 Bool) (_2!623 BitStream!470)) )
))
(declare-fun lt!12954 () tuple2!1180)

(declare-fun b!8766 () Bool)

(assert (=> b!8766 (= e!5450 (tuple2!1179 (Cons!139 (_1!623 lt!12954) (bitStreamReadBitsIntoList!0 (_2!615 lt!12526) (_2!623 lt!12954) (bvsub nBits!460 lt!12955))) (_2!623 lt!12954)))))

(declare-fun readBit!0 (BitStream!470) tuple2!1180)

(assert (=> b!8766 (= lt!12954 (readBit!0 (_1!616 lt!12525)))))

(assert (=> b!8766 (= lt!12955 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!8765 () Bool)

(assert (=> b!8765 (= e!5450 (tuple2!1179 Nil!140 (_1!616 lt!12525)))))

(declare-fun b!8767 () Bool)

(declare-fun isEmpty!26 (List!143) Bool)

(assert (=> b!8767 (= e!5451 (isEmpty!26 lt!12956))))

(assert (= (and d!2570 c!494) b!8765))

(assert (= (and d!2570 (not c!494)) b!8766))

(assert (= (and d!2570 c!493) b!8767))

(assert (= (and d!2570 (not c!493)) b!8768))

(declare-fun m!12159 () Bool)

(assert (=> b!8768 m!12159))

(declare-fun m!12161 () Bool)

(assert (=> b!8766 m!12161))

(declare-fun m!12163 () Bool)

(assert (=> b!8766 m!12163))

(declare-fun m!12165 () Bool)

(assert (=> b!8767 m!12165))

(assert (=> b!8653 d!2570))

(declare-fun b!8806 () Bool)

(declare-fun e!5468 () Unit!746)

(declare-fun Unit!771 () Unit!746)

(assert (=> b!8806 (= e!5468 Unit!771)))

(declare-fun lt!13085 () tuple2!1170)

(declare-fun lt!13075 () (_ BitVec 64))

(declare-fun lt!13074 () (_ BitVec 64))

(declare-fun b!8807 () Bool)

(declare-fun e!5469 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!470 (_ BitVec 64)) BitStream!470)

(assert (=> b!8807 (= e!5469 (= (_1!616 lt!13085) (withMovedBitIndex!0 (_2!616 lt!13085) (bvsub lt!13074 lt!13075))))))

(assert (=> b!8807 (or (= (bvand lt!13074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13074 lt!13075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8807 (= lt!13075 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12526))) (currentByte!1621 (_2!615 lt!12526)) (currentBit!1616 (_2!615 lt!12526))))))

(assert (=> b!8807 (= lt!13074 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(declare-fun b!8808 () Bool)

(declare-fun lt!13078 () Unit!746)

(assert (=> b!8808 (= e!5468 lt!13078)))

(declare-fun lt!13077 () (_ BitVec 64))

(assert (=> b!8808 (= lt!13077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13081 () (_ BitVec 64))

(assert (=> b!8808 (= lt!13081 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!574 array!574 (_ BitVec 64) (_ BitVec 64)) Unit!746)

(assert (=> b!8808 (= lt!13078 (arrayBitRangesEqSymmetric!0 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12526)) lt!13077 lt!13081))))

(declare-fun arrayBitRangesEq!0 (array!574 array!574 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8808 (arrayBitRangesEq!0 (buf!582 (_2!615 lt!12526)) (buf!582 thiss!1486) lt!13077 lt!13081)))

(declare-fun b!8809 () Bool)

(declare-fun res!9250 () Bool)

(assert (=> b!8809 (=> (not res!9250) (not e!5469))))

(assert (=> b!8809 (= res!9250 (isPrefixOf!0 (_2!616 lt!13085) (_2!615 lt!12526)))))

(declare-fun b!8810 () Bool)

(declare-fun res!9251 () Bool)

(assert (=> b!8810 (=> (not res!9251) (not e!5469))))

(assert (=> b!8810 (= res!9251 (isPrefixOf!0 (_1!616 lt!13085) thiss!1486))))

(declare-fun d!2584 () Bool)

(assert (=> d!2584 e!5469))

(declare-fun res!9252 () Bool)

(assert (=> d!2584 (=> (not res!9252) (not e!5469))))

(assert (=> d!2584 (= res!9252 (isPrefixOf!0 (_1!616 lt!13085) (_2!616 lt!13085)))))

(declare-fun lt!13080 () BitStream!470)

(assert (=> d!2584 (= lt!13085 (tuple2!1171 lt!13080 (_2!615 lt!12526)))))

(declare-fun lt!13079 () Unit!746)

(declare-fun lt!13072 () Unit!746)

(assert (=> d!2584 (= lt!13079 lt!13072)))

(assert (=> d!2584 (isPrefixOf!0 lt!13080 (_2!615 lt!12526))))

(assert (=> d!2584 (= lt!13072 (lemmaIsPrefixTransitive!0 lt!13080 (_2!615 lt!12526) (_2!615 lt!12526)))))

(declare-fun lt!13084 () Unit!746)

(declare-fun lt!13068 () Unit!746)

(assert (=> d!2584 (= lt!13084 lt!13068)))

(assert (=> d!2584 (isPrefixOf!0 lt!13080 (_2!615 lt!12526))))

(assert (=> d!2584 (= lt!13068 (lemmaIsPrefixTransitive!0 lt!13080 thiss!1486 (_2!615 lt!12526)))))

(declare-fun lt!13066 () Unit!746)

(assert (=> d!2584 (= lt!13066 e!5468)))

(declare-fun c!506 () Bool)

(assert (=> d!2584 (= c!506 (not (= (size!246 (buf!582 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!13069 () Unit!746)

(declare-fun lt!13070 () Unit!746)

(assert (=> d!2584 (= lt!13069 lt!13070)))

(assert (=> d!2584 (isPrefixOf!0 (_2!615 lt!12526) (_2!615 lt!12526))))

(assert (=> d!2584 (= lt!13070 (lemmaIsPrefixRefl!0 (_2!615 lt!12526)))))

(declare-fun lt!13071 () Unit!746)

(declare-fun lt!13073 () Unit!746)

(assert (=> d!2584 (= lt!13071 lt!13073)))

(assert (=> d!2584 (= lt!13073 (lemmaIsPrefixRefl!0 (_2!615 lt!12526)))))

(declare-fun lt!13083 () Unit!746)

(declare-fun lt!13067 () Unit!746)

(assert (=> d!2584 (= lt!13083 lt!13067)))

(assert (=> d!2584 (isPrefixOf!0 lt!13080 lt!13080)))

(assert (=> d!2584 (= lt!13067 (lemmaIsPrefixRefl!0 lt!13080))))

(declare-fun lt!13082 () Unit!746)

(declare-fun lt!13076 () Unit!746)

(assert (=> d!2584 (= lt!13082 lt!13076)))

(assert (=> d!2584 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2584 (= lt!13076 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2584 (= lt!13080 (BitStream!471 (buf!582 (_2!615 lt!12526)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(assert (=> d!2584 (isPrefixOf!0 thiss!1486 (_2!615 lt!12526))))

(assert (=> d!2584 (= (reader!0 thiss!1486 (_2!615 lt!12526)) lt!13085)))

(assert (= (and d!2584 c!506) b!8808))

(assert (= (and d!2584 (not c!506)) b!8806))

(assert (= (and d!2584 res!9252) b!8810))

(assert (= (and b!8810 res!9251) b!8809))

(assert (= (and b!8809 res!9250) b!8807))

(declare-fun m!12201 () Bool)

(assert (=> b!8807 m!12201))

(assert (=> b!8807 m!11861))

(assert (=> b!8807 m!11863))

(assert (=> d!2584 m!11859))

(declare-fun m!12203 () Bool)

(assert (=> d!2584 m!12203))

(assert (=> d!2584 m!12045))

(declare-fun m!12205 () Bool)

(assert (=> d!2584 m!12205))

(declare-fun m!12207 () Bool)

(assert (=> d!2584 m!12207))

(declare-fun m!12209 () Bool)

(assert (=> d!2584 m!12209))

(assert (=> d!2584 m!12047))

(declare-fun m!12211 () Bool)

(assert (=> d!2584 m!12211))

(declare-fun m!12213 () Bool)

(assert (=> d!2584 m!12213))

(declare-fun m!12215 () Bool)

(assert (=> d!2584 m!12215))

(declare-fun m!12217 () Bool)

(assert (=> d!2584 m!12217))

(declare-fun m!12219 () Bool)

(assert (=> b!8810 m!12219))

(assert (=> b!8808 m!11863))

(declare-fun m!12221 () Bool)

(assert (=> b!8808 m!12221))

(declare-fun m!12223 () Bool)

(assert (=> b!8808 m!12223))

(declare-fun m!12225 () Bool)

(assert (=> b!8809 m!12225))

(assert (=> b!8653 d!2584))

(declare-fun b!8846 () Bool)

(declare-fun res!9291 () Bool)

(declare-fun e!5477 () Bool)

(assert (=> b!8846 (=> (not res!9291) (not e!5477))))

(declare-fun lt!13160 () tuple2!1172)

(assert (=> b!8846 (= res!9291 (invariant!0 (currentBit!1616 (_2!617 lt!13160)) (currentByte!1621 (_2!617 lt!13160)) (size!246 (buf!582 (_2!617 lt!13160)))))))

(declare-fun b!8847 () Bool)

(declare-fun res!9290 () Bool)

(assert (=> b!8847 (=> (not res!9290) (not e!5477))))

(assert (=> b!8847 (= res!9290 (bvsle (currentByte!1621 (_1!616 lt!12525)) (currentByte!1621 (_2!617 lt!13160))))))

(declare-fun b!8849 () Bool)

(declare-fun res!9292 () Bool)

(assert (=> b!8849 (=> (not res!9292) (not e!5477))))

(declare-fun lt!13156 () (_ BitVec 64))

(assert (=> b!8849 (= res!9292 (= (size!246 (_1!617 lt!13160)) ((_ extract 31 0) lt!13156)))))

(assert (=> b!8849 (and (bvslt lt!13156 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!13156 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!13159 () (_ BitVec 64))

(declare-fun lt!13157 () (_ BitVec 64))

(assert (=> b!8849 (= lt!13156 (bvsdiv lt!13159 lt!13157))))

(assert (=> b!8849 (and (not (= lt!13157 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!13159 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!13157 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!8849 (= lt!13157 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!13162 () (_ BitVec 64))

(declare-fun lt!13161 () (_ BitVec 64))

(assert (=> b!8849 (= lt!13159 (bvsub lt!13162 lt!13161))))

(assert (=> b!8849 (or (= (bvand lt!13162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13161 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13162 lt!13161) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8849 (= lt!13161 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13158 () (_ BitVec 64))

(assert (=> b!8849 (= lt!13162 (bvadd nBits!460 lt!13158))))

(assert (=> b!8849 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13158 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!13158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8849 (= lt!13158 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!8850 () Bool)

(declare-fun res!9288 () Bool)

(assert (=> b!8850 (=> (not res!9288) (not e!5477))))

(declare-fun lt!13163 () (_ BitVec 64))

(assert (=> b!8850 (= res!9288 (= (bvadd lt!13163 nBits!460) (bitIndex!0 (size!246 (buf!582 (_2!617 lt!13160))) (currentByte!1621 (_2!617 lt!13160)) (currentBit!1616 (_2!617 lt!13160)))))))

(assert (=> b!8850 (or (not (= (bvand lt!13163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13163 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8850 (= lt!13163 (bitIndex!0 (size!246 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)) (currentBit!1616 (_1!616 lt!12525))))))

(declare-fun d!2590 () Bool)

(assert (=> d!2590 e!5477))

(declare-fun res!9289 () Bool)

(assert (=> d!2590 (=> (not res!9289) (not e!5477))))

(assert (=> d!2590 (= res!9289 (= (buf!582 (_2!617 lt!13160)) (buf!582 (_1!616 lt!12525))))))

(declare-datatypes ((tuple3!66 0))(
  ( (tuple3!67 (_1!626 Unit!746) (_2!626 BitStream!470) (_3!33 array!574)) )
))
(declare-fun lt!13155 () tuple3!66)

(assert (=> d!2590 (= lt!13160 (tuple2!1173 (_3!33 lt!13155) (_2!626 lt!13155)))))

(declare-fun readBitsLoop!0 (BitStream!470 (_ BitVec 64) array!574 (_ BitVec 64) (_ BitVec 64)) tuple3!66)

(assert (=> d!2590 (= lt!13155 (readBitsLoop!0 (_1!616 lt!12525) nBits!460 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2590 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2590 (= (readBits!0 (_1!616 lt!12525) nBits!460) lt!13160)))

(declare-fun b!8848 () Bool)

(assert (=> b!8848 (= e!5477 (= (byteArrayBitContentToList!0 (_2!617 lt!13160) (_1!617 lt!13160) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!617 lt!13160) (_1!616 lt!12525) nBits!460)))))

(assert (= (and d!2590 res!9289) b!8850))

(assert (= (and b!8850 res!9288) b!8846))

(assert (= (and b!8846 res!9291) b!8849))

(assert (= (and b!8849 res!9292) b!8847))

(assert (= (and b!8847 res!9290) b!8848))

(declare-fun m!12245 () Bool)

(assert (=> b!8846 m!12245))

(declare-fun m!12247 () Bool)

(assert (=> b!8850 m!12247))

(declare-fun m!12249 () Bool)

(assert (=> b!8850 m!12249))

(declare-fun m!12251 () Bool)

(assert (=> d!2590 m!12251))

(declare-fun m!12253 () Bool)

(assert (=> b!8848 m!12253))

(declare-fun m!12255 () Bool)

(assert (=> b!8848 m!12255))

(assert (=> b!8653 d!2590))

(declare-fun d!2600 () Bool)

(assert (=> d!2600 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) nBits!460)))

(declare-fun lt!13215 () Unit!746)

(declare-fun choose!9 (BitStream!470 array!574 (_ BitVec 64) BitStream!470) Unit!746)

(assert (=> d!2600 (= lt!13215 (choose!9 thiss!1486 (buf!582 (_2!615 lt!12526)) nBits!460 (BitStream!471 (buf!582 (_2!615 lt!12526)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(assert (=> d!2600 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!582 (_2!615 lt!12526)) nBits!460) lt!13215)))

(declare-fun bs!855 () Bool)

(assert (= bs!855 d!2600))

(assert (=> bs!855 m!11851))

(declare-fun m!12269 () Bool)

(assert (=> bs!855 m!12269))

(assert (=> b!8653 d!2600))

(declare-fun d!2604 () Bool)

(assert (=> d!2604 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486))) nBits!460))))

(declare-fun bs!856 () Bool)

(assert (= bs!856 d!2604))

(declare-fun m!12271 () Bool)

(assert (=> bs!856 m!12271))

(assert (=> b!8653 d!2604))

(declare-fun d!2606 () Bool)

(declare-fun e!5496 () Bool)

(assert (=> d!2606 e!5496))

(declare-fun res!9311 () Bool)

(assert (=> d!2606 (=> (not res!9311) (not e!5496))))

(declare-fun lt!13258 () (_ BitVec 64))

(declare-fun lt!13259 () (_ BitVec 64))

(declare-fun lt!13257 () (_ BitVec 64))

(assert (=> d!2606 (= res!9311 (= lt!13259 (bvsub lt!13258 lt!13257)))))

(assert (=> d!2606 (or (= (bvand lt!13258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13257 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13258 lt!13257) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2606 (= lt!13257 (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12526))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12526)))))))

(declare-fun lt!13262 () (_ BitVec 64))

(declare-fun lt!13260 () (_ BitVec 64))

(assert (=> d!2606 (= lt!13258 (bvmul lt!13262 lt!13260))))

(assert (=> d!2606 (or (= lt!13262 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13260 (bvsdiv (bvmul lt!13262 lt!13260) lt!13262)))))

(assert (=> d!2606 (= lt!13260 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2606 (= lt!13262 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))))))

(assert (=> d!2606 (= lt!13259 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12526))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12526)))))))

(assert (=> d!2606 (invariant!0 (currentBit!1616 (_2!615 lt!12526)) (currentByte!1621 (_2!615 lt!12526)) (size!246 (buf!582 (_2!615 lt!12526))))))

(assert (=> d!2606 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12526))) (currentByte!1621 (_2!615 lt!12526)) (currentBit!1616 (_2!615 lt!12526))) lt!13259)))

(declare-fun b!8893 () Bool)

(declare-fun res!9312 () Bool)

(assert (=> b!8893 (=> (not res!9312) (not e!5496))))

(assert (=> b!8893 (= res!9312 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13259))))

(declare-fun b!8894 () Bool)

(declare-fun lt!13261 () (_ BitVec 64))

(assert (=> b!8894 (= e!5496 (bvsle lt!13259 (bvmul lt!13261 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8894 (or (= lt!13261 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13261 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13261)))))

(assert (=> b!8894 (= lt!13261 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))))))

(assert (= (and d!2606 res!9311) b!8893))

(assert (= (and b!8893 res!9312) b!8894))

(declare-fun m!12313 () Bool)

(assert (=> d!2606 m!12313))

(assert (=> d!2606 m!11839))

(assert (=> b!8652 d!2606))

(declare-fun d!2614 () Bool)

(declare-fun e!5497 () Bool)

(assert (=> d!2614 e!5497))

(declare-fun res!9313 () Bool)

(assert (=> d!2614 (=> (not res!9313) (not e!5497))))

(declare-fun lt!13265 () (_ BitVec 64))

(declare-fun lt!13263 () (_ BitVec 64))

(declare-fun lt!13264 () (_ BitVec 64))

(assert (=> d!2614 (= res!9313 (= lt!13265 (bvsub lt!13264 lt!13263)))))

(assert (=> d!2614 (or (= (bvand lt!13264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13264 lt!13263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2614 (= lt!13263 (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486))))))

(declare-fun lt!13268 () (_ BitVec 64))

(declare-fun lt!13266 () (_ BitVec 64))

(assert (=> d!2614 (= lt!13264 (bvmul lt!13268 lt!13266))))

(assert (=> d!2614 (or (= lt!13268 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13266 (bvsdiv (bvmul lt!13268 lt!13266) lt!13268)))))

(assert (=> d!2614 (= lt!13266 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2614 (= lt!13268 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))))))

(assert (=> d!2614 (= lt!13265 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 thiss!1486))))))

(assert (=> d!2614 (invariant!0 (currentBit!1616 thiss!1486) (currentByte!1621 thiss!1486) (size!246 (buf!582 thiss!1486)))))

(assert (=> d!2614 (= (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)) lt!13265)))

(declare-fun b!8895 () Bool)

(declare-fun res!9314 () Bool)

(assert (=> b!8895 (=> (not res!9314) (not e!5497))))

(assert (=> b!8895 (= res!9314 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13265))))

(declare-fun b!8896 () Bool)

(declare-fun lt!13267 () (_ BitVec 64))

(assert (=> b!8896 (= e!5497 (bvsle lt!13265 (bvmul lt!13267 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8896 (or (= lt!13267 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13267 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13267)))))

(assert (=> b!8896 (= lt!13267 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))))))

(assert (= (and d!2614 res!9313) b!8895))

(assert (= (and b!8895 res!9314) b!8896))

(assert (=> d!2614 m!12051))

(declare-fun m!12317 () Bool)

(assert (=> d!2614 m!12317))

(assert (=> b!8652 d!2614))

(declare-fun d!2618 () Bool)

(declare-fun res!9330 () Bool)

(declare-fun e!5509 () Bool)

(assert (=> d!2618 (=> (not res!9330) (not e!5509))))

(assert (=> d!2618 (= res!9330 (= (size!246 (buf!582 thiss!1486)) (size!246 (buf!582 (_2!615 lt!12526)))))))

(assert (=> d!2618 (= (isPrefixOf!0 thiss!1486 (_2!615 lt!12526)) e!5509)))

(declare-fun b!8912 () Bool)

(declare-fun res!9332 () Bool)

(assert (=> b!8912 (=> (not res!9332) (not e!5509))))

(assert (=> b!8912 (= res!9332 (bvsle (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)) (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12526))) (currentByte!1621 (_2!615 lt!12526)) (currentBit!1616 (_2!615 lt!12526)))))))

(declare-fun b!8913 () Bool)

(declare-fun e!5508 () Bool)

(assert (=> b!8913 (= e!5509 e!5508)))

(declare-fun res!9331 () Bool)

(assert (=> b!8913 (=> res!9331 e!5508)))

(assert (=> b!8913 (= res!9331 (= (size!246 (buf!582 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!8914 () Bool)

(assert (=> b!8914 (= e!5508 (arrayBitRangesEq!0 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(assert (= (and d!2618 res!9330) b!8912))

(assert (= (and b!8912 res!9332) b!8913))

(assert (= (and b!8913 (not res!9331)) b!8914))

(assert (=> b!8912 m!11863))

(assert (=> b!8912 m!11861))

(assert (=> b!8914 m!11863))

(assert (=> b!8914 m!11863))

(declare-fun m!12321 () Bool)

(assert (=> b!8914 m!12321))

(assert (=> b!8651 d!2618))

(declare-fun d!2622 () Bool)

(assert (=> d!2622 (= (array_inv!241 srcBuffer!6) (bvsge (size!246 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1824 d!2622))

(declare-fun d!2624 () Bool)

(assert (=> d!2624 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1616 thiss!1486) (currentByte!1621 thiss!1486) (size!246 (buf!582 thiss!1486))))))

(declare-fun bs!858 () Bool)

(assert (= bs!858 d!2624))

(assert (=> bs!858 m!12317))

(assert (=> start!1824 d!2624))

(push 1)

(assert (not b!8742))

(assert (not bm!133))

(assert (not b!8722))

(assert (not d!2606))

(assert (not d!2584))

(assert (not b!8728))

(assert (not b!8725))

(assert (not d!2562))

(assert (not b!8768))

(assert (not d!2558))

(assert (not b!8850))

(assert (not d!2590))

(assert (not d!2614))

(assert (not b!8726))

(assert (not d!2624))

(assert (not b!8807))

(assert (not b!8766))

(assert (not b!8724))

(assert (not d!2604))

(assert (not b!8848))

(assert (not b!8767))

(assert (not b!8846))

(assert (not b!8912))

(assert (not b!8914))

(assert (not b!8808))

(assert (not b!8721))

(assert (not b!8810))

(assert (not d!2600))

(assert (not b!8809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2780 () Bool)

(declare-fun c!551 () Bool)

(assert (=> d!2780 (= c!551 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5639 () List!143)

(assert (=> d!2780 (= (byteArrayBitContentToList!0 (_2!615 lt!12526) (_1!617 (readBits!0 (_1!616 lt!12525) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!5639)))

(declare-fun b!9131 () Bool)

(assert (=> b!9131 (= e!5639 Nil!140)))

(declare-fun b!9132 () Bool)

(assert (=> b!9132 (= e!5639 (Cons!139 (not (= (bvand ((_ sign_extend 24) (select (arr!651 (_1!617 (readBits!0 (_1!616 lt!12525) nBits!460))) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!615 lt!12526) (_1!617 (readBits!0 (_1!616 lt!12525) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2780 c!551) b!9131))

(assert (= (and d!2780 (not c!551)) b!9132))

(declare-fun m!12827 () Bool)

(assert (=> b!9132 m!12827))

(declare-fun m!12829 () Bool)

(assert (=> b!9132 m!12829))

(declare-fun m!12831 () Bool)

(assert (=> b!9132 m!12831))

(assert (=> b!8742 d!2780))

(declare-fun d!2782 () Bool)

(declare-fun res!9488 () Bool)

(declare-fun e!5644 () Bool)

(assert (=> d!2782 (=> res!9488 e!5644)))

(assert (=> d!2782 (= res!9488 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2782 (= (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!617 (readBits!0 (_1!616 call!136) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) e!5644)))

(declare-fun b!9137 () Bool)

(declare-fun e!5645 () Bool)

(assert (=> b!9137 (= e!5644 e!5645)))

(declare-fun res!9489 () Bool)

(assert (=> b!9137 (=> (not res!9489) (not e!5645))))

(assert (=> b!9137 (= res!9489 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!651 (_1!617 (readBits!0 (_1!616 call!136) (bvsub (bvadd from!367 nBits!460) from!367)))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!9138 () Bool)

(assert (=> b!9138 (= e!5645 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!617 (readBits!0 (_1!616 call!136) (bvsub (bvadd from!367 nBits!460) from!367))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2782 (not res!9488)) b!9137))

(assert (= (and b!9137 res!9489) b!9138))

(assert (=> b!9137 m!12027))

(declare-fun m!12833 () Bool)

(assert (=> b!9137 m!12833))

(declare-fun m!12835 () Bool)

(assert (=> b!9137 m!12835))

(assert (=> b!9137 m!12055))

(declare-fun m!12837 () Bool)

(assert (=> b!9138 m!12837))

(assert (=> b!8724 d!2782))

(declare-fun b!9139 () Bool)

(declare-fun res!9493 () Bool)

(declare-fun e!5646 () Bool)

(assert (=> b!9139 (=> (not res!9493) (not e!5646))))

(declare-fun lt!13694 () tuple2!1172)

(assert (=> b!9139 (= res!9493 (invariant!0 (currentBit!1616 (_2!617 lt!13694)) (currentByte!1621 (_2!617 lt!13694)) (size!246 (buf!582 (_2!617 lt!13694)))))))

(declare-fun b!9140 () Bool)

(declare-fun res!9492 () Bool)

(assert (=> b!9140 (=> (not res!9492) (not e!5646))))

(assert (=> b!9140 (= res!9492 (bvsle (currentByte!1621 (_1!616 call!136)) (currentByte!1621 (_2!617 lt!13694))))))

(declare-fun b!9142 () Bool)

(declare-fun res!9494 () Bool)

(assert (=> b!9142 (=> (not res!9494) (not e!5646))))

(declare-fun lt!13690 () (_ BitVec 64))

(assert (=> b!9142 (= res!9494 (= (size!246 (_1!617 lt!13694)) ((_ extract 31 0) lt!13690)))))

(assert (=> b!9142 (and (bvslt lt!13690 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!13690 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!13693 () (_ BitVec 64))

(declare-fun lt!13691 () (_ BitVec 64))

(assert (=> b!9142 (= lt!13690 (bvsdiv lt!13693 lt!13691))))

(assert (=> b!9142 (and (not (= lt!13691 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!13693 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!13691 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!9142 (= lt!13691 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!13696 () (_ BitVec 64))

(declare-fun lt!13695 () (_ BitVec 64))

(assert (=> b!9142 (= lt!13693 (bvsub lt!13696 lt!13695))))

(assert (=> b!9142 (or (= (bvand lt!13696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13695 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13696 lt!13695) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9142 (= lt!13695 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13692 () (_ BitVec 64))

(assert (=> b!9142 (= lt!13696 (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!13692))))

(assert (=> b!9142 (or (not (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13692 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!13692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9142 (= lt!13692 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!9143 () Bool)

(declare-fun res!9490 () Bool)

(assert (=> b!9143 (=> (not res!9490) (not e!5646))))

(declare-fun lt!13697 () (_ BitVec 64))

(assert (=> b!9143 (= res!9490 (= (bvadd lt!13697 (bvsub (bvadd from!367 nBits!460) from!367)) (bitIndex!0 (size!246 (buf!582 (_2!617 lt!13694))) (currentByte!1621 (_2!617 lt!13694)) (currentBit!1616 (_2!617 lt!13694)))))))

(assert (=> b!9143 (or (not (= (bvand lt!13697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13697 (bvsub (bvadd from!367 nBits!460) from!367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9143 (= lt!13697 (bitIndex!0 (size!246 (buf!582 (_1!616 call!136))) (currentByte!1621 (_1!616 call!136)) (currentBit!1616 (_1!616 call!136))))))

(declare-fun d!2784 () Bool)

(assert (=> d!2784 e!5646))

(declare-fun res!9491 () Bool)

(assert (=> d!2784 (=> (not res!9491) (not e!5646))))

(assert (=> d!2784 (= res!9491 (= (buf!582 (_2!617 lt!13694)) (buf!582 (_1!616 call!136))))))

(declare-fun lt!13689 () tuple3!66)

(assert (=> d!2784 (= lt!13694 (tuple2!1173 (_3!33 lt!13689) (_2!626 lt!13689)))))

(assert (=> d!2784 (= lt!13689 (readBitsLoop!0 (_1!616 call!136) (bvsub (bvadd from!367 nBits!460) from!367) (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)))))

(assert (=> d!2784 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bvsle (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2784 (= (readBits!0 (_1!616 call!136) (bvsub (bvadd from!367 nBits!460) from!367)) lt!13694)))

(declare-fun b!9141 () Bool)

(assert (=> b!9141 (= e!5646 (= (byteArrayBitContentToList!0 (_2!617 lt!13694) (_1!617 lt!13694) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bitStreamReadBitsIntoList!0 (_2!617 lt!13694) (_1!616 call!136) (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (= (and d!2784 res!9491) b!9143))

(assert (= (and b!9143 res!9490) b!9139))

(assert (= (and b!9139 res!9493) b!9142))

(assert (= (and b!9142 res!9494) b!9140))

(assert (= (and b!9140 res!9492) b!9141))

(declare-fun m!12839 () Bool)

(assert (=> b!9139 m!12839))

(declare-fun m!12841 () Bool)

(assert (=> b!9143 m!12841))

(declare-fun m!12843 () Bool)

(assert (=> b!9143 m!12843))

(declare-fun m!12845 () Bool)

(assert (=> d!2784 m!12845))

(declare-fun m!12847 () Bool)

(assert (=> b!9141 m!12847))

(declare-fun m!12849 () Bool)

(assert (=> b!9141 m!12849))

(assert (=> b!8724 d!2784))

(declare-fun b!9158 () Bool)

(declare-fun e!5659 () Bool)

(declare-fun e!5664 () Bool)

(assert (=> b!9158 (= e!5659 e!5664)))

(declare-fun res!9507 () Bool)

(declare-fun call!151 () Bool)

(assert (=> b!9158 (= res!9507 call!151)))

(assert (=> b!9158 (=> (not res!9507) (not e!5664))))

(declare-datatypes ((tuple4!2 0))(
  ( (tuple4!3 (_1!629 (_ BitVec 32)) (_2!629 (_ BitVec 32)) (_3!35 (_ BitVec 32)) (_4!1 (_ BitVec 32))) )
))
(declare-fun lt!13706 () tuple4!2)

(declare-fun lt!13704 () (_ BitVec 32))

(declare-fun lt!13705 () (_ BitVec 32))

(declare-fun c!554 () Bool)

(declare-fun bm!148 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!148 (= call!151 (byteRangesEq!0 (select (arr!651 (buf!582 thiss!1486)) (_3!35 lt!13706)) (select (arr!651 (buf!582 (_2!615 lt!12526))) (_3!35 lt!13706)) lt!13704 (ite c!554 lt!13705 #b00000000000000000000000000001000)))))

(declare-fun b!9160 () Bool)

(assert (=> b!9160 (= e!5659 call!151)))

(declare-fun b!9161 () Bool)

(declare-fun res!9508 () Bool)

(assert (=> b!9161 (= res!9508 (= lt!13705 #b00000000000000000000000000000000))))

(declare-fun e!5663 () Bool)

(assert (=> b!9161 (=> res!9508 e!5663)))

(assert (=> b!9161 (= e!5664 e!5663)))

(declare-fun b!9162 () Bool)

(declare-fun e!5662 () Bool)

(declare-fun e!5661 () Bool)

(assert (=> b!9162 (= e!5662 e!5661)))

(declare-fun res!9506 () Bool)

(assert (=> b!9162 (=> (not res!9506) (not e!5661))))

(declare-fun e!5660 () Bool)

(assert (=> b!9162 (= res!9506 e!5660)))

(declare-fun res!9505 () Bool)

(assert (=> b!9162 (=> res!9505 e!5660)))

(assert (=> b!9162 (= res!9505 (bvsge (_1!629 lt!13706) (_2!629 lt!13706)))))

(assert (=> b!9162 (= lt!13705 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9162 (= lt!13704 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!2)

(assert (=> b!9162 (= lt!13706 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(declare-fun b!9163 () Bool)

(assert (=> b!9163 (= e!5663 (byteRangesEq!0 (select (arr!651 (buf!582 thiss!1486)) (_4!1 lt!13706)) (select (arr!651 (buf!582 (_2!615 lt!12526))) (_4!1 lt!13706)) #b00000000000000000000000000000000 lt!13705))))

(declare-fun b!9164 () Bool)

(declare-fun arrayRangesEq!2 (array!574 array!574 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9164 (= e!5660 (arrayRangesEq!2 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12526)) (_1!629 lt!13706) (_2!629 lt!13706)))))

(declare-fun b!9159 () Bool)

(assert (=> b!9159 (= e!5661 e!5659)))

(assert (=> b!9159 (= c!554 (= (_3!35 lt!13706) (_4!1 lt!13706)))))

(declare-fun d!2786 () Bool)

(declare-fun res!9509 () Bool)

(assert (=> d!2786 (=> res!9509 e!5662)))

(assert (=> d!2786 (= res!9509 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(assert (=> d!2786 (= (arrayBitRangesEq!0 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))) e!5662)))

(assert (= (and d!2786 (not res!9509)) b!9162))

(assert (= (and b!9162 (not res!9505)) b!9164))

(assert (= (and b!9162 res!9506) b!9159))

(assert (= (and b!9159 c!554) b!9160))

(assert (= (and b!9159 (not c!554)) b!9158))

(assert (= (and b!9158 res!9507) b!9161))

(assert (= (and b!9161 (not res!9508)) b!9163))

(assert (= (or b!9160 b!9158) bm!148))

(declare-fun m!12851 () Bool)

(assert (=> bm!148 m!12851))

(declare-fun m!12853 () Bool)

(assert (=> bm!148 m!12853))

(assert (=> bm!148 m!12851))

(assert (=> bm!148 m!12853))

(declare-fun m!12855 () Bool)

(assert (=> bm!148 m!12855))

(assert (=> b!9162 m!11863))

(declare-fun m!12857 () Bool)

(assert (=> b!9162 m!12857))

(declare-fun m!12859 () Bool)

(assert (=> b!9163 m!12859))

(declare-fun m!12861 () Bool)

(assert (=> b!9163 m!12861))

(assert (=> b!9163 m!12859))

(assert (=> b!9163 m!12861))

(declare-fun m!12863 () Bool)

(assert (=> b!9163 m!12863))

(declare-fun m!12865 () Bool)

(assert (=> b!9164 m!12865))

(assert (=> b!8914 d!2786))

(assert (=> b!8914 d!2614))

(declare-fun d!2788 () Bool)

(assert (=> d!2788 (= (invariant!0 (currentBit!1616 (_2!615 lt!12867)) (currentByte!1621 (_2!615 lt!12867)) (size!246 (buf!582 (_2!615 lt!12867)))) (and (bvsge (currentBit!1616 (_2!615 lt!12867)) #b00000000000000000000000000000000) (bvslt (currentBit!1616 (_2!615 lt!12867)) #b00000000000000000000000000001000) (bvsge (currentByte!1621 (_2!615 lt!12867)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1621 (_2!615 lt!12867)) (size!246 (buf!582 (_2!615 lt!12867)))) (and (= (currentBit!1616 (_2!615 lt!12867)) #b00000000000000000000000000000000) (= (currentByte!1621 (_2!615 lt!12867)) (size!246 (buf!582 (_2!615 lt!12867))))))))))

(assert (=> b!8722 d!2788))

(assert (=> b!8912 d!2614))

(assert (=> b!8912 d!2606))

(declare-fun d!2790 () Bool)

(declare-fun size!248 (List!143) Int)

(assert (=> d!2790 (= (length!21 lt!12956) (size!248 lt!12956))))

(declare-fun bs!883 () Bool)

(assert (= bs!883 d!2790))

(declare-fun m!12867 () Bool)

(assert (=> bs!883 m!12867))

(assert (=> b!8768 d!2790))

(declare-fun d!2792 () Bool)

(assert (=> d!2792 (= (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 thiss!1486)))))))

(assert (=> d!2562 d!2792))

(declare-fun d!2794 () Bool)

(assert (=> d!2794 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12839) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 thiss!1486))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486))) lt!12839))))

(declare-fun bs!884 () Bool)

(assert (= bs!884 d!2794))

(assert (=> bs!884 m!12051))

(assert (=> b!8721 d!2794))

(declare-fun b!9168 () Bool)

(declare-fun e!5666 () Bool)

(declare-fun lt!13709 () List!143)

(assert (=> b!9168 (= e!5666 (> (length!21 lt!13709) 0))))

(declare-fun d!2796 () Bool)

(assert (=> d!2796 e!5666))

(declare-fun c!555 () Bool)

(assert (=> d!2796 (= c!555 (= (bvsub nBits!460 lt!12955) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5665 () tuple2!1178)

(assert (=> d!2796 (= lt!13709 (_1!622 e!5665))))

(declare-fun c!556 () Bool)

(assert (=> d!2796 (= c!556 (= (bvsub nBits!460 lt!12955) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2796 (bvsge (bvsub nBits!460 lt!12955) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2796 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12526) (_2!623 lt!12954) (bvsub nBits!460 lt!12955)) lt!13709)))

(declare-fun lt!13707 () tuple2!1180)

(declare-fun lt!13708 () (_ BitVec 64))

(declare-fun b!9166 () Bool)

(assert (=> b!9166 (= e!5665 (tuple2!1179 (Cons!139 (_1!623 lt!13707) (bitStreamReadBitsIntoList!0 (_2!615 lt!12526) (_2!623 lt!13707) (bvsub (bvsub nBits!460 lt!12955) lt!13708))) (_2!623 lt!13707)))))

(assert (=> b!9166 (= lt!13707 (readBit!0 (_2!623 lt!12954)))))

(assert (=> b!9166 (= lt!13708 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9165 () Bool)

(assert (=> b!9165 (= e!5665 (tuple2!1179 Nil!140 (_2!623 lt!12954)))))

(declare-fun b!9167 () Bool)

(assert (=> b!9167 (= e!5666 (isEmpty!26 lt!13709))))

(assert (= (and d!2796 c!556) b!9165))

(assert (= (and d!2796 (not c!556)) b!9166))

(assert (= (and d!2796 c!555) b!9167))

(assert (= (and d!2796 (not c!555)) b!9168))

(declare-fun m!12869 () Bool)

(assert (=> b!9168 m!12869))

(declare-fun m!12871 () Bool)

(assert (=> b!9166 m!12871))

(declare-fun m!12873 () Bool)

(assert (=> b!9166 m!12873))

(declare-fun m!12875 () Bool)

(assert (=> b!9167 m!12875))

(assert (=> b!8766 d!2796))

(declare-fun d!2798 () Bool)

(declare-fun e!5673 () Bool)

(assert (=> d!2798 e!5673))

(declare-fun res!9512 () Bool)

(assert (=> d!2798 (=> (not res!9512) (not e!5673))))

(declare-fun increaseBitIndex!0 (BitStream!470) tuple2!1168)

(assert (=> d!2798 (= res!9512 (= (buf!582 (_2!615 (increaseBitIndex!0 (_1!616 lt!12525)))) (buf!582 (_1!616 lt!12525))))))

(declare-fun lt!13727 () Bool)

(assert (=> d!2798 (= lt!13727 (not (= (bvand ((_ sign_extend 24) (select (arr!651 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1616 (_1!616 lt!12525))))) #b00000000000000000000000000000000)))))

(declare-fun lt!13724 () tuple2!1180)

(assert (=> d!2798 (= lt!13724 (tuple2!1181 (not (= (bvand ((_ sign_extend 24) (select (arr!651 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1616 (_1!616 lt!12525))))) #b00000000000000000000000000000000)) (_2!615 (increaseBitIndex!0 (_1!616 lt!12525)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!2798 (validate_offset_bit!0 ((_ sign_extend 32) (size!246 (buf!582 (_1!616 lt!12525)))) ((_ sign_extend 32) (currentByte!1621 (_1!616 lt!12525))) ((_ sign_extend 32) (currentBit!1616 (_1!616 lt!12525))))))

(assert (=> d!2798 (= (readBit!0 (_1!616 lt!12525)) lt!13724)))

(declare-fun lt!13725 () (_ BitVec 64))

(declare-fun lt!13726 () (_ BitVec 64))

(declare-fun b!9171 () Bool)

(assert (=> b!9171 (= e!5673 (= (bitIndex!0 (size!246 (buf!582 (_2!615 (increaseBitIndex!0 (_1!616 lt!12525))))) (currentByte!1621 (_2!615 (increaseBitIndex!0 (_1!616 lt!12525)))) (currentBit!1616 (_2!615 (increaseBitIndex!0 (_1!616 lt!12525))))) (bvadd lt!13726 lt!13725)))))

(assert (=> b!9171 (or (not (= (bvand lt!13726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13725 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13726 lt!13725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9171 (= lt!13725 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!9171 (= lt!13726 (bitIndex!0 (size!246 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)) (currentBit!1616 (_1!616 lt!12525))))))

(declare-fun lt!13729 () Bool)

(assert (=> b!9171 (= lt!13729 (not (= (bvand ((_ sign_extend 24) (select (arr!651 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1616 (_1!616 lt!12525))))) #b00000000000000000000000000000000)))))

(declare-fun lt!13730 () Bool)

(assert (=> b!9171 (= lt!13730 (not (= (bvand ((_ sign_extend 24) (select (arr!651 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1616 (_1!616 lt!12525))))) #b00000000000000000000000000000000)))))

(declare-fun lt!13728 () Bool)

(assert (=> b!9171 (= lt!13728 (not (= (bvand ((_ sign_extend 24) (select (arr!651 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1616 (_1!616 lt!12525))))) #b00000000000000000000000000000000)))))

(assert (= (and d!2798 res!9512) b!9171))

(declare-fun m!12877 () Bool)

(assert (=> d!2798 m!12877))

(declare-fun m!12879 () Bool)

(assert (=> d!2798 m!12879))

(declare-fun m!12881 () Bool)

(assert (=> d!2798 m!12881))

(declare-fun m!12883 () Bool)

(assert (=> d!2798 m!12883))

(assert (=> b!9171 m!12881))

(assert (=> b!9171 m!12877))

(assert (=> b!9171 m!12879))

(assert (=> b!9171 m!12249))

(declare-fun m!12885 () Bool)

(assert (=> b!9171 m!12885))

(assert (=> b!8766 d!2798))

(declare-fun d!2800 () Bool)

(assert (=> d!2800 (= (isEmpty!26 lt!12956) (is-Nil!140 lt!12956))))

(assert (=> b!8767 d!2800))

(declare-fun d!2802 () Bool)

(assert (=> d!2802 (= (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12526))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12526)))) (bvsub (bvmul ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12526))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12526))))))))

(assert (=> d!2606 d!2802))

(assert (=> d!2606 d!2554))

(declare-fun d!2804 () Bool)

(declare-fun res!9513 () Bool)

(declare-fun e!5675 () Bool)

(assert (=> d!2804 (=> (not res!9513) (not e!5675))))

(assert (=> d!2804 (= res!9513 (= (size!246 (buf!582 (_1!616 lt!13085))) (size!246 (buf!582 thiss!1486))))))

(assert (=> d!2804 (= (isPrefixOf!0 (_1!616 lt!13085) thiss!1486) e!5675)))

(declare-fun b!9172 () Bool)

(declare-fun res!9515 () Bool)

(assert (=> b!9172 (=> (not res!9515) (not e!5675))))

(assert (=> b!9172 (= res!9515 (bvsle (bitIndex!0 (size!246 (buf!582 (_1!616 lt!13085))) (currentByte!1621 (_1!616 lt!13085)) (currentBit!1616 (_1!616 lt!13085))) (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(declare-fun b!9173 () Bool)

(declare-fun e!5674 () Bool)

(assert (=> b!9173 (= e!5675 e!5674)))

(declare-fun res!9514 () Bool)

(assert (=> b!9173 (=> res!9514 e!5674)))

(assert (=> b!9173 (= res!9514 (= (size!246 (buf!582 (_1!616 lt!13085))) #b00000000000000000000000000000000))))

(declare-fun b!9174 () Bool)

(assert (=> b!9174 (= e!5674 (arrayBitRangesEq!0 (buf!582 (_1!616 lt!13085)) (buf!582 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 (_1!616 lt!13085))) (currentByte!1621 (_1!616 lt!13085)) (currentBit!1616 (_1!616 lt!13085)))))))

(assert (= (and d!2804 res!9513) b!9172))

(assert (= (and b!9172 res!9515) b!9173))

(assert (= (and b!9173 (not res!9514)) b!9174))

(declare-fun m!12887 () Bool)

(assert (=> b!9172 m!12887))

(assert (=> b!9172 m!11863))

(assert (=> b!9174 m!12887))

(assert (=> b!9174 m!12887))

(declare-fun m!12889 () Bool)

(assert (=> b!9174 m!12889))

(assert (=> b!8810 d!2804))

(assert (=> b!8808 d!2614))

(declare-fun d!2806 () Bool)

(assert (=> d!2806 (arrayBitRangesEq!0 (buf!582 (_2!615 lt!12526)) (buf!582 thiss!1486) lt!13077 lt!13081)))

(declare-fun lt!13733 () Unit!746)

(declare-fun choose!8 (array!574 array!574 (_ BitVec 64) (_ BitVec 64)) Unit!746)

(assert (=> d!2806 (= lt!13733 (choose!8 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12526)) lt!13077 lt!13081))))

(assert (=> d!2806 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13077) (bvsle lt!13077 lt!13081))))

(assert (=> d!2806 (= (arrayBitRangesEqSymmetric!0 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12526)) lt!13077 lt!13081) lt!13733)))

(declare-fun bs!885 () Bool)

(assert (= bs!885 d!2806))

(assert (=> bs!885 m!12223))

(declare-fun m!12891 () Bool)

(assert (=> bs!885 m!12891))

(assert (=> b!8808 d!2806))

(declare-fun b!9175 () Bool)

(declare-fun e!5676 () Bool)

(declare-fun e!5681 () Bool)

(assert (=> b!9175 (= e!5676 e!5681)))

(declare-fun res!9518 () Bool)

(declare-fun call!152 () Bool)

(assert (=> b!9175 (= res!9518 call!152)))

(assert (=> b!9175 (=> (not res!9518) (not e!5681))))

(declare-fun lt!13734 () (_ BitVec 32))

(declare-fun lt!13735 () (_ BitVec 32))

(declare-fun lt!13736 () tuple4!2)

(declare-fun c!557 () Bool)

(declare-fun bm!149 () Bool)

(assert (=> bm!149 (= call!152 (byteRangesEq!0 (select (arr!651 (buf!582 (_2!615 lt!12526))) (_3!35 lt!13736)) (select (arr!651 (buf!582 thiss!1486)) (_3!35 lt!13736)) lt!13734 (ite c!557 lt!13735 #b00000000000000000000000000001000)))))

(declare-fun b!9177 () Bool)

(assert (=> b!9177 (= e!5676 call!152)))

(declare-fun b!9178 () Bool)

(declare-fun res!9519 () Bool)

(assert (=> b!9178 (= res!9519 (= lt!13735 #b00000000000000000000000000000000))))

(declare-fun e!5680 () Bool)

(assert (=> b!9178 (=> res!9519 e!5680)))

(assert (=> b!9178 (= e!5681 e!5680)))

(declare-fun b!9179 () Bool)

(declare-fun e!5679 () Bool)

(declare-fun e!5678 () Bool)

(assert (=> b!9179 (= e!5679 e!5678)))

(declare-fun res!9517 () Bool)

(assert (=> b!9179 (=> (not res!9517) (not e!5678))))

(declare-fun e!5677 () Bool)

(assert (=> b!9179 (= res!9517 e!5677)))

(declare-fun res!9516 () Bool)

(assert (=> b!9179 (=> res!9516 e!5677)))

(assert (=> b!9179 (= res!9516 (bvsge (_1!629 lt!13736) (_2!629 lt!13736)))))

(assert (=> b!9179 (= lt!13735 ((_ extract 31 0) (bvsrem lt!13081 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9179 (= lt!13734 ((_ extract 31 0) (bvsrem lt!13077 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9179 (= lt!13736 (arrayBitIndices!0 lt!13077 lt!13081))))

(declare-fun b!9180 () Bool)

(assert (=> b!9180 (= e!5680 (byteRangesEq!0 (select (arr!651 (buf!582 (_2!615 lt!12526))) (_4!1 lt!13736)) (select (arr!651 (buf!582 thiss!1486)) (_4!1 lt!13736)) #b00000000000000000000000000000000 lt!13735))))

(declare-fun b!9181 () Bool)

(assert (=> b!9181 (= e!5677 (arrayRangesEq!2 (buf!582 (_2!615 lt!12526)) (buf!582 thiss!1486) (_1!629 lt!13736) (_2!629 lt!13736)))))

(declare-fun b!9176 () Bool)

(assert (=> b!9176 (= e!5678 e!5676)))

(assert (=> b!9176 (= c!557 (= (_3!35 lt!13736) (_4!1 lt!13736)))))

(declare-fun d!2808 () Bool)

(declare-fun res!9520 () Bool)

(assert (=> d!2808 (=> res!9520 e!5679)))

(assert (=> d!2808 (= res!9520 (bvsge lt!13077 lt!13081))))

(assert (=> d!2808 (= (arrayBitRangesEq!0 (buf!582 (_2!615 lt!12526)) (buf!582 thiss!1486) lt!13077 lt!13081) e!5679)))

(assert (= (and d!2808 (not res!9520)) b!9179))

(assert (= (and b!9179 (not res!9516)) b!9181))

(assert (= (and b!9179 res!9517) b!9176))

(assert (= (and b!9176 c!557) b!9177))

(assert (= (and b!9176 (not c!557)) b!9175))

(assert (= (and b!9175 res!9518) b!9178))

(assert (= (and b!9178 (not res!9519)) b!9180))

(assert (= (or b!9177 b!9175) bm!149))

(declare-fun m!12893 () Bool)

(assert (=> bm!149 m!12893))

(declare-fun m!12895 () Bool)

(assert (=> bm!149 m!12895))

(assert (=> bm!149 m!12893))

(assert (=> bm!149 m!12895))

(declare-fun m!12897 () Bool)

(assert (=> bm!149 m!12897))

(declare-fun m!12899 () Bool)

(assert (=> b!9179 m!12899))

(declare-fun m!12901 () Bool)

(assert (=> b!9180 m!12901))

(declare-fun m!12903 () Bool)

(assert (=> b!9180 m!12903))

(assert (=> b!9180 m!12901))

(assert (=> b!9180 m!12903))

(declare-fun m!12905 () Bool)

(assert (=> b!9180 m!12905))

(declare-fun m!12907 () Bool)

(assert (=> b!9181 m!12907))

(assert (=> b!8808 d!2808))

(declare-fun d!2810 () Bool)

(declare-fun res!9521 () Bool)

(declare-fun e!5683 () Bool)

(assert (=> d!2810 (=> (not res!9521) (not e!5683))))

(assert (=> d!2810 (= res!9521 (= (size!246 (buf!582 (_2!616 lt!13085))) (size!246 (buf!582 (_2!615 lt!12526)))))))

(assert (=> d!2810 (= (isPrefixOf!0 (_2!616 lt!13085) (_2!615 lt!12526)) e!5683)))

(declare-fun b!9182 () Bool)

(declare-fun res!9523 () Bool)

(assert (=> b!9182 (=> (not res!9523) (not e!5683))))

(assert (=> b!9182 (= res!9523 (bvsle (bitIndex!0 (size!246 (buf!582 (_2!616 lt!13085))) (currentByte!1621 (_2!616 lt!13085)) (currentBit!1616 (_2!616 lt!13085))) (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12526))) (currentByte!1621 (_2!615 lt!12526)) (currentBit!1616 (_2!615 lt!12526)))))))

(declare-fun b!9183 () Bool)

(declare-fun e!5682 () Bool)

(assert (=> b!9183 (= e!5683 e!5682)))

(declare-fun res!9522 () Bool)

(assert (=> b!9183 (=> res!9522 e!5682)))

(assert (=> b!9183 (= res!9522 (= (size!246 (buf!582 (_2!616 lt!13085))) #b00000000000000000000000000000000))))

(declare-fun b!9184 () Bool)

(assert (=> b!9184 (= e!5682 (arrayBitRangesEq!0 (buf!582 (_2!616 lt!13085)) (buf!582 (_2!615 lt!12526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 (_2!616 lt!13085))) (currentByte!1621 (_2!616 lt!13085)) (currentBit!1616 (_2!616 lt!13085)))))))

(assert (= (and d!2810 res!9521) b!9182))

(assert (= (and b!9182 res!9523) b!9183))

(assert (= (and b!9183 (not res!9522)) b!9184))

(declare-fun m!12909 () Bool)

(assert (=> b!9182 m!12909))

(assert (=> b!9182 m!11861))

(assert (=> b!9184 m!12909))

(assert (=> b!9184 m!12909))

(declare-fun m!12911 () Bool)

(assert (=> b!9184 m!12911))

(assert (=> b!8809 d!2810))

(declare-fun d!2812 () Bool)

(declare-fun e!5686 () Bool)

(assert (=> d!2812 e!5686))

(declare-fun res!9526 () Bool)

(assert (=> d!2812 (=> (not res!9526) (not e!5686))))

(declare-fun lt!13741 () BitStream!470)

(declare-fun lt!13742 () (_ BitVec 64))

(assert (=> d!2812 (= res!9526 (= (bvadd lt!13742 (bvsub lt!13074 lt!13075)) (bitIndex!0 (size!246 (buf!582 lt!13741)) (currentByte!1621 lt!13741) (currentBit!1616 lt!13741))))))

(assert (=> d!2812 (or (not (= (bvand lt!13742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13074 lt!13075) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13742 (bvsub lt!13074 lt!13075)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2812 (= lt!13742 (bitIndex!0 (size!246 (buf!582 (_2!616 lt!13085))) (currentByte!1621 (_2!616 lt!13085)) (currentBit!1616 (_2!616 lt!13085))))))

(declare-fun moveBitIndex!0 (BitStream!470 (_ BitVec 64)) tuple2!1168)

(assert (=> d!2812 (= lt!13741 (_2!615 (moveBitIndex!0 (_2!616 lt!13085) (bvsub lt!13074 lt!13075))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!470 (_ BitVec 64)) Bool)

(assert (=> d!2812 (moveBitIndexPrecond!0 (_2!616 lt!13085) (bvsub lt!13074 lt!13075))))

(assert (=> d!2812 (= (withMovedBitIndex!0 (_2!616 lt!13085) (bvsub lt!13074 lt!13075)) lt!13741)))

(declare-fun b!9187 () Bool)

(assert (=> b!9187 (= e!5686 (= (size!246 (buf!582 (_2!616 lt!13085))) (size!246 (buf!582 lt!13741))))))

(assert (= (and d!2812 res!9526) b!9187))

(declare-fun m!12913 () Bool)

(assert (=> d!2812 m!12913))

(assert (=> d!2812 m!12909))

(declare-fun m!12915 () Bool)

(assert (=> d!2812 m!12915))

(declare-fun m!12917 () Bool)

(assert (=> d!2812 m!12917))

(assert (=> b!8807 d!2812))

(assert (=> b!8807 d!2606))

(assert (=> b!8807 d!2614))

(declare-fun d!2814 () Bool)

(declare-fun e!5687 () Bool)

(assert (=> d!2814 e!5687))

(declare-fun res!9527 () Bool)

(assert (=> d!2814 (=> (not res!9527) (not e!5687))))

(declare-fun lt!13744 () (_ BitVec 64))

(declare-fun lt!13745 () (_ BitVec 64))

(declare-fun lt!13743 () (_ BitVec 64))

(assert (=> d!2814 (= res!9527 (= lt!13745 (bvsub lt!13744 lt!13743)))))

(assert (=> d!2814 (or (= (bvand lt!13744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13743 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13744 lt!13743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2814 (= lt!13743 (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!617 lt!13160)))) ((_ sign_extend 32) (currentByte!1621 (_2!617 lt!13160))) ((_ sign_extend 32) (currentBit!1616 (_2!617 lt!13160)))))))

(declare-fun lt!13748 () (_ BitVec 64))

(declare-fun lt!13746 () (_ BitVec 64))

(assert (=> d!2814 (= lt!13744 (bvmul lt!13748 lt!13746))))

(assert (=> d!2814 (or (= lt!13748 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13746 (bvsdiv (bvmul lt!13748 lt!13746) lt!13748)))))

(assert (=> d!2814 (= lt!13746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2814 (= lt!13748 ((_ sign_extend 32) (size!246 (buf!582 (_2!617 lt!13160)))))))

(assert (=> d!2814 (= lt!13745 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 (_2!617 lt!13160))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 (_2!617 lt!13160)))))))

(assert (=> d!2814 (invariant!0 (currentBit!1616 (_2!617 lt!13160)) (currentByte!1621 (_2!617 lt!13160)) (size!246 (buf!582 (_2!617 lt!13160))))))

(assert (=> d!2814 (= (bitIndex!0 (size!246 (buf!582 (_2!617 lt!13160))) (currentByte!1621 (_2!617 lt!13160)) (currentBit!1616 (_2!617 lt!13160))) lt!13745)))

(declare-fun b!9188 () Bool)

(declare-fun res!9528 () Bool)

(assert (=> b!9188 (=> (not res!9528) (not e!5687))))

(assert (=> b!9188 (= res!9528 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13745))))

(declare-fun b!9189 () Bool)

(declare-fun lt!13747 () (_ BitVec 64))

(assert (=> b!9189 (= e!5687 (bvsle lt!13745 (bvmul lt!13747 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9189 (or (= lt!13747 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13747 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13747)))))

(assert (=> b!9189 (= lt!13747 ((_ sign_extend 32) (size!246 (buf!582 (_2!617 lt!13160)))))))

(assert (= (and d!2814 res!9527) b!9188))

(assert (= (and b!9188 res!9528) b!9189))

(declare-fun m!12919 () Bool)

(assert (=> d!2814 m!12919))

(assert (=> d!2814 m!12245))

(assert (=> b!8850 d!2814))

(declare-fun d!2816 () Bool)

(declare-fun e!5688 () Bool)

(assert (=> d!2816 e!5688))

(declare-fun res!9529 () Bool)

(assert (=> d!2816 (=> (not res!9529) (not e!5688))))

(declare-fun lt!13749 () (_ BitVec 64))

(declare-fun lt!13750 () (_ BitVec 64))

(declare-fun lt!13751 () (_ BitVec 64))

(assert (=> d!2816 (= res!9529 (= lt!13751 (bvsub lt!13750 lt!13749)))))

(assert (=> d!2816 (or (= (bvand lt!13750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13750 lt!13749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2816 (= lt!13749 (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_1!616 lt!12525)))) ((_ sign_extend 32) (currentByte!1621 (_1!616 lt!12525))) ((_ sign_extend 32) (currentBit!1616 (_1!616 lt!12525)))))))

(declare-fun lt!13754 () (_ BitVec 64))

(declare-fun lt!13752 () (_ BitVec 64))

(assert (=> d!2816 (= lt!13750 (bvmul lt!13754 lt!13752))))

(assert (=> d!2816 (or (= lt!13754 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13752 (bvsdiv (bvmul lt!13754 lt!13752) lt!13754)))))

(assert (=> d!2816 (= lt!13752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2816 (= lt!13754 ((_ sign_extend 32) (size!246 (buf!582 (_1!616 lt!12525)))))))

(assert (=> d!2816 (= lt!13751 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 (_1!616 lt!12525))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 (_1!616 lt!12525)))))))

(assert (=> d!2816 (invariant!0 (currentBit!1616 (_1!616 lt!12525)) (currentByte!1621 (_1!616 lt!12525)) (size!246 (buf!582 (_1!616 lt!12525))))))

(assert (=> d!2816 (= (bitIndex!0 (size!246 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)) (currentBit!1616 (_1!616 lt!12525))) lt!13751)))

(declare-fun b!9190 () Bool)

(declare-fun res!9530 () Bool)

(assert (=> b!9190 (=> (not res!9530) (not e!5688))))

(assert (=> b!9190 (= res!9530 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13751))))

(declare-fun b!9191 () Bool)

(declare-fun lt!13753 () (_ BitVec 64))

(assert (=> b!9191 (= e!5688 (bvsle lt!13751 (bvmul lt!13753 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9191 (or (= lt!13753 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13753 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13753)))))

(assert (=> b!9191 (= lt!13753 ((_ sign_extend 32) (size!246 (buf!582 (_1!616 lt!12525)))))))

(assert (= (and d!2816 res!9529) b!9190))

(assert (= (and b!9190 res!9530) b!9191))

(declare-fun m!12921 () Bool)

(assert (=> d!2816 m!12921))

(declare-fun m!12923 () Bool)

(assert (=> d!2816 m!12923))

(assert (=> b!8850 d!2816))

(declare-fun d!2818 () Bool)

(assert (=> d!2818 (= (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 thiss!1486)))))))

(assert (=> d!2604 d!2818))

(declare-fun d!2820 () Bool)

(declare-fun res!9531 () Bool)

(declare-fun e!5690 () Bool)

(assert (=> d!2820 (=> (not res!9531) (not e!5690))))

(assert (=> d!2820 (= res!9531 (= (size!246 (buf!582 thiss!1486)) (size!246 (buf!582 thiss!1486))))))

(assert (=> d!2820 (= (isPrefixOf!0 thiss!1486 thiss!1486) e!5690)))

(declare-fun b!9192 () Bool)

(declare-fun res!9533 () Bool)

(assert (=> b!9192 (=> (not res!9533) (not e!5690))))

(assert (=> b!9192 (= res!9533 (bvsle (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)) (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(declare-fun b!9193 () Bool)

(declare-fun e!5689 () Bool)

(assert (=> b!9193 (= e!5690 e!5689)))

(declare-fun res!9532 () Bool)

(assert (=> b!9193 (=> res!9532 e!5689)))

(assert (=> b!9193 (= res!9532 (= (size!246 (buf!582 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9194 () Bool)

(assert (=> b!9194 (= e!5689 (arrayBitRangesEq!0 (buf!582 thiss!1486) (buf!582 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(assert (= (and d!2820 res!9531) b!9192))

(assert (= (and b!9192 res!9533) b!9193))

(assert (= (and b!9193 (not res!9532)) b!9194))

(assert (=> b!9192 m!11863))

(assert (=> b!9192 m!11863))

(assert (=> b!9194 m!11863))

(assert (=> b!9194 m!11863))

(declare-fun m!12925 () Bool)

(assert (=> b!9194 m!12925))

(assert (=> d!2584 d!2820))

(declare-fun d!2822 () Bool)

(assert (=> d!2822 (isPrefixOf!0 lt!13080 (_2!615 lt!12526))))

(declare-fun lt!13757 () Unit!746)

(declare-fun choose!30 (BitStream!470 BitStream!470 BitStream!470) Unit!746)

(assert (=> d!2822 (= lt!13757 (choose!30 lt!13080 (_2!615 lt!12526) (_2!615 lt!12526)))))

(assert (=> d!2822 (isPrefixOf!0 lt!13080 (_2!615 lt!12526))))

(assert (=> d!2822 (= (lemmaIsPrefixTransitive!0 lt!13080 (_2!615 lt!12526) (_2!615 lt!12526)) lt!13757)))

(declare-fun bs!886 () Bool)

(assert (= bs!886 d!2822))

(assert (=> bs!886 m!12209))

(declare-fun m!12927 () Bool)

(assert (=> bs!886 m!12927))

(assert (=> bs!886 m!12209))

(assert (=> d!2584 d!2822))

(declare-fun d!2824 () Bool)

(declare-fun res!9534 () Bool)

(declare-fun e!5692 () Bool)

(assert (=> d!2824 (=> (not res!9534) (not e!5692))))

(assert (=> d!2824 (= res!9534 (= (size!246 (buf!582 (_2!615 lt!12526))) (size!246 (buf!582 (_2!615 lt!12526)))))))

(assert (=> d!2824 (= (isPrefixOf!0 (_2!615 lt!12526) (_2!615 lt!12526)) e!5692)))

(declare-fun b!9195 () Bool)

(declare-fun res!9536 () Bool)

(assert (=> b!9195 (=> (not res!9536) (not e!5692))))

(assert (=> b!9195 (= res!9536 (bvsle (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12526))) (currentByte!1621 (_2!615 lt!12526)) (currentBit!1616 (_2!615 lt!12526))) (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12526))) (currentByte!1621 (_2!615 lt!12526)) (currentBit!1616 (_2!615 lt!12526)))))))

(declare-fun b!9196 () Bool)

(declare-fun e!5691 () Bool)

(assert (=> b!9196 (= e!5692 e!5691)))

(declare-fun res!9535 () Bool)

(assert (=> b!9196 (=> res!9535 e!5691)))

(assert (=> b!9196 (= res!9535 (= (size!246 (buf!582 (_2!615 lt!12526))) #b00000000000000000000000000000000))))

(declare-fun b!9197 () Bool)

(assert (=> b!9197 (= e!5691 (arrayBitRangesEq!0 (buf!582 (_2!615 lt!12526)) (buf!582 (_2!615 lt!12526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12526))) (currentByte!1621 (_2!615 lt!12526)) (currentBit!1616 (_2!615 lt!12526)))))))

(assert (= (and d!2824 res!9534) b!9195))

(assert (= (and b!9195 res!9536) b!9196))

(assert (= (and b!9196 (not res!9535)) b!9197))

(assert (=> b!9195 m!11861))

(assert (=> b!9195 m!11861))

(assert (=> b!9197 m!11861))

(assert (=> b!9197 m!11861))

(declare-fun m!12929 () Bool)

(assert (=> b!9197 m!12929))

(assert (=> d!2584 d!2824))

(declare-fun d!2826 () Bool)

(assert (=> d!2826 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lt!13760 () Unit!746)

(declare-fun choose!11 (BitStream!470) Unit!746)

(assert (=> d!2826 (= lt!13760 (choose!11 thiss!1486))))

(assert (=> d!2826 (= (lemmaIsPrefixRefl!0 thiss!1486) lt!13760)))

(declare-fun bs!888 () Bool)

(assert (= bs!888 d!2826))

(assert (=> bs!888 m!12045))

(declare-fun m!12931 () Bool)

(assert (=> bs!888 m!12931))

(assert (=> d!2584 d!2826))

(declare-fun d!2828 () Bool)

(assert (=> d!2828 (isPrefixOf!0 lt!13080 (_2!615 lt!12526))))

(declare-fun lt!13761 () Unit!746)

(assert (=> d!2828 (= lt!13761 (choose!30 lt!13080 thiss!1486 (_2!615 lt!12526)))))

(assert (=> d!2828 (isPrefixOf!0 lt!13080 thiss!1486)))

(assert (=> d!2828 (= (lemmaIsPrefixTransitive!0 lt!13080 thiss!1486 (_2!615 lt!12526)) lt!13761)))

(declare-fun bs!889 () Bool)

(assert (= bs!889 d!2828))

(assert (=> bs!889 m!12209))

(declare-fun m!12933 () Bool)

(assert (=> bs!889 m!12933))

(declare-fun m!12935 () Bool)

(assert (=> bs!889 m!12935))

(assert (=> d!2584 d!2828))

(assert (=> d!2584 d!2618))

(declare-fun d!2830 () Bool)

(assert (=> d!2830 (isPrefixOf!0 lt!13080 lt!13080)))

(declare-fun lt!13762 () Unit!746)

(assert (=> d!2830 (= lt!13762 (choose!11 lt!13080))))

(assert (=> d!2830 (= (lemmaIsPrefixRefl!0 lt!13080) lt!13762)))

(declare-fun bs!890 () Bool)

(assert (= bs!890 d!2830))

(assert (=> bs!890 m!12205))

(declare-fun m!12937 () Bool)

(assert (=> bs!890 m!12937))

(assert (=> d!2584 d!2830))

(declare-fun d!2832 () Bool)

(declare-fun res!9537 () Bool)

(declare-fun e!5694 () Bool)

(assert (=> d!2832 (=> (not res!9537) (not e!5694))))

(assert (=> d!2832 (= res!9537 (= (size!246 (buf!582 lt!13080)) (size!246 (buf!582 (_2!615 lt!12526)))))))

(assert (=> d!2832 (= (isPrefixOf!0 lt!13080 (_2!615 lt!12526)) e!5694)))

(declare-fun b!9198 () Bool)

(declare-fun res!9539 () Bool)

(assert (=> b!9198 (=> (not res!9539) (not e!5694))))

(assert (=> b!9198 (= res!9539 (bvsle (bitIndex!0 (size!246 (buf!582 lt!13080)) (currentByte!1621 lt!13080) (currentBit!1616 lt!13080)) (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12526))) (currentByte!1621 (_2!615 lt!12526)) (currentBit!1616 (_2!615 lt!12526)))))))

(declare-fun b!9199 () Bool)

(declare-fun e!5693 () Bool)

(assert (=> b!9199 (= e!5694 e!5693)))

(declare-fun res!9538 () Bool)

(assert (=> b!9199 (=> res!9538 e!5693)))

(assert (=> b!9199 (= res!9538 (= (size!246 (buf!582 lt!13080)) #b00000000000000000000000000000000))))

(declare-fun b!9200 () Bool)

(assert (=> b!9200 (= e!5693 (arrayBitRangesEq!0 (buf!582 lt!13080) (buf!582 (_2!615 lt!12526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 lt!13080)) (currentByte!1621 lt!13080) (currentBit!1616 lt!13080))))))

(assert (= (and d!2832 res!9537) b!9198))

(assert (= (and b!9198 res!9539) b!9199))

(assert (= (and b!9199 (not res!9538)) b!9200))

(declare-fun m!12939 () Bool)

(assert (=> b!9198 m!12939))

(assert (=> b!9198 m!11861))

(assert (=> b!9200 m!12939))

(assert (=> b!9200 m!12939))

(declare-fun m!12941 () Bool)

(assert (=> b!9200 m!12941))

(assert (=> d!2584 d!2832))

(declare-fun d!2834 () Bool)

(declare-fun res!9540 () Bool)

(declare-fun e!5696 () Bool)

(assert (=> d!2834 (=> (not res!9540) (not e!5696))))

(assert (=> d!2834 (= res!9540 (= (size!246 (buf!582 (_1!616 lt!13085))) (size!246 (buf!582 (_2!616 lt!13085)))))))

(assert (=> d!2834 (= (isPrefixOf!0 (_1!616 lt!13085) (_2!616 lt!13085)) e!5696)))

(declare-fun b!9201 () Bool)

(declare-fun res!9542 () Bool)

(assert (=> b!9201 (=> (not res!9542) (not e!5696))))

(assert (=> b!9201 (= res!9542 (bvsle (bitIndex!0 (size!246 (buf!582 (_1!616 lt!13085))) (currentByte!1621 (_1!616 lt!13085)) (currentBit!1616 (_1!616 lt!13085))) (bitIndex!0 (size!246 (buf!582 (_2!616 lt!13085))) (currentByte!1621 (_2!616 lt!13085)) (currentBit!1616 (_2!616 lt!13085)))))))

(declare-fun b!9202 () Bool)

(declare-fun e!5695 () Bool)

(assert (=> b!9202 (= e!5696 e!5695)))

(declare-fun res!9541 () Bool)

(assert (=> b!9202 (=> res!9541 e!5695)))

(assert (=> b!9202 (= res!9541 (= (size!246 (buf!582 (_1!616 lt!13085))) #b00000000000000000000000000000000))))

(declare-fun b!9203 () Bool)

(assert (=> b!9203 (= e!5695 (arrayBitRangesEq!0 (buf!582 (_1!616 lt!13085)) (buf!582 (_2!616 lt!13085)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 (_1!616 lt!13085))) (currentByte!1621 (_1!616 lt!13085)) (currentBit!1616 (_1!616 lt!13085)))))))

(assert (= (and d!2834 res!9540) b!9201))

(assert (= (and b!9201 res!9542) b!9202))

(assert (= (and b!9202 (not res!9541)) b!9203))

(assert (=> b!9201 m!12887))

(assert (=> b!9201 m!12909))

(assert (=> b!9203 m!12887))

(assert (=> b!9203 m!12887))

(declare-fun m!12943 () Bool)

(assert (=> b!9203 m!12943))

(assert (=> d!2584 d!2834))

(declare-fun d!2836 () Bool)

(assert (=> d!2836 (isPrefixOf!0 (_2!615 lt!12526) (_2!615 lt!12526))))

(declare-fun lt!13763 () Unit!746)

(assert (=> d!2836 (= lt!13763 (choose!11 (_2!615 lt!12526)))))

(assert (=> d!2836 (= (lemmaIsPrefixRefl!0 (_2!615 lt!12526)) lt!13763)))

(declare-fun bs!891 () Bool)

(assert (= bs!891 d!2836))

(assert (=> bs!891 m!12207))

(declare-fun m!12945 () Bool)

(assert (=> bs!891 m!12945))

(assert (=> d!2584 d!2836))

(declare-fun d!2838 () Bool)

(declare-fun res!9543 () Bool)

(declare-fun e!5698 () Bool)

(assert (=> d!2838 (=> (not res!9543) (not e!5698))))

(assert (=> d!2838 (= res!9543 (= (size!246 (buf!582 lt!13080)) (size!246 (buf!582 lt!13080))))))

(assert (=> d!2838 (= (isPrefixOf!0 lt!13080 lt!13080) e!5698)))

(declare-fun b!9204 () Bool)

(declare-fun res!9545 () Bool)

(assert (=> b!9204 (=> (not res!9545) (not e!5698))))

(assert (=> b!9204 (= res!9545 (bvsle (bitIndex!0 (size!246 (buf!582 lt!13080)) (currentByte!1621 lt!13080) (currentBit!1616 lt!13080)) (bitIndex!0 (size!246 (buf!582 lt!13080)) (currentByte!1621 lt!13080) (currentBit!1616 lt!13080))))))

(declare-fun b!9205 () Bool)

(declare-fun e!5697 () Bool)

(assert (=> b!9205 (= e!5698 e!5697)))

(declare-fun res!9544 () Bool)

(assert (=> b!9205 (=> res!9544 e!5697)))

(assert (=> b!9205 (= res!9544 (= (size!246 (buf!582 lt!13080)) #b00000000000000000000000000000000))))

(declare-fun b!9206 () Bool)

(assert (=> b!9206 (= e!5697 (arrayBitRangesEq!0 (buf!582 lt!13080) (buf!582 lt!13080) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 lt!13080)) (currentByte!1621 lt!13080) (currentBit!1616 lt!13080))))))

(assert (= (and d!2838 res!9543) b!9204))

(assert (= (and b!9204 res!9545) b!9205))

(assert (= (and b!9205 (not res!9544)) b!9206))

(assert (=> b!9204 m!12939))

(assert (=> b!9204 m!12939))

(assert (=> b!9206 m!12939))

(assert (=> b!9206 m!12939))

(declare-fun m!12947 () Bool)

(assert (=> b!9206 m!12947))

(assert (=> d!2584 d!2838))

(declare-fun d!2840 () Bool)

(declare-fun c!558 () Bool)

(assert (=> d!2840 (= c!558 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5699 () List!143)

(assert (=> d!2840 (= (byteArrayBitContentToList!0 (_2!617 lt!13160) (_1!617 lt!13160) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!5699)))

(declare-fun b!9207 () Bool)

(assert (=> b!9207 (= e!5699 Nil!140)))

(declare-fun b!9208 () Bool)

(assert (=> b!9208 (= e!5699 (Cons!139 (not (= (bvand ((_ sign_extend 24) (select (arr!651 (_1!617 lt!13160)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!617 lt!13160) (_1!617 lt!13160) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2840 c!558) b!9207))

(assert (= (and d!2840 (not c!558)) b!9208))

(declare-fun m!12949 () Bool)

(assert (=> b!9208 m!12949))

(assert (=> b!9208 m!12055))

(declare-fun m!12951 () Bool)

(assert (=> b!9208 m!12951))

(assert (=> b!8848 d!2840))

(declare-fun b!9212 () Bool)

(declare-fun e!5701 () Bool)

(declare-fun lt!13766 () List!143)

(assert (=> b!9212 (= e!5701 (> (length!21 lt!13766) 0))))

(declare-fun d!2842 () Bool)

(assert (=> d!2842 e!5701))

(declare-fun c!559 () Bool)

(assert (=> d!2842 (= c!559 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5700 () tuple2!1178)

(assert (=> d!2842 (= lt!13766 (_1!622 e!5700))))

(declare-fun c!560 () Bool)

(assert (=> d!2842 (= c!560 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2842 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2842 (= (bitStreamReadBitsIntoList!0 (_2!617 lt!13160) (_1!616 lt!12525) nBits!460) lt!13766)))

(declare-fun lt!13765 () (_ BitVec 64))

(declare-fun lt!13764 () tuple2!1180)

(declare-fun b!9210 () Bool)

(assert (=> b!9210 (= e!5700 (tuple2!1179 (Cons!139 (_1!623 lt!13764) (bitStreamReadBitsIntoList!0 (_2!617 lt!13160) (_2!623 lt!13764) (bvsub nBits!460 lt!13765))) (_2!623 lt!13764)))))

(assert (=> b!9210 (= lt!13764 (readBit!0 (_1!616 lt!12525)))))

(assert (=> b!9210 (= lt!13765 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9209 () Bool)

(assert (=> b!9209 (= e!5700 (tuple2!1179 Nil!140 (_1!616 lt!12525)))))

(declare-fun b!9211 () Bool)

(assert (=> b!9211 (= e!5701 (isEmpty!26 lt!13766))))

(assert (= (and d!2842 c!560) b!9209))

(assert (= (and d!2842 (not c!560)) b!9210))

(assert (= (and d!2842 c!559) b!9211))

(assert (= (and d!2842 (not c!559)) b!9212))

(declare-fun m!12953 () Bool)

(assert (=> b!9212 m!12953))

(declare-fun m!12955 () Bool)

(assert (=> b!9210 m!12955))

(assert (=> b!9210 m!12163))

(declare-fun m!12957 () Bool)

(assert (=> b!9211 m!12957))

(assert (=> b!8848 d!2842))

(declare-fun d!2844 () Bool)

(declare-fun e!5702 () Bool)

(assert (=> d!2844 e!5702))

(declare-fun res!9546 () Bool)

(assert (=> d!2844 (=> (not res!9546) (not e!5702))))

(declare-fun lt!13768 () (_ BitVec 64))

(declare-fun lt!13767 () (_ BitVec 64))

(declare-fun lt!13769 () (_ BitVec 64))

(assert (=> d!2844 (= res!9546 (= lt!13769 (bvsub lt!13768 lt!13767)))))

(assert (=> d!2844 (or (= (bvand lt!13768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13767 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13768 lt!13767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2844 (= lt!13767 (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12867)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12867))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12867)))))))

(declare-fun lt!13772 () (_ BitVec 64))

(declare-fun lt!13770 () (_ BitVec 64))

(assert (=> d!2844 (= lt!13768 (bvmul lt!13772 lt!13770))))

(assert (=> d!2844 (or (= lt!13772 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13770 (bvsdiv (bvmul lt!13772 lt!13770) lt!13772)))))

(assert (=> d!2844 (= lt!13770 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2844 (= lt!13772 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12867)))))))

(assert (=> d!2844 (= lt!13769 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12867))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12867)))))))

(assert (=> d!2844 (invariant!0 (currentBit!1616 (_2!615 lt!12867)) (currentByte!1621 (_2!615 lt!12867)) (size!246 (buf!582 (_2!615 lt!12867))))))

(assert (=> d!2844 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12867))) (currentByte!1621 (_2!615 lt!12867)) (currentBit!1616 (_2!615 lt!12867))) lt!13769)))

(declare-fun b!9213 () Bool)

(declare-fun res!9547 () Bool)

(assert (=> b!9213 (=> (not res!9547) (not e!5702))))

(assert (=> b!9213 (= res!9547 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13769))))

(declare-fun b!9214 () Bool)

(declare-fun lt!13771 () (_ BitVec 64))

(assert (=> b!9214 (= e!5702 (bvsle lt!13769 (bvmul lt!13771 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9214 (or (= lt!13771 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13771 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13771)))))

(assert (=> b!9214 (= lt!13771 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12867)))))))

(assert (= (and d!2844 res!9546) b!9213))

(assert (= (and b!9213 res!9547) b!9214))

(declare-fun m!12959 () Bool)

(assert (=> d!2844 m!12959))

(assert (=> d!2844 m!11909))

(assert (=> d!2558 d!2844))

(assert (=> d!2558 d!2614))

(assert (=> d!2558 d!2820))

(assert (=> d!2558 d!2826))

(declare-fun d!2846 () Bool)

(assert (=> d!2846 (= (invariant!0 (currentBit!1616 (_2!617 lt!13160)) (currentByte!1621 (_2!617 lt!13160)) (size!246 (buf!582 (_2!617 lt!13160)))) (and (bvsge (currentBit!1616 (_2!617 lt!13160)) #b00000000000000000000000000000000) (bvslt (currentBit!1616 (_2!617 lt!13160)) #b00000000000000000000000000001000) (bvsge (currentByte!1621 (_2!617 lt!13160)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1621 (_2!617 lt!13160)) (size!246 (buf!582 (_2!617 lt!13160)))) (and (= (currentBit!1616 (_2!617 lt!13160)) #b00000000000000000000000000000000) (= (currentByte!1621 (_2!617 lt!13160)) (size!246 (buf!582 (_2!617 lt!13160))))))))))

(assert (=> b!8846 d!2846))

(declare-fun b!9233 () Bool)

(declare-fun res!9563 () Bool)

(declare-fun e!5712 () Bool)

(assert (=> b!9233 (=> (not res!9563) (not e!5712))))

(declare-fun lt!13879 () tuple3!66)

(assert (=> b!9233 (= res!9563 (arrayBitRangesEq!0 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!33 lt!13879) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!9234 () Bool)

(declare-fun e!5713 () tuple3!66)

(declare-fun lt!13880 () Unit!746)

(declare-fun lt!13864 () tuple3!66)

(assert (=> b!9234 (= e!5713 (tuple3!67 lt!13880 (_2!626 lt!13864) (_3!33 lt!13864)))))

(declare-fun lt!13846 () tuple2!1180)

(assert (=> b!9234 (= lt!13846 (readBit!0 (_1!616 lt!12525)))))

(declare-fun lt!13851 () (_ BitVec 32))

(assert (=> b!9234 (= lt!13851 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13861 () (_ BitVec 32))

(assert (=> b!9234 (= lt!13861 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13877 () array!574)

(assert (=> b!9234 (= lt!13877 (array!575 (store (arr!651 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!13851 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!651 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!13851)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!13861)))) ((_ sign_extend 24) (ite (_1!623 lt!13846) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!13861) #b00000000))))) (size!246 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!13848 () (_ BitVec 64))

(assert (=> b!9234 (= lt!13848 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!13869 () (_ BitVec 64))

(assert (=> b!9234 (= lt!13869 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13847 () Unit!746)

(assert (=> b!9234 (= lt!13847 (validateOffsetBitsIneqLemma!0 (_1!616 lt!12525) (_2!623 lt!13846) lt!13848 lt!13869))))

(assert (=> b!9234 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!623 lt!13846)))) ((_ sign_extend 32) (currentByte!1621 (_2!623 lt!13846))) ((_ sign_extend 32) (currentBit!1616 (_2!623 lt!13846))) (bvsub lt!13848 lt!13869))))

(declare-fun lt!13860 () Unit!746)

(assert (=> b!9234 (= lt!13860 lt!13847)))

(assert (=> b!9234 (= lt!13864 (readBitsLoop!0 (_2!623 lt!13846) nBits!460 lt!13877 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!460))))

(declare-fun res!9564 () Bool)

(assert (=> b!9234 (= res!9564 (= (bvsub (bvadd (bitIndex!0 (size!246 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)) (currentBit!1616 (_1!616 lt!12525))) nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!246 (buf!582 (_2!626 lt!13864))) (currentByte!1621 (_2!626 lt!13864)) (currentBit!1616 (_2!626 lt!13864)))))))

(declare-fun e!5714 () Bool)

(assert (=> b!9234 (=> (not res!9564) (not e!5714))))

(assert (=> b!9234 e!5714))

(declare-fun lt!13863 () Unit!746)

(declare-fun Unit!787 () Unit!746)

(assert (=> b!9234 (= lt!13863 Unit!787)))

(declare-fun lt!13872 () (_ BitVec 32))

(assert (=> b!9234 (= lt!13872 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13865 () (_ BitVec 32))

(assert (=> b!9234 (= lt!13865 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13870 () Unit!746)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!574 (_ BitVec 64) Bool) Unit!746)

(assert (=> b!9234 (= lt!13870 (arrayBitRangesUpdatedAtLemma!0 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!623 lt!13846)))))

(assert (=> b!9234 (arrayBitRangesEq!0 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!575 (store (arr!651 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!13872 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!651 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!13872)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!13865)))) ((_ sign_extend 24) (ite (_1!623 lt!13846) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!13865) #b00000000))))) (size!246 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13853 () Unit!746)

(assert (=> b!9234 (= lt!13853 lt!13870)))

(declare-fun lt!13845 () (_ BitVec 64))

(assert (=> b!9234 (= lt!13845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13873 () Unit!746)

(declare-fun arrayBitRangesEqTransitive!0 (array!574 array!574 array!574 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!746)

(assert (=> b!9234 (= lt!13873 (arrayBitRangesEqTransitive!0 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!13877 (_3!33 lt!13864) lt!13845 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!158 () Bool)

(assert (=> b!9234 call!158))

(declare-fun lt!13871 () Unit!746)

(assert (=> b!9234 (= lt!13871 lt!13873)))

(declare-fun call!157 () Bool)

(assert (=> b!9234 call!157))

(declare-fun lt!13849 () Unit!746)

(declare-fun Unit!788 () Unit!746)

(assert (=> b!9234 (= lt!13849 Unit!788)))

(declare-fun lt!13857 () Unit!746)

(assert (=> b!9234 (= lt!13857 (arrayBitRangesEqImpliesEq!0 lt!13877 (_3!33 lt!13864) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!9234 (= (bitAt!0 lt!13877 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!33 lt!13864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!13867 () Unit!746)

(assert (=> b!9234 (= lt!13867 lt!13857)))

(declare-fun lt!13875 () Unit!746)

(declare-fun Unit!789 () Unit!746)

(assert (=> b!9234 (= lt!13875 Unit!789)))

(declare-fun lt!13859 () Bool)

(assert (=> b!9234 (= lt!13859 (= (bitAt!0 (_3!33 lt!13864) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!623 lt!13846)))))

(declare-fun Unit!790 () Unit!746)

(assert (=> b!9234 (= lt!13880 Unit!790)))

(assert (=> b!9234 lt!13859))

(declare-fun c!563 () Bool)

(declare-fun bm!154 () Bool)

(assert (=> bm!154 (= call!158 (arrayBitRangesEq!0 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!563 (_3!33 lt!13864) (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (ite c!563 lt!13845 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!563 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!246 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!9235 () Bool)

(assert (=> b!9235 (= e!5712 (= (byteArrayBitContentToList!0 (_2!626 lt!13879) (_3!33 lt!13879) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!626 lt!13879) (_1!616 lt!12525) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9235 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9235 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!9236 () Bool)

(assert (=> b!9236 (= e!5714 (and (= (buf!582 (_1!616 lt!12525)) (buf!582 (_2!626 lt!13864))) (= (size!246 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!246 (_3!33 lt!13864)))))))

(declare-fun lt!13862 () array!574)

(declare-fun lt!13868 () (_ BitVec 64))

(declare-fun lt!13858 () (_ BitVec 64))

(declare-fun lt!13854 () array!574)

(declare-fun bm!155 () Bool)

(assert (=> bm!155 (= call!157 (arrayBitRangesEq!0 (ite c!563 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!13862) (ite c!563 (_3!33 lt!13864) lt!13854) (ite c!563 #b0000000000000000000000000000000000000000000000000000000000000000 lt!13868) (ite c!563 #b0000000000000000000000000000000000000000000000000000000000000000 lt!13858)))))

(declare-fun b!9237 () Bool)

(declare-fun res!9565 () Bool)

(assert (=> b!9237 (=> (not res!9565) (not e!5712))))

(assert (=> b!9237 (= res!9565 (and (= (buf!582 (_1!616 lt!12525)) (buf!582 (_2!626 lt!13879))) (= (size!246 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!246 (_3!33 lt!13879)))))))

(declare-fun b!9238 () Bool)

(declare-fun res!9566 () Bool)

(assert (=> b!9238 (=> (not res!9566) (not e!5712))))

(declare-fun e!5711 () Bool)

(assert (=> b!9238 (= res!9566 e!5711)))

(declare-fun res!9562 () Bool)

(assert (=> b!9238 (=> res!9562 e!5711)))

(assert (=> b!9238 (= res!9562 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun b!9239 () Bool)

(declare-fun res!9568 () Bool)

(assert (=> b!9239 (=> (not res!9568) (not e!5712))))

(assert (=> b!9239 (= res!9568 (invariant!0 (currentBit!1616 (_2!626 lt!13879)) (currentByte!1621 (_2!626 lt!13879)) (size!246 (buf!582 (_2!626 lt!13879)))))))

(declare-fun b!9241 () Bool)

(declare-fun lt!13866 () Unit!746)

(assert (=> b!9241 (= e!5713 (tuple3!67 lt!13866 (_1!616 lt!12525) (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!13856 () Unit!746)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!574) Unit!746)

(assert (=> b!9241 (= lt!13856 (arrayBitRangesEqReflexiveLemma!0 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!9241 call!158))

(declare-fun lt!13855 () Unit!746)

(assert (=> b!9241 (= lt!13855 lt!13856)))

(assert (=> b!9241 (= lt!13862 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!9241 (= lt!13854 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!13878 () (_ BitVec 64))

(assert (=> b!9241 (= lt!13878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13876 () (_ BitVec 64))

(assert (=> b!9241 (= lt!13876 ((_ sign_extend 32) (size!246 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!13852 () (_ BitVec 64))

(assert (=> b!9241 (= lt!13852 (bvmul lt!13876 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!9241 (= lt!13868 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!9241 (= lt!13858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!574 array!574 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!746)

(assert (=> b!9241 (= lt!13866 (arrayBitRangesEqSlicedLemma!0 lt!13862 lt!13854 lt!13878 lt!13852 lt!13868 lt!13858))))

(assert (=> b!9241 call!157))

(declare-fun d!2848 () Bool)

(assert (=> d!2848 e!5712))

(declare-fun res!9567 () Bool)

(assert (=> d!2848 (=> (not res!9567) (not e!5712))))

(declare-fun lt!13874 () (_ BitVec 64))

(assert (=> d!2848 (= res!9567 (= (bvsub lt!13874 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!246 (buf!582 (_2!626 lt!13879))) (currentByte!1621 (_2!626 lt!13879)) (currentBit!1616 (_2!626 lt!13879)))))))

(assert (=> d!2848 (or (= (bvand lt!13874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13874 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!13850 () (_ BitVec 64))

(assert (=> d!2848 (= lt!13874 (bvadd lt!13850 nBits!460))))

(assert (=> d!2848 (or (not (= (bvand lt!13850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13850 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2848 (= lt!13850 (bitIndex!0 (size!246 (buf!582 (_1!616 lt!12525))) (currentByte!1621 (_1!616 lt!12525)) (currentBit!1616 (_1!616 lt!12525))))))

(assert (=> d!2848 (= lt!13879 e!5713)))

(assert (=> d!2848 (= c!563 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2848 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2848 (= (readBitsLoop!0 (_1!616 lt!12525) nBits!460 (array!575 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!13879)))

(declare-fun b!9240 () Bool)

(declare-datatypes ((tuple2!1188 0))(
  ( (tuple2!1189 (_1!630 BitStream!470) (_2!630 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!470) tuple2!1188)

(assert (=> b!9240 (= e!5711 (= (bitAt!0 (_3!33 lt!13879) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!630 (readBitPure!0 (_1!616 lt!12525)))))))

(assert (= (and d!2848 c!563) b!9234))

(assert (= (and d!2848 (not c!563)) b!9241))

(assert (= (and b!9234 res!9564) b!9236))

(assert (= (or b!9234 b!9241) bm!155))

(assert (= (or b!9234 b!9241) bm!154))

(assert (= (and d!2848 res!9567) b!9237))

(assert (= (and b!9237 res!9565) b!9233))

(assert (= (and b!9233 res!9563) b!9238))

(assert (= (and b!9238 (not res!9562)) b!9240))

(assert (= (and b!9238 res!9566) b!9239))

(assert (= (and b!9239 res!9568) b!9235))

(declare-fun m!12961 () Bool)

(assert (=> b!9241 m!12961))

(declare-fun m!12963 () Bool)

(assert (=> b!9241 m!12963))

(declare-fun m!12965 () Bool)

(assert (=> b!9240 m!12965))

(declare-fun m!12967 () Bool)

(assert (=> b!9240 m!12967))

(declare-fun m!12969 () Bool)

(assert (=> b!9233 m!12969))

(declare-fun m!12971 () Bool)

(assert (=> b!9234 m!12971))

(declare-fun m!12973 () Bool)

(assert (=> b!9234 m!12973))

(declare-fun m!12975 () Bool)

(assert (=> b!9234 m!12975))

(declare-fun m!12977 () Bool)

(assert (=> b!9234 m!12977))

(declare-fun m!12979 () Bool)

(assert (=> b!9234 m!12979))

(declare-fun m!12981 () Bool)

(assert (=> b!9234 m!12981))

(declare-fun m!12983 () Bool)

(assert (=> b!9234 m!12983))

(declare-fun m!12985 () Bool)

(assert (=> b!9234 m!12985))

(declare-fun m!12987 () Bool)

(assert (=> b!9234 m!12987))

(declare-fun m!12989 () Bool)

(assert (=> b!9234 m!12989))

(declare-fun m!12991 () Bool)

(assert (=> b!9234 m!12991))

(declare-fun m!12993 () Bool)

(assert (=> b!9234 m!12993))

(declare-fun m!12995 () Bool)

(assert (=> b!9234 m!12995))

(declare-fun m!12997 () Bool)

(assert (=> b!9234 m!12997))

(declare-fun m!12999 () Bool)

(assert (=> b!9234 m!12999))

(assert (=> b!9234 m!12163))

(assert (=> b!9234 m!12249))

(declare-fun m!13001 () Bool)

(assert (=> b!9234 m!13001))

(declare-fun m!13003 () Bool)

(assert (=> d!2848 m!13003))

(assert (=> d!2848 m!12249))

(declare-fun m!13005 () Bool)

(assert (=> b!9235 m!13005))

(declare-fun m!13007 () Bool)

(assert (=> b!9235 m!13007))

(declare-fun m!13009 () Bool)

(assert (=> b!9239 m!13009))

(declare-fun m!13011 () Bool)

(assert (=> bm!155 m!13011))

(declare-fun m!13013 () Bool)

(assert (=> bm!154 m!13013))

(assert (=> d!2590 d!2848))

(declare-fun d!2850 () Bool)

(assert (=> d!2850 (= (invariant!0 (currentBit!1616 thiss!1486) (currentByte!1621 thiss!1486) (size!246 (buf!582 thiss!1486))) (and (bvsge (currentBit!1616 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1616 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1621 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1621 thiss!1486) (size!246 (buf!582 thiss!1486))) (and (= (currentBit!1616 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1621 thiss!1486) (size!246 (buf!582 thiss!1486)))))))))

(assert (=> d!2624 d!2850))

(declare-fun d!2852 () Bool)

(declare-fun res!9569 () Bool)

(declare-fun e!5716 () Bool)

(assert (=> d!2852 (=> (not res!9569) (not e!5716))))

(assert (=> d!2852 (= res!9569 (= (size!246 (buf!582 thiss!1486)) (size!246 (buf!582 (_2!615 lt!12867)))))))

(assert (=> d!2852 (= (isPrefixOf!0 thiss!1486 (_2!615 lt!12867)) e!5716)))

(declare-fun b!9242 () Bool)

(declare-fun res!9571 () Bool)

(assert (=> b!9242 (=> (not res!9571) (not e!5716))))

(assert (=> b!9242 (= res!9571 (bvsle (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)) (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12867))) (currentByte!1621 (_2!615 lt!12867)) (currentBit!1616 (_2!615 lt!12867)))))))

(declare-fun b!9243 () Bool)

(declare-fun e!5715 () Bool)

(assert (=> b!9243 (= e!5716 e!5715)))

(declare-fun res!9570 () Bool)

(assert (=> b!9243 (=> res!9570 e!5715)))

(assert (=> b!9243 (= res!9570 (= (size!246 (buf!582 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9244 () Bool)

(assert (=> b!9244 (= e!5715 (arrayBitRangesEq!0 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12867)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(assert (= (and d!2852 res!9569) b!9242))

(assert (= (and b!9242 res!9571) b!9243))

(assert (= (and b!9243 (not res!9570)) b!9244))

(assert (=> b!9242 m!11863))

(assert (=> b!9242 m!12043))

(assert (=> b!9244 m!11863))

(assert (=> b!9244 m!11863))

(declare-fun m!13015 () Bool)

(assert (=> b!9244 m!13015))

(assert (=> b!8728 d!2852))

(declare-fun b!9245 () Bool)

(declare-fun e!5717 () Unit!746)

(declare-fun Unit!791 () Unit!746)

(assert (=> b!9245 (= e!5717 Unit!791)))

(declare-fun e!5718 () Bool)

(declare-fun lt!13890 () (_ BitVec 64))

(declare-fun b!9246 () Bool)

(declare-fun lt!13900 () tuple2!1170)

(declare-fun lt!13889 () (_ BitVec 64))

(assert (=> b!9246 (= e!5718 (= (_1!616 lt!13900) (withMovedBitIndex!0 (_2!616 lt!13900) (bvsub lt!13889 lt!13890))))))

(assert (=> b!9246 (or (= (bvand lt!13889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13890 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13889 lt!13890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9246 (= lt!13890 (bitIndex!0 (size!246 (buf!582 (ite c!481 (_2!615 lt!12840) thiss!1486))) (currentByte!1621 (ite c!481 (_2!615 lt!12840) thiss!1486)) (currentBit!1616 (ite c!481 (_2!615 lt!12840) thiss!1486))))))

(assert (=> b!9246 (= lt!13889 (bitIndex!0 (size!246 (buf!582 (ite c!481 (_2!615 lt!12862) thiss!1486))) (currentByte!1621 (ite c!481 (_2!615 lt!12862) thiss!1486)) (currentBit!1616 (ite c!481 (_2!615 lt!12862) thiss!1486))))))

(declare-fun b!9247 () Bool)

(declare-fun lt!13893 () Unit!746)

(assert (=> b!9247 (= e!5717 lt!13893)))

(declare-fun lt!13892 () (_ BitVec 64))

(assert (=> b!9247 (= lt!13892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13896 () (_ BitVec 64))

(assert (=> b!9247 (= lt!13896 (bitIndex!0 (size!246 (buf!582 (ite c!481 (_2!615 lt!12862) thiss!1486))) (currentByte!1621 (ite c!481 (_2!615 lt!12862) thiss!1486)) (currentBit!1616 (ite c!481 (_2!615 lt!12862) thiss!1486))))))

(assert (=> b!9247 (= lt!13893 (arrayBitRangesEqSymmetric!0 (buf!582 (ite c!481 (_2!615 lt!12862) thiss!1486)) (buf!582 (ite c!481 (_2!615 lt!12840) thiss!1486)) lt!13892 lt!13896))))

(assert (=> b!9247 (arrayBitRangesEq!0 (buf!582 (ite c!481 (_2!615 lt!12840) thiss!1486)) (buf!582 (ite c!481 (_2!615 lt!12862) thiss!1486)) lt!13892 lt!13896)))

(declare-fun b!9248 () Bool)

(declare-fun res!9572 () Bool)

(assert (=> b!9248 (=> (not res!9572) (not e!5718))))

(assert (=> b!9248 (= res!9572 (isPrefixOf!0 (_2!616 lt!13900) (ite c!481 (_2!615 lt!12840) thiss!1486)))))

(declare-fun b!9249 () Bool)

(declare-fun res!9573 () Bool)

(assert (=> b!9249 (=> (not res!9573) (not e!5718))))

(assert (=> b!9249 (= res!9573 (isPrefixOf!0 (_1!616 lt!13900) (ite c!481 (_2!615 lt!12862) thiss!1486)))))

(declare-fun d!2854 () Bool)

(assert (=> d!2854 e!5718))

(declare-fun res!9574 () Bool)

(assert (=> d!2854 (=> (not res!9574) (not e!5718))))

(assert (=> d!2854 (= res!9574 (isPrefixOf!0 (_1!616 lt!13900) (_2!616 lt!13900)))))

(declare-fun lt!13895 () BitStream!470)

(assert (=> d!2854 (= lt!13900 (tuple2!1171 lt!13895 (ite c!481 (_2!615 lt!12840) thiss!1486)))))

(declare-fun lt!13894 () Unit!746)

(declare-fun lt!13887 () Unit!746)

(assert (=> d!2854 (= lt!13894 lt!13887)))

(assert (=> d!2854 (isPrefixOf!0 lt!13895 (ite c!481 (_2!615 lt!12840) thiss!1486))))

(assert (=> d!2854 (= lt!13887 (lemmaIsPrefixTransitive!0 lt!13895 (ite c!481 (_2!615 lt!12840) thiss!1486) (ite c!481 (_2!615 lt!12840) thiss!1486)))))

(declare-fun lt!13899 () Unit!746)

(declare-fun lt!13883 () Unit!746)

(assert (=> d!2854 (= lt!13899 lt!13883)))

(assert (=> d!2854 (isPrefixOf!0 lt!13895 (ite c!481 (_2!615 lt!12840) thiss!1486))))

(assert (=> d!2854 (= lt!13883 (lemmaIsPrefixTransitive!0 lt!13895 (ite c!481 (_2!615 lt!12862) thiss!1486) (ite c!481 (_2!615 lt!12840) thiss!1486)))))

(declare-fun lt!13881 () Unit!746)

(assert (=> d!2854 (= lt!13881 e!5717)))

(declare-fun c!564 () Bool)

(assert (=> d!2854 (= c!564 (not (= (size!246 (buf!582 (ite c!481 (_2!615 lt!12862) thiss!1486))) #b00000000000000000000000000000000)))))

(declare-fun lt!13884 () Unit!746)

(declare-fun lt!13885 () Unit!746)

(assert (=> d!2854 (= lt!13884 lt!13885)))

(assert (=> d!2854 (isPrefixOf!0 (ite c!481 (_2!615 lt!12840) thiss!1486) (ite c!481 (_2!615 lt!12840) thiss!1486))))

(assert (=> d!2854 (= lt!13885 (lemmaIsPrefixRefl!0 (ite c!481 (_2!615 lt!12840) thiss!1486)))))

(declare-fun lt!13886 () Unit!746)

(declare-fun lt!13888 () Unit!746)

(assert (=> d!2854 (= lt!13886 lt!13888)))

(assert (=> d!2854 (= lt!13888 (lemmaIsPrefixRefl!0 (ite c!481 (_2!615 lt!12840) thiss!1486)))))

(declare-fun lt!13898 () Unit!746)

(declare-fun lt!13882 () Unit!746)

(assert (=> d!2854 (= lt!13898 lt!13882)))

(assert (=> d!2854 (isPrefixOf!0 lt!13895 lt!13895)))

(assert (=> d!2854 (= lt!13882 (lemmaIsPrefixRefl!0 lt!13895))))

(declare-fun lt!13897 () Unit!746)

(declare-fun lt!13891 () Unit!746)

(assert (=> d!2854 (= lt!13897 lt!13891)))

(assert (=> d!2854 (isPrefixOf!0 (ite c!481 (_2!615 lt!12862) thiss!1486) (ite c!481 (_2!615 lt!12862) thiss!1486))))

(assert (=> d!2854 (= lt!13891 (lemmaIsPrefixRefl!0 (ite c!481 (_2!615 lt!12862) thiss!1486)))))

(assert (=> d!2854 (= lt!13895 (BitStream!471 (buf!582 (ite c!481 (_2!615 lt!12840) thiss!1486)) (currentByte!1621 (ite c!481 (_2!615 lt!12862) thiss!1486)) (currentBit!1616 (ite c!481 (_2!615 lt!12862) thiss!1486))))))

(assert (=> d!2854 (isPrefixOf!0 (ite c!481 (_2!615 lt!12862) thiss!1486) (ite c!481 (_2!615 lt!12840) thiss!1486))))

(assert (=> d!2854 (= (reader!0 (ite c!481 (_2!615 lt!12862) thiss!1486) (ite c!481 (_2!615 lt!12840) thiss!1486)) lt!13900)))

(assert (= (and d!2854 c!564) b!9247))

(assert (= (and d!2854 (not c!564)) b!9245))

(assert (= (and d!2854 res!9574) b!9249))

(assert (= (and b!9249 res!9573) b!9248))

(assert (= (and b!9248 res!9572) b!9246))

(declare-fun m!13017 () Bool)

(assert (=> b!9246 m!13017))

(declare-fun m!13019 () Bool)

(assert (=> b!9246 m!13019))

(declare-fun m!13021 () Bool)

(assert (=> b!9246 m!13021))

(declare-fun m!13023 () Bool)

(assert (=> d!2854 m!13023))

(declare-fun m!13025 () Bool)

(assert (=> d!2854 m!13025))

(declare-fun m!13027 () Bool)

(assert (=> d!2854 m!13027))

(declare-fun m!13029 () Bool)

(assert (=> d!2854 m!13029))

(declare-fun m!13031 () Bool)

(assert (=> d!2854 m!13031))

(declare-fun m!13033 () Bool)

(assert (=> d!2854 m!13033))

(declare-fun m!13035 () Bool)

(assert (=> d!2854 m!13035))

(declare-fun m!13037 () Bool)

(assert (=> d!2854 m!13037))

(declare-fun m!13039 () Bool)

(assert (=> d!2854 m!13039))

(declare-fun m!13041 () Bool)

(assert (=> d!2854 m!13041))

(declare-fun m!13043 () Bool)

(assert (=> d!2854 m!13043))

(declare-fun m!13045 () Bool)

(assert (=> b!9249 m!13045))

(assert (=> b!9247 m!13021))

(declare-fun m!13047 () Bool)

(assert (=> b!9247 m!13047))

(declare-fun m!13049 () Bool)

(assert (=> b!9247 m!13049))

(declare-fun m!13051 () Bool)

(assert (=> b!9248 m!13051))

(assert (=> bm!133 d!2854))

(declare-fun b!9253 () Bool)

(declare-fun e!5720 () Bool)

(declare-fun lt!13903 () List!143)

(assert (=> b!9253 (= e!5720 (> (length!21 lt!13903) 0))))

(declare-fun d!2856 () Bool)

(assert (=> d!2856 e!5720))

(declare-fun c!565 () Bool)

(assert (=> d!2856 (= c!565 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5719 () tuple2!1178)

(assert (=> d!2856 (= lt!13903 (_1!622 e!5719))))

(declare-fun c!566 () Bool)

(assert (=> d!2856 (= c!566 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2856 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2856 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12867) (_1!616 lt!12841) (bvsub (bvadd from!367 nBits!460) from!367)) lt!13903)))

(declare-fun b!9251 () Bool)

(declare-fun lt!13901 () tuple2!1180)

(declare-fun lt!13902 () (_ BitVec 64))

(assert (=> b!9251 (= e!5719 (tuple2!1179 (Cons!139 (_1!623 lt!13901) (bitStreamReadBitsIntoList!0 (_2!615 lt!12867) (_2!623 lt!13901) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!13902))) (_2!623 lt!13901)))))

(assert (=> b!9251 (= lt!13901 (readBit!0 (_1!616 lt!12841)))))

(assert (=> b!9251 (= lt!13902 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9250 () Bool)

(assert (=> b!9250 (= e!5719 (tuple2!1179 Nil!140 (_1!616 lt!12841)))))

(declare-fun b!9252 () Bool)

(assert (=> b!9252 (= e!5720 (isEmpty!26 lt!13903))))

(assert (= (and d!2856 c!566) b!9250))

(assert (= (and d!2856 (not c!566)) b!9251))

(assert (= (and d!2856 c!565) b!9252))

(assert (= (and d!2856 (not c!565)) b!9253))

(declare-fun m!13053 () Bool)

(assert (=> b!9253 m!13053))

(declare-fun m!13055 () Bool)

(assert (=> b!9251 m!13055))

(declare-fun m!13057 () Bool)

(assert (=> b!9251 m!13057))

(declare-fun m!13059 () Bool)

(assert (=> b!9252 m!13059))

(assert (=> b!8726 d!2856))

(declare-fun d!2858 () Bool)

(assert (=> d!2858 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12867)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12839) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12867)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486))) lt!12839))))

(declare-fun bs!892 () Bool)

(assert (= bs!892 d!2858))

(declare-fun m!13061 () Bool)

(assert (=> bs!892 m!13061))

(assert (=> b!8726 d!2858))

(declare-fun d!2860 () Bool)

(declare-fun c!567 () Bool)

(assert (=> d!2860 (= c!567 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5721 () List!143)

(assert (=> d!2860 (= (byteArrayBitContentToList!0 (_2!615 lt!12867) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!5721)))

(declare-fun b!9254 () Bool)

(assert (=> b!9254 (= e!5721 Nil!140)))

(declare-fun b!9255 () Bool)

(assert (=> b!9255 (= e!5721 (Cons!139 (not (= (bvand ((_ sign_extend 24) (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!615 lt!12867) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2860 c!567) b!9254))

(assert (= (and d!2860 (not c!567)) b!9255))

(assert (=> b!9255 m!12027))

(assert (=> b!9255 m!12833))

(declare-fun m!13063 () Bool)

(assert (=> b!9255 m!13063))

(assert (=> b!8726 d!2860))

(declare-fun b!9256 () Bool)

(declare-fun e!5722 () Unit!746)

(declare-fun Unit!792 () Unit!746)

(assert (=> b!9256 (= e!5722 Unit!792)))

(declare-fun e!5723 () Bool)

(declare-fun lt!13913 () (_ BitVec 64))

(declare-fun b!9257 () Bool)

(declare-fun lt!13923 () tuple2!1170)

(declare-fun lt!13912 () (_ BitVec 64))

(assert (=> b!9257 (= e!5723 (= (_1!616 lt!13923) (withMovedBitIndex!0 (_2!616 lt!13923) (bvsub lt!13912 lt!13913))))))

(assert (=> b!9257 (or (= (bvand lt!13912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13912 lt!13913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9257 (= lt!13913 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12867))) (currentByte!1621 (_2!615 lt!12867)) (currentBit!1616 (_2!615 lt!12867))))))

(assert (=> b!9257 (= lt!13912 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(declare-fun b!9258 () Bool)

(declare-fun lt!13916 () Unit!746)

(assert (=> b!9258 (= e!5722 lt!13916)))

(declare-fun lt!13915 () (_ BitVec 64))

(assert (=> b!9258 (= lt!13915 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13919 () (_ BitVec 64))

(assert (=> b!9258 (= lt!13919 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(assert (=> b!9258 (= lt!13916 (arrayBitRangesEqSymmetric!0 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12867)) lt!13915 lt!13919))))

(assert (=> b!9258 (arrayBitRangesEq!0 (buf!582 (_2!615 lt!12867)) (buf!582 thiss!1486) lt!13915 lt!13919)))

(declare-fun b!9259 () Bool)

(declare-fun res!9575 () Bool)

(assert (=> b!9259 (=> (not res!9575) (not e!5723))))

(assert (=> b!9259 (= res!9575 (isPrefixOf!0 (_2!616 lt!13923) (_2!615 lt!12867)))))

(declare-fun b!9260 () Bool)

(declare-fun res!9576 () Bool)

(assert (=> b!9260 (=> (not res!9576) (not e!5723))))

(assert (=> b!9260 (= res!9576 (isPrefixOf!0 (_1!616 lt!13923) thiss!1486))))

(declare-fun d!2862 () Bool)

(assert (=> d!2862 e!5723))

(declare-fun res!9577 () Bool)

(assert (=> d!2862 (=> (not res!9577) (not e!5723))))

(assert (=> d!2862 (= res!9577 (isPrefixOf!0 (_1!616 lt!13923) (_2!616 lt!13923)))))

(declare-fun lt!13918 () BitStream!470)

(assert (=> d!2862 (= lt!13923 (tuple2!1171 lt!13918 (_2!615 lt!12867)))))

(declare-fun lt!13917 () Unit!746)

(declare-fun lt!13910 () Unit!746)

(assert (=> d!2862 (= lt!13917 lt!13910)))

(assert (=> d!2862 (isPrefixOf!0 lt!13918 (_2!615 lt!12867))))

(assert (=> d!2862 (= lt!13910 (lemmaIsPrefixTransitive!0 lt!13918 (_2!615 lt!12867) (_2!615 lt!12867)))))

(declare-fun lt!13922 () Unit!746)

(declare-fun lt!13906 () Unit!746)

(assert (=> d!2862 (= lt!13922 lt!13906)))

(assert (=> d!2862 (isPrefixOf!0 lt!13918 (_2!615 lt!12867))))

(assert (=> d!2862 (= lt!13906 (lemmaIsPrefixTransitive!0 lt!13918 thiss!1486 (_2!615 lt!12867)))))

(declare-fun lt!13904 () Unit!746)

(assert (=> d!2862 (= lt!13904 e!5722)))

(declare-fun c!568 () Bool)

(assert (=> d!2862 (= c!568 (not (= (size!246 (buf!582 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!13907 () Unit!746)

(declare-fun lt!13908 () Unit!746)

(assert (=> d!2862 (= lt!13907 lt!13908)))

(assert (=> d!2862 (isPrefixOf!0 (_2!615 lt!12867) (_2!615 lt!12867))))

(assert (=> d!2862 (= lt!13908 (lemmaIsPrefixRefl!0 (_2!615 lt!12867)))))

(declare-fun lt!13909 () Unit!746)

(declare-fun lt!13911 () Unit!746)

(assert (=> d!2862 (= lt!13909 lt!13911)))

(assert (=> d!2862 (= lt!13911 (lemmaIsPrefixRefl!0 (_2!615 lt!12867)))))

(declare-fun lt!13921 () Unit!746)

(declare-fun lt!13905 () Unit!746)

(assert (=> d!2862 (= lt!13921 lt!13905)))

(assert (=> d!2862 (isPrefixOf!0 lt!13918 lt!13918)))

(assert (=> d!2862 (= lt!13905 (lemmaIsPrefixRefl!0 lt!13918))))

(declare-fun lt!13920 () Unit!746)

(declare-fun lt!13914 () Unit!746)

(assert (=> d!2862 (= lt!13920 lt!13914)))

(assert (=> d!2862 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2862 (= lt!13914 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2862 (= lt!13918 (BitStream!471 (buf!582 (_2!615 lt!12867)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(assert (=> d!2862 (isPrefixOf!0 thiss!1486 (_2!615 lt!12867))))

(assert (=> d!2862 (= (reader!0 thiss!1486 (_2!615 lt!12867)) lt!13923)))

(assert (= (and d!2862 c!568) b!9258))

(assert (= (and d!2862 (not c!568)) b!9256))

(assert (= (and d!2862 res!9577) b!9260))

(assert (= (and b!9260 res!9576) b!9259))

(assert (= (and b!9259 res!9575) b!9257))

(declare-fun m!13065 () Bool)

(assert (=> b!9257 m!13065))

(assert (=> b!9257 m!12043))

(assert (=> b!9257 m!11863))

(assert (=> d!2862 m!11905))

(declare-fun m!13067 () Bool)

(assert (=> d!2862 m!13067))

(assert (=> d!2862 m!12045))

(declare-fun m!13069 () Bool)

(assert (=> d!2862 m!13069))

(declare-fun m!13071 () Bool)

(assert (=> d!2862 m!13071))

(declare-fun m!13073 () Bool)

(assert (=> d!2862 m!13073))

(assert (=> d!2862 m!12047))

(declare-fun m!13075 () Bool)

(assert (=> d!2862 m!13075))

(declare-fun m!13077 () Bool)

(assert (=> d!2862 m!13077))

(declare-fun m!13079 () Bool)

(assert (=> d!2862 m!13079))

(declare-fun m!13081 () Bool)

(assert (=> d!2862 m!13081))

(declare-fun m!13083 () Bool)

(assert (=> b!9260 m!13083))

(assert (=> b!9258 m!11863))

(declare-fun m!13085 () Bool)

(assert (=> b!9258 m!13085))

(declare-fun m!13087 () Bool)

(assert (=> b!9258 m!13087))

(declare-fun m!13089 () Bool)

(assert (=> b!9259 m!13089))

(assert (=> b!8726 d!2862))

(declare-fun d!2864 () Bool)

(assert (=> d!2864 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12867)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12839)))

(declare-fun lt!13924 () Unit!746)

(assert (=> d!2864 (= lt!13924 (choose!9 thiss!1486 (buf!582 (_2!615 lt!12867)) lt!12839 (BitStream!471 (buf!582 (_2!615 lt!12867)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(assert (=> d!2864 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!582 (_2!615 lt!12867)) lt!12839) lt!13924)))

(declare-fun bs!893 () Bool)

(assert (= bs!893 d!2864))

(assert (=> bs!893 m!11919))

(declare-fun m!13091 () Bool)

(assert (=> bs!893 m!13091))

(assert (=> b!8726 d!2864))

(assert (=> d!2614 d!2792))

(assert (=> d!2614 d!2850))

(assert (=> d!2600 d!2604))

(declare-fun d!2866 () Bool)

(assert (=> d!2866 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12526)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) nBits!460)))

(assert (=> d!2866 true))

(declare-fun _$6!162 () Unit!746)

(assert (=> d!2866 (= (choose!9 thiss!1486 (buf!582 (_2!615 lt!12526)) nBits!460 (BitStream!471 (buf!582 (_2!615 lt!12526)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))) _$6!162)))

(declare-fun bs!894 () Bool)

(assert (= bs!894 d!2866))

(assert (=> bs!894 m!11851))

(assert (=> d!2600 d!2866))

(declare-fun d!2868 () Bool)

(assert (=> d!2868 (= (tail!56 lt!12861) (t!893 lt!12861))))

(assert (=> b!8725 d!2868))

(declare-fun d!2870 () Bool)

(declare-fun res!9578 () Bool)

(declare-fun e!5725 () Bool)

(assert (=> d!2870 (=> (not res!9578) (not e!5725))))

(assert (=> d!2870 (= res!9578 (= (size!246 (buf!582 thiss!1486)) (size!246 (buf!582 (_2!615 lt!12840)))))))

(assert (=> d!2870 (= (isPrefixOf!0 thiss!1486 (_2!615 lt!12840)) e!5725)))

(declare-fun b!9261 () Bool)

(declare-fun res!9580 () Bool)

(assert (=> b!9261 (=> (not res!9580) (not e!5725))))

(assert (=> b!9261 (= res!9580 (bvsle (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)) (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12840))) (currentByte!1621 (_2!615 lt!12840)) (currentBit!1616 (_2!615 lt!12840)))))))

(declare-fun b!9262 () Bool)

(declare-fun e!5724 () Bool)

(assert (=> b!9262 (= e!5725 e!5724)))

(declare-fun res!9579 () Bool)

(assert (=> b!9262 (=> res!9579 e!5724)))

(assert (=> b!9262 (= res!9579 (= (size!246 (buf!582 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9263 () Bool)

(assert (=> b!9263 (= e!5724 (arrayBitRangesEq!0 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12840)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(assert (= (and d!2870 res!9578) b!9261))

(assert (= (and b!9261 res!9580) b!9262))

(assert (= (and b!9262 (not res!9579)) b!9263))

(assert (=> b!9261 m!11863))

(assert (=> b!9261 m!11945))

(assert (=> b!9263 m!11863))

(assert (=> b!9263 m!11863))

(declare-fun m!13093 () Bool)

(assert (=> b!9263 m!13093))

(assert (=> b!8725 d!2870))

(declare-fun b!9264 () Bool)

(declare-fun e!5726 () Unit!746)

(declare-fun Unit!793 () Unit!746)

(assert (=> b!9264 (= e!5726 Unit!793)))

(declare-fun lt!13934 () (_ BitVec 64))

(declare-fun lt!13944 () tuple2!1170)

(declare-fun e!5727 () Bool)

(declare-fun b!9265 () Bool)

(declare-fun lt!13933 () (_ BitVec 64))

(assert (=> b!9265 (= e!5727 (= (_1!616 lt!13944) (withMovedBitIndex!0 (_2!616 lt!13944) (bvsub lt!13933 lt!13934))))))

(assert (=> b!9265 (or (= (bvand lt!13933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13934 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13933 lt!13934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9265 (= lt!13934 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862))))))

(assert (=> b!9265 (= lt!13933 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(declare-fun b!9266 () Bool)

(declare-fun lt!13937 () Unit!746)

(assert (=> b!9266 (= e!5726 lt!13937)))

(declare-fun lt!13936 () (_ BitVec 64))

(assert (=> b!9266 (= lt!13936 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13940 () (_ BitVec 64))

(assert (=> b!9266 (= lt!13940 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(assert (=> b!9266 (= lt!13937 (arrayBitRangesEqSymmetric!0 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12862)) lt!13936 lt!13940))))

(assert (=> b!9266 (arrayBitRangesEq!0 (buf!582 (_2!615 lt!12862)) (buf!582 thiss!1486) lt!13936 lt!13940)))

(declare-fun b!9267 () Bool)

(declare-fun res!9581 () Bool)

(assert (=> b!9267 (=> (not res!9581) (not e!5727))))

(assert (=> b!9267 (= res!9581 (isPrefixOf!0 (_2!616 lt!13944) (_2!615 lt!12862)))))

(declare-fun b!9268 () Bool)

(declare-fun res!9582 () Bool)

(assert (=> b!9268 (=> (not res!9582) (not e!5727))))

(assert (=> b!9268 (= res!9582 (isPrefixOf!0 (_1!616 lt!13944) thiss!1486))))

(declare-fun d!2872 () Bool)

(assert (=> d!2872 e!5727))

(declare-fun res!9583 () Bool)

(assert (=> d!2872 (=> (not res!9583) (not e!5727))))

(assert (=> d!2872 (= res!9583 (isPrefixOf!0 (_1!616 lt!13944) (_2!616 lt!13944)))))

(declare-fun lt!13939 () BitStream!470)

(assert (=> d!2872 (= lt!13944 (tuple2!1171 lt!13939 (_2!615 lt!12862)))))

(declare-fun lt!13938 () Unit!746)

(declare-fun lt!13931 () Unit!746)

(assert (=> d!2872 (= lt!13938 lt!13931)))

(assert (=> d!2872 (isPrefixOf!0 lt!13939 (_2!615 lt!12862))))

(assert (=> d!2872 (= lt!13931 (lemmaIsPrefixTransitive!0 lt!13939 (_2!615 lt!12862) (_2!615 lt!12862)))))

(declare-fun lt!13943 () Unit!746)

(declare-fun lt!13927 () Unit!746)

(assert (=> d!2872 (= lt!13943 lt!13927)))

(assert (=> d!2872 (isPrefixOf!0 lt!13939 (_2!615 lt!12862))))

(assert (=> d!2872 (= lt!13927 (lemmaIsPrefixTransitive!0 lt!13939 thiss!1486 (_2!615 lt!12862)))))

(declare-fun lt!13925 () Unit!746)

(assert (=> d!2872 (= lt!13925 e!5726)))

(declare-fun c!569 () Bool)

(assert (=> d!2872 (= c!569 (not (= (size!246 (buf!582 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!13928 () Unit!746)

(declare-fun lt!13929 () Unit!746)

(assert (=> d!2872 (= lt!13928 lt!13929)))

(assert (=> d!2872 (isPrefixOf!0 (_2!615 lt!12862) (_2!615 lt!12862))))

(assert (=> d!2872 (= lt!13929 (lemmaIsPrefixRefl!0 (_2!615 lt!12862)))))

(declare-fun lt!13930 () Unit!746)

(declare-fun lt!13932 () Unit!746)

(assert (=> d!2872 (= lt!13930 lt!13932)))

(assert (=> d!2872 (= lt!13932 (lemmaIsPrefixRefl!0 (_2!615 lt!12862)))))

(declare-fun lt!13942 () Unit!746)

(declare-fun lt!13926 () Unit!746)

(assert (=> d!2872 (= lt!13942 lt!13926)))

(assert (=> d!2872 (isPrefixOf!0 lt!13939 lt!13939)))

(assert (=> d!2872 (= lt!13926 (lemmaIsPrefixRefl!0 lt!13939))))

(declare-fun lt!13941 () Unit!746)

(declare-fun lt!13935 () Unit!746)

(assert (=> d!2872 (= lt!13941 lt!13935)))

(assert (=> d!2872 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2872 (= lt!13935 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2872 (= lt!13939 (BitStream!471 (buf!582 (_2!615 lt!12862)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(assert (=> d!2872 (isPrefixOf!0 thiss!1486 (_2!615 lt!12862))))

(assert (=> d!2872 (= (reader!0 thiss!1486 (_2!615 lt!12862)) lt!13944)))

(assert (= (and d!2872 c!569) b!9266))

(assert (= (and d!2872 (not c!569)) b!9264))

(assert (= (and d!2872 res!9583) b!9268))

(assert (= (and b!9268 res!9582) b!9267))

(assert (= (and b!9267 res!9581) b!9265))

(declare-fun m!13095 () Bool)

(assert (=> b!9265 m!13095))

(assert (=> b!9265 m!11977))

(assert (=> b!9265 m!11863))

(declare-fun m!13097 () Bool)

(assert (=> d!2872 m!13097))

(declare-fun m!13099 () Bool)

(assert (=> d!2872 m!13099))

(assert (=> d!2872 m!12045))

(declare-fun m!13101 () Bool)

(assert (=> d!2872 m!13101))

(declare-fun m!13103 () Bool)

(assert (=> d!2872 m!13103))

(declare-fun m!13105 () Bool)

(assert (=> d!2872 m!13105))

(assert (=> d!2872 m!12047))

(declare-fun m!13107 () Bool)

(assert (=> d!2872 m!13107))

(declare-fun m!13109 () Bool)

(assert (=> d!2872 m!13109))

(declare-fun m!13111 () Bool)

(assert (=> d!2872 m!13111))

(declare-fun m!13113 () Bool)

(assert (=> d!2872 m!13113))

(declare-fun m!13115 () Bool)

(assert (=> b!9268 m!13115))

(assert (=> b!9266 m!11863))

(declare-fun m!13117 () Bool)

(assert (=> b!9266 m!13117))

(declare-fun m!13119 () Bool)

(assert (=> b!9266 m!13119))

(declare-fun m!13121 () Bool)

(assert (=> b!9267 m!13121))

(assert (=> b!8725 d!2872))

(declare-fun d!2874 () Bool)

(assert (=> d!2874 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12848)))

(declare-fun lt!13945 () Unit!746)

(assert (=> d!2874 (= lt!13945 (choose!9 thiss!1486 (buf!582 (_2!615 lt!12862)) lt!12848 (BitStream!471 (buf!582 (_2!615 lt!12862)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(assert (=> d!2874 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!582 (_2!615 lt!12862)) lt!12848) lt!13945)))

(declare-fun bs!895 () Bool)

(assert (= bs!895 d!2874))

(assert (=> bs!895 m!12001))

(declare-fun m!13123 () Bool)

(assert (=> bs!895 m!13123))

(assert (=> b!8725 d!2874))

(declare-fun d!2876 () Bool)

(declare-fun e!5730 () Bool)

(assert (=> d!2876 e!5730))

(declare-fun res!9586 () Bool)

(assert (=> d!2876 (=> (not res!9586) (not e!5730))))

(declare-fun lt!13951 () (_ BitVec 64))

(assert (=> d!2876 (= res!9586 (or (= (bvand lt!12836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13951 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12836 lt!13951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!2876 (= lt!13951 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13950 () Unit!746)

(declare-fun choose!42 (BitStream!470 BitStream!470 BitStream!470 BitStream!470 (_ BitVec 64) List!143) Unit!746)

(assert (=> d!2876 (= lt!13950 (choose!42 (_2!615 lt!12840) (_2!615 lt!12840) (_1!616 lt!12850) (_1!616 lt!12865) lt!12836 lt!12861))))

(assert (=> d!2876 (bvsgt lt!12836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2876 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!615 lt!12840) (_2!615 lt!12840) (_1!616 lt!12850) (_1!616 lt!12865) lt!12836 lt!12861) lt!13950)))

(declare-fun b!9271 () Bool)

(assert (=> b!9271 (= e!5730 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_1!616 lt!12865) (bvsub lt!12836 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!56 lt!12861)))))

(assert (= (and d!2876 res!9586) b!9271))

(declare-fun m!13125 () Bool)

(assert (=> d!2876 m!13125))

(assert (=> b!9271 m!11951))

(assert (=> b!9271 m!12015))

(assert (=> b!8725 d!2876))

(declare-fun b!9275 () Bool)

(declare-fun e!5732 () Bool)

(declare-fun lt!13954 () List!143)

(assert (=> b!9275 (= e!5732 (> (length!21 lt!13954) 0))))

(declare-fun d!2878 () Bool)

(assert (=> d!2878 e!5732))

(declare-fun c!570 () Bool)

(assert (=> d!2878 (= c!570 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5731 () tuple2!1178)

(assert (=> d!2878 (= lt!13954 (_1!622 e!5731))))

(declare-fun c!571 () Bool)

(assert (=> d!2878 (= c!571 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2878 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2878 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12862) (_1!616 lt!12864) #b0000000000000000000000000000000000000000000000000000000000000001) lt!13954)))

(declare-fun b!9273 () Bool)

(declare-fun lt!13953 () (_ BitVec 64))

(declare-fun lt!13952 () tuple2!1180)

(assert (=> b!9273 (= e!5731 (tuple2!1179 (Cons!139 (_1!623 lt!13952) (bitStreamReadBitsIntoList!0 (_2!615 lt!12862) (_2!623 lt!13952) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!13953))) (_2!623 lt!13952)))))

(assert (=> b!9273 (= lt!13952 (readBit!0 (_1!616 lt!12864)))))

(assert (=> b!9273 (= lt!13953 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9272 () Bool)

(assert (=> b!9272 (= e!5731 (tuple2!1179 Nil!140 (_1!616 lt!12864)))))

(declare-fun b!9274 () Bool)

(assert (=> b!9274 (= e!5732 (isEmpty!26 lt!13954))))

(assert (= (and d!2878 c!571) b!9272))

(assert (= (and d!2878 (not c!571)) b!9273))

(assert (= (and d!2878 c!570) b!9274))

(assert (= (and d!2878 (not c!570)) b!9275))

(declare-fun m!13127 () Bool)

(assert (=> b!9275 m!13127))

(declare-fun m!13129 () Bool)

(assert (=> b!9273 m!13129))

(declare-fun m!13131 () Bool)

(assert (=> b!9273 m!13131))

(declare-fun m!13133 () Bool)

(assert (=> b!9274 m!13133))

(assert (=> b!8725 d!2878))

(declare-fun d!2880 () Bool)

(declare-fun c!572 () Bool)

(assert (=> d!2880 (= c!572 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5733 () List!143)

(assert (=> d!2880 (= (byteArrayBitContentToList!0 (_2!615 lt!12862) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001) e!5733)))

(declare-fun b!9276 () Bool)

(assert (=> b!9276 (= e!5733 Nil!140)))

(declare-fun b!9277 () Bool)

(assert (=> b!9277 (= e!5733 (Cons!139 (not (= (bvand ((_ sign_extend 24) (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!615 lt!12862) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2880 c!572) b!9276))

(assert (= (and d!2880 (not c!572)) b!9277))

(assert (=> b!9277 m!12027))

(assert (=> b!9277 m!12833))

(declare-fun m!13135 () Bool)

(assert (=> b!9277 m!13135))

(assert (=> b!8725 d!2880))

(declare-fun d!2882 () Bool)

(declare-fun c!573 () Bool)

(assert (=> d!2882 (= c!573 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5734 () List!143)

(assert (=> d!2882 (= (byteArrayBitContentToList!0 (_2!615 lt!12840) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) e!5734)))

(declare-fun b!9278 () Bool)

(assert (=> b!9278 (= e!5734 Nil!140)))

(declare-fun b!9279 () Bool)

(assert (=> b!9279 (= e!5734 (Cons!139 (not (= (bvand ((_ sign_extend 24) (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!615 lt!12840) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2882 c!573) b!9278))

(assert (= (and d!2882 (not c!573)) b!9279))

(declare-fun m!13137 () Bool)

(assert (=> b!9279 m!13137))

(declare-fun m!13139 () Bool)

(assert (=> b!9279 m!13139))

(declare-fun m!13141 () Bool)

(assert (=> b!9279 m!13141))

(assert (=> b!8725 d!2882))

(declare-fun d!2884 () Bool)

(declare-fun e!5735 () Bool)

(assert (=> d!2884 e!5735))

(declare-fun res!9587 () Bool)

(assert (=> d!2884 (=> (not res!9587) (not e!5735))))

(declare-fun lt!13957 () (_ BitVec 64))

(declare-fun lt!13955 () (_ BitVec 64))

(declare-fun lt!13956 () (_ BitVec 64))

(assert (=> d!2884 (= res!9587 (= lt!13957 (bvsub lt!13956 lt!13955)))))

(assert (=> d!2884 (or (= (bvand lt!13956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13955 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13956 lt!13955) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2884 (= lt!13955 (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862)))))))

(declare-fun lt!13960 () (_ BitVec 64))

(declare-fun lt!13958 () (_ BitVec 64))

(assert (=> d!2884 (= lt!13956 (bvmul lt!13960 lt!13958))))

(assert (=> d!2884 (or (= lt!13960 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13958 (bvsdiv (bvmul lt!13960 lt!13958) lt!13960)))))

(assert (=> d!2884 (= lt!13958 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2884 (= lt!13960 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))))))

(assert (=> d!2884 (= lt!13957 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862)))))))

(assert (=> d!2884 (invariant!0 (currentBit!1616 (_2!615 lt!12862)) (currentByte!1621 (_2!615 lt!12862)) (size!246 (buf!582 (_2!615 lt!12862))))))

(assert (=> d!2884 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862))) lt!13957)))

(declare-fun b!9280 () Bool)

(declare-fun res!9588 () Bool)

(assert (=> b!9280 (=> (not res!9588) (not e!5735))))

(assert (=> b!9280 (= res!9588 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13957))))

(declare-fun b!9281 () Bool)

(declare-fun lt!13959 () (_ BitVec 64))

(assert (=> b!9281 (= e!5735 (bvsle lt!13957 (bvmul lt!13959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9281 (or (= lt!13959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13959)))))

(assert (=> b!9281 (= lt!13959 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))))))

(assert (= (and d!2884 res!9587) b!9280))

(assert (= (and b!9280 res!9588) b!9281))

(declare-fun m!13143 () Bool)

(assert (=> d!2884 m!13143))

(declare-fun m!13145 () Bool)

(assert (=> d!2884 m!13145))

(assert (=> b!8725 d!2884))

(declare-fun d!2886 () Bool)

(declare-fun e!5738 () Bool)

(assert (=> d!2886 e!5738))

(declare-fun res!9591 () Bool)

(assert (=> d!2886 (=> (not res!9591) (not e!5738))))

(assert (=> d!2886 (= res!9591 (or (= (bvand lt!12852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12837 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12852 lt!12837) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!13963 () Unit!746)

(declare-fun choose!27 (BitStream!470 BitStream!470 (_ BitVec 64) (_ BitVec 64)) Unit!746)

(assert (=> d!2886 (= lt!13963 (choose!27 thiss!1486 (_2!615 lt!12862) lt!12852 lt!12837))))

(assert (=> d!2886 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12837) (bvsle lt!12837 lt!12852))))

(assert (=> d!2886 (= (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!615 lt!12862) lt!12852 lt!12837) lt!13963)))

(declare-fun b!9284 () Bool)

(assert (=> b!9284 (= e!5738 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) (bvsub lt!12852 lt!12837)))))

(assert (= (and d!2886 res!9591) b!9284))

(declare-fun m!13147 () Bool)

(assert (=> d!2886 m!13147))

(assert (=> b!9284 m!11983))

(assert (=> b!8725 d!2886))

(declare-fun d!2888 () Bool)

(declare-fun e!5739 () Bool)

(assert (=> d!2888 e!5739))

(declare-fun res!9592 () Bool)

(assert (=> d!2888 (=> (not res!9592) (not e!5739))))

(declare-fun lt!13966 () (_ BitVec 64))

(declare-fun lt!13964 () (_ BitVec 64))

(declare-fun lt!13965 () (_ BitVec 64))

(assert (=> d!2888 (= res!9592 (= lt!13966 (bvsub lt!13965 lt!13964)))))

(assert (=> d!2888 (or (= (bvand lt!13965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13964 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13965 lt!13964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2888 (= lt!13964 (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12840))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12840)))))))

(declare-fun lt!13969 () (_ BitVec 64))

(declare-fun lt!13967 () (_ BitVec 64))

(assert (=> d!2888 (= lt!13965 (bvmul lt!13969 lt!13967))))

(assert (=> d!2888 (or (= lt!13969 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13967 (bvsdiv (bvmul lt!13969 lt!13967) lt!13969)))))

(assert (=> d!2888 (= lt!13967 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2888 (= lt!13969 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))))))

(assert (=> d!2888 (= lt!13966 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12840))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12840)))))))

(assert (=> d!2888 (invariant!0 (currentBit!1616 (_2!615 lt!12840)) (currentByte!1621 (_2!615 lt!12840)) (size!246 (buf!582 (_2!615 lt!12840))))))

(assert (=> d!2888 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12840))) (currentByte!1621 (_2!615 lt!12840)) (currentBit!1616 (_2!615 lt!12840))) lt!13966)))

(declare-fun b!9285 () Bool)

(declare-fun res!9593 () Bool)

(assert (=> b!9285 (=> (not res!9593) (not e!5739))))

(assert (=> b!9285 (= res!9593 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13966))))

(declare-fun b!9286 () Bool)

(declare-fun lt!13968 () (_ BitVec 64))

(assert (=> b!9286 (= e!5739 (bvsle lt!13966 (bvmul lt!13968 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9286 (or (= lt!13968 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13968 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13968)))))

(assert (=> b!9286 (= lt!13968 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))))))

(assert (= (and d!2888 res!9592) b!9285))

(assert (= (and b!9285 res!9593) b!9286))

(declare-fun m!13149 () Bool)

(assert (=> d!2888 m!13149))

(declare-fun m!13151 () Bool)

(assert (=> d!2888 m!13151))

(assert (=> b!8725 d!2888))

(declare-fun b!9304 () Bool)

(declare-fun e!5750 () Bool)

(declare-fun e!5748 () Bool)

(assert (=> b!9304 (= e!5750 e!5748)))

(declare-fun res!9614 () Bool)

(assert (=> b!9304 (=> (not res!9614) (not e!5748))))

(declare-fun lt!14000 () tuple2!1188)

(declare-fun lt!13995 () tuple2!1168)

(declare-fun lt!13997 () (_ BitVec 8))

(assert (=> b!9304 (= res!9614 (and (= (_2!630 lt!14000) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!13997)) #b00000000000000000000000000000000))) (= (_1!630 lt!14000) (_2!615 lt!13995))))))

(declare-fun lt!14004 () tuple2!1172)

(declare-fun lt!14003 () BitStream!470)

(assert (=> b!9304 (= lt!14004 (readBits!0 lt!14003 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!9304 (= lt!14000 (readBitPure!0 lt!14003))))

(declare-fun readerFrom!0 (BitStream!470 (_ BitVec 32) (_ BitVec 32)) BitStream!470)

(assert (=> b!9304 (= lt!14003 (readerFrom!0 (_2!615 lt!13995) (currentBit!1616 thiss!1486) (currentByte!1621 thiss!1486)))))

(declare-fun b!9305 () Bool)

(declare-fun e!5749 () Bool)

(declare-fun lt!13996 () tuple2!1188)

(declare-fun lt!14001 () tuple2!1168)

(assert (=> b!9305 (= e!5749 (= (bitIndex!0 (size!246 (buf!582 (_1!630 lt!13996))) (currentByte!1621 (_1!630 lt!13996)) (currentBit!1616 (_1!630 lt!13996))) (bitIndex!0 (size!246 (buf!582 (_2!615 lt!14001))) (currentByte!1621 (_2!615 lt!14001)) (currentBit!1616 (_2!615 lt!14001)))))))

(declare-fun b!9306 () Bool)

(declare-fun res!9615 () Bool)

(assert (=> b!9306 (=> (not res!9615) (not e!5750))))

(assert (=> b!9306 (= res!9615 (isPrefixOf!0 thiss!1486 (_2!615 lt!13995)))))

(declare-fun b!9307 () Bool)

(declare-fun e!5751 () Bool)

(assert (=> b!9307 (= e!5751 e!5749)))

(declare-fun res!9611 () Bool)

(assert (=> b!9307 (=> (not res!9611) (not e!5749))))

(declare-fun lt!13998 () Bool)

(assert (=> b!9307 (= res!9611 (and (= (_2!630 lt!13996) lt!13998) (= (_1!630 lt!13996) (_2!615 lt!14001))))))

(assert (=> b!9307 (= lt!13996 (readBitPure!0 (readerFrom!0 (_2!615 lt!14001) (currentBit!1616 thiss!1486) (currentByte!1621 thiss!1486))))))

(declare-fun b!9308 () Bool)

(assert (=> b!9308 (= e!5748 (= (bitIndex!0 (size!246 (buf!582 (_1!630 lt!14000))) (currentByte!1621 (_1!630 lt!14000)) (currentBit!1616 (_1!630 lt!14000))) (bitIndex!0 (size!246 (buf!582 (_2!615 lt!13995))) (currentByte!1621 (_2!615 lt!13995)) (currentBit!1616 (_2!615 lt!13995)))))))

(declare-fun d!2890 () Bool)

(assert (=> d!2890 e!5750))

(declare-fun res!9613 () Bool)

(assert (=> d!2890 (=> (not res!9613) (not e!5750))))

(assert (=> d!2890 (= res!9613 (= (size!246 (buf!582 (_2!615 lt!13995))) (size!246 (buf!582 thiss!1486))))))

(declare-fun lt!14005 () array!574)

(assert (=> d!2890 (= lt!13997 (select (arr!651 lt!14005) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!2890 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!246 lt!14005)))))

(assert (=> d!2890 (= lt!14005 (array!575 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!14002 () tuple2!1168)

(assert (=> d!2890 (= lt!13995 (tuple2!1169 (_1!615 lt!14002) (_2!615 lt!14002)))))

(assert (=> d!2890 (= lt!14002 lt!14001)))

(assert (=> d!2890 e!5751))

(declare-fun res!9612 () Bool)

(assert (=> d!2890 (=> (not res!9612) (not e!5751))))

(assert (=> d!2890 (= res!9612 (= (size!246 (buf!582 thiss!1486)) (size!246 (buf!582 (_2!615 lt!14001)))))))

(declare-fun appendBit!0 (BitStream!470 Bool) tuple2!1168)

(assert (=> d!2890 (= lt!14001 (appendBit!0 thiss!1486 lt!13998))))

(assert (=> d!2890 (= lt!13998 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!2890 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!2890 (= (appendBitFromByte!0 thiss!1486 (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!13995)))

(declare-fun b!9309 () Bool)

(declare-fun res!9617 () Bool)

(assert (=> b!9309 (=> (not res!9617) (not e!5750))))

(declare-fun lt!13994 () (_ BitVec 64))

(declare-fun lt!13999 () (_ BitVec 64))

(assert (=> b!9309 (= res!9617 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!13995))) (currentByte!1621 (_2!615 lt!13995)) (currentBit!1616 (_2!615 lt!13995))) (bvadd lt!13994 lt!13999)))))

(assert (=> b!9309 (or (not (= (bvand lt!13994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13999 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13994 lt!13999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9309 (= lt!13999 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!9309 (= lt!13994 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(declare-fun b!9310 () Bool)

(declare-fun res!9610 () Bool)

(assert (=> b!9310 (=> (not res!9610) (not e!5751))))

(assert (=> b!9310 (= res!9610 (isPrefixOf!0 thiss!1486 (_2!615 lt!14001)))))

(declare-fun b!9311 () Bool)

(declare-fun res!9616 () Bool)

(assert (=> b!9311 (=> (not res!9616) (not e!5751))))

(assert (=> b!9311 (= res!9616 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!14001))) (currentByte!1621 (_2!615 lt!14001)) (currentBit!1616 (_2!615 lt!14001))) (bvadd (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2890 res!9612) b!9311))

(assert (= (and b!9311 res!9616) b!9310))

(assert (= (and b!9310 res!9610) b!9307))

(assert (= (and b!9307 res!9611) b!9305))

(assert (= (and d!2890 res!9613) b!9309))

(assert (= (and b!9309 res!9617) b!9306))

(assert (= (and b!9306 res!9615) b!9304))

(assert (= (and b!9304 res!9614) b!9308))

(declare-fun m!13153 () Bool)

(assert (=> b!9308 m!13153))

(declare-fun m!13155 () Bool)

(assert (=> b!9308 m!13155))

(declare-fun m!13157 () Bool)

(assert (=> d!2890 m!13157))

(declare-fun m!13159 () Bool)

(assert (=> d!2890 m!13159))

(assert (=> d!2890 m!12833))

(declare-fun m!13161 () Bool)

(assert (=> b!9310 m!13161))

(declare-fun m!13163 () Bool)

(assert (=> b!9307 m!13163))

(assert (=> b!9307 m!13163))

(declare-fun m!13165 () Bool)

(assert (=> b!9307 m!13165))

(declare-fun m!13167 () Bool)

(assert (=> b!9305 m!13167))

(declare-fun m!13169 () Bool)

(assert (=> b!9305 m!13169))

(declare-fun m!13171 () Bool)

(assert (=> b!9306 m!13171))

(assert (=> b!9311 m!13169))

(assert (=> b!9311 m!11863))

(declare-fun m!13173 () Bool)

(assert (=> b!9304 m!13173))

(declare-fun m!13175 () Bool)

(assert (=> b!9304 m!13175))

(declare-fun m!13177 () Bool)

(assert (=> b!9304 m!13177))

(assert (=> b!9309 m!13155))

(assert (=> b!9309 m!11863))

(assert (=> b!8725 d!2890))

(declare-fun d!2892 () Bool)

(assert (=> d!2892 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) lt!12849)))

(declare-fun lt!14006 () Unit!746)

(assert (=> d!2892 (= lt!14006 (choose!9 (_2!615 lt!12862) (buf!582 (_2!615 lt!12840)) lt!12849 (BitStream!471 (buf!582 (_2!615 lt!12840)) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862)))))))

(assert (=> d!2892 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!615 lt!12862) (buf!582 (_2!615 lt!12840)) lt!12849) lt!14006)))

(declare-fun bs!896 () Bool)

(assert (= bs!896 d!2892))

(assert (=> bs!896 m!12037))

(declare-fun m!13179 () Bool)

(assert (=> bs!896 m!13179))

(assert (=> b!8725 d!2892))

(declare-fun b!9315 () Bool)

(declare-fun e!5753 () Bool)

(declare-fun lt!14009 () List!143)

(assert (=> b!9315 (= e!5753 (> (length!21 lt!14009) 0))))

(declare-fun d!2894 () Bool)

(assert (=> d!2894 e!5753))

(declare-fun c!574 () Bool)

(assert (=> d!2894 (= c!574 (= (bvsub lt!12836 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5752 () tuple2!1178)

(assert (=> d!2894 (= lt!14009 (_1!622 e!5752))))

(declare-fun c!575 () Bool)

(assert (=> d!2894 (= c!575 (= (bvsub lt!12836 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2894 (bvsge (bvsub lt!12836 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2894 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_1!616 lt!12865) (bvsub lt!12836 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!14009)))

(declare-fun lt!14007 () tuple2!1180)

(declare-fun lt!14008 () (_ BitVec 64))

(declare-fun b!9313 () Bool)

(assert (=> b!9313 (= e!5752 (tuple2!1179 (Cons!139 (_1!623 lt!14007) (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_2!623 lt!14007) (bvsub (bvsub lt!12836 #b0000000000000000000000000000000000000000000000000000000000000001) lt!14008))) (_2!623 lt!14007)))))

(assert (=> b!9313 (= lt!14007 (readBit!0 (_1!616 lt!12865)))))

(assert (=> b!9313 (= lt!14008 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9312 () Bool)

(assert (=> b!9312 (= e!5752 (tuple2!1179 Nil!140 (_1!616 lt!12865)))))

(declare-fun b!9314 () Bool)

(assert (=> b!9314 (= e!5753 (isEmpty!26 lt!14009))))

(assert (= (and d!2894 c!575) b!9312))

(assert (= (and d!2894 (not c!575)) b!9313))

(assert (= (and d!2894 c!574) b!9314))

(assert (= (and d!2894 (not c!574)) b!9315))

(declare-fun m!13181 () Bool)

(assert (=> b!9315 m!13181))

(declare-fun m!13183 () Bool)

(assert (=> b!9313 m!13183))

(declare-fun m!13185 () Bool)

(assert (=> b!9313 m!13185))

(declare-fun m!13187 () Bool)

(assert (=> b!9314 m!13187))

(assert (=> b!8725 d!2894))

(declare-fun b!9316 () Bool)

(declare-fun e!5754 () Bool)

(declare-fun lt!14013 () (_ BitVec 64))

(assert (=> b!9316 (= e!5754 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) lt!14013))))

(declare-fun b!9317 () Bool)

(declare-fun res!9622 () Bool)

(declare-fun e!5755 () Bool)

(assert (=> b!9317 (=> (not res!9622) (not e!5755))))

(declare-fun lt!14041 () tuple2!1168)

(assert (=> b!9317 (= res!9622 (invariant!0 (currentBit!1616 (_2!615 lt!14041)) (currentByte!1621 (_2!615 lt!14041)) (size!246 (buf!582 (_2!615 lt!14041)))))))

(declare-fun b!9318 () Bool)

(declare-fun res!9620 () Bool)

(assert (=> b!9318 (=> (not res!9620) (not e!5755))))

(assert (=> b!9318 (= res!9620 (= (size!246 (buf!582 (_2!615 lt!14041))) (size!246 (buf!582 (_2!615 lt!12862)))))))

(declare-fun b!9319 () Bool)

(declare-fun e!5756 () tuple2!1168)

(declare-fun Unit!794 () Unit!746)

(assert (=> b!9319 (= e!5756 (tuple2!1169 Unit!794 (_2!615 lt!12862)))))

(assert (=> b!9319 (= (size!246 (buf!582 (_2!615 lt!12862))) (size!246 (buf!582 (_2!615 lt!12862))))))

(declare-fun lt!14032 () Unit!746)

(declare-fun Unit!795 () Unit!746)

(assert (=> b!9319 (= lt!14032 Unit!795)))

(declare-fun call!159 () tuple2!1170)

(assert (=> b!9319 (checkByteArrayBitContent!0 (_2!615 lt!12862) srcBuffer!6 (_1!617 (readBits!0 (_1!616 call!159) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!9320 () Bool)

(declare-fun lt!14014 () tuple2!1168)

(declare-fun Unit!796 () Unit!746)

(assert (=> b!9320 (= e!5756 (tuple2!1169 Unit!796 (_2!615 lt!14014)))))

(declare-fun lt!14036 () tuple2!1168)

(assert (=> b!9320 (= lt!14036 (appendBitFromByte!0 (_2!615 lt!12862) (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!14026 () (_ BitVec 64))

(assert (=> b!9320 (= lt!14026 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14011 () (_ BitVec 64))

(assert (=> b!9320 (= lt!14011 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14028 () Unit!746)

(assert (=> b!9320 (= lt!14028 (validateOffsetBitsIneqLemma!0 (_2!615 lt!12862) (_2!615 lt!14036) lt!14026 lt!14011))))

(assert (=> b!9320 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!14036)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!14036))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!14036))) (bvsub lt!14026 lt!14011))))

(declare-fun lt!14018 () Unit!746)

(assert (=> b!9320 (= lt!14018 lt!14028)))

(declare-fun lt!14038 () tuple2!1170)

(assert (=> b!9320 (= lt!14038 (reader!0 (_2!615 lt!12862) (_2!615 lt!14036)))))

(declare-fun lt!14022 () (_ BitVec 64))

(assert (=> b!9320 (= lt!14022 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14021 () Unit!746)

(assert (=> b!9320 (= lt!14021 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!615 lt!12862) (buf!582 (_2!615 lt!14036)) lt!14022))))

(assert (=> b!9320 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!14036)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) lt!14022)))

(declare-fun lt!14017 () Unit!746)

(assert (=> b!9320 (= lt!14017 lt!14021)))

(assert (=> b!9320 (= (head!48 (byteArrayBitContentToList!0 (_2!615 lt!14036) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!48 (bitStreamReadBitsIntoList!0 (_2!615 lt!14036) (_1!616 lt!14038) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14042 () Unit!746)

(declare-fun Unit!797 () Unit!746)

(assert (=> b!9320 (= lt!14042 Unit!797)))

(assert (=> b!9320 (= lt!14014 (appendBitsMSBFirstLoop!0 (_2!615 lt!14036) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!14040 () Unit!746)

(assert (=> b!9320 (= lt!14040 (lemmaIsPrefixTransitive!0 (_2!615 lt!12862) (_2!615 lt!14036) (_2!615 lt!14014)))))

(assert (=> b!9320 (isPrefixOf!0 (_2!615 lt!12862) (_2!615 lt!14014))))

(declare-fun lt!14045 () Unit!746)

(assert (=> b!9320 (= lt!14045 lt!14040)))

(assert (=> b!9320 (= (size!246 (buf!582 (_2!615 lt!14014))) (size!246 (buf!582 (_2!615 lt!12862))))))

(declare-fun lt!14031 () Unit!746)

(declare-fun Unit!798 () Unit!746)

(assert (=> b!9320 (= lt!14031 Unit!798)))

(assert (=> b!9320 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!14014))) (currentByte!1621 (_2!615 lt!14014)) (currentBit!1616 (_2!615 lt!14014))) (bvsub (bvadd (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14052 () Unit!746)

(declare-fun Unit!799 () Unit!746)

(assert (=> b!9320 (= lt!14052 Unit!799)))

(assert (=> b!9320 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!14014))) (currentByte!1621 (_2!615 lt!14014)) (currentBit!1616 (_2!615 lt!14014))) (bvsub (bvsub (bvadd (bitIndex!0 (size!246 (buf!582 (_2!615 lt!14036))) (currentByte!1621 (_2!615 lt!14036)) (currentBit!1616 (_2!615 lt!14036))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!14049 () Unit!746)

(declare-fun Unit!800 () Unit!746)

(assert (=> b!9320 (= lt!14049 Unit!800)))

(declare-fun lt!14024 () tuple2!1170)

(assert (=> b!9320 (= lt!14024 (reader!0 (_2!615 lt!12862) (_2!615 lt!14014)))))

(declare-fun lt!14020 () (_ BitVec 64))

(assert (=> b!9320 (= lt!14020 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14027 () Unit!746)

(assert (=> b!9320 (= lt!14027 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!615 lt!12862) (buf!582 (_2!615 lt!14014)) lt!14020))))

(assert (=> b!9320 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!14014)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) lt!14020)))

(declare-fun lt!14037 () Unit!746)

(assert (=> b!9320 (= lt!14037 lt!14027)))

(declare-fun lt!14039 () tuple2!1170)

(assert (=> b!9320 (= lt!14039 call!159)))

(declare-fun lt!14023 () (_ BitVec 64))

(assert (=> b!9320 (= lt!14023 (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!14016 () Unit!746)

(assert (=> b!9320 (= lt!14016 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!615 lt!14036) (buf!582 (_2!615 lt!14014)) lt!14023))))

(assert (=> b!9320 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!14014)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!14036))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!14036))) lt!14023)))

(declare-fun lt!14034 () Unit!746)

(assert (=> b!9320 (= lt!14034 lt!14016)))

(declare-fun lt!14025 () List!143)

(assert (=> b!9320 (= lt!14025 (byteArrayBitContentToList!0 (_2!615 lt!14014) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!14012 () List!143)

(assert (=> b!9320 (= lt!14012 (byteArrayBitContentToList!0 (_2!615 lt!14014) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14035 () List!143)

(assert (=> b!9320 (= lt!14035 (bitStreamReadBitsIntoList!0 (_2!615 lt!14014) (_1!616 lt!14024) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!14053 () List!143)

(assert (=> b!9320 (= lt!14053 (bitStreamReadBitsIntoList!0 (_2!615 lt!14014) (_1!616 lt!14039) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14010 () (_ BitVec 64))

(assert (=> b!9320 (= lt!14010 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14047 () Unit!746)

(assert (=> b!9320 (= lt!14047 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!615 lt!14014) (_2!615 lt!14014) (_1!616 lt!14024) (_1!616 lt!14039) lt!14010 lt!14035))))

(assert (=> b!9320 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!14014) (_1!616 lt!14039) (bvsub lt!14010 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!56 lt!14035))))

(declare-fun lt!14043 () Unit!746)

(assert (=> b!9320 (= lt!14043 lt!14047)))

(declare-fun lt!14033 () Unit!746)

(declare-fun lt!14046 () (_ BitVec 64))

(assert (=> b!9320 (= lt!14033 (arrayBitRangesEqImpliesEq!0 (buf!582 (_2!615 lt!14036)) (buf!582 (_2!615 lt!14014)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!14046 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!14036))) (currentByte!1621 (_2!615 lt!14036)) (currentBit!1616 (_2!615 lt!14036)))))))

(assert (=> b!9320 (= (bitAt!0 (buf!582 (_2!615 lt!14036)) lt!14046) (bitAt!0 (buf!582 (_2!615 lt!14014)) lt!14046))))

(declare-fun lt!14029 () Unit!746)

(assert (=> b!9320 (= lt!14029 lt!14033)))

(declare-fun b!9322 () Bool)

(declare-fun res!9618 () Bool)

(assert (=> b!9322 (=> (not res!9618) (not e!5755))))

(assert (=> b!9322 (= res!9618 (= (size!246 (buf!582 (_2!615 lt!12862))) (size!246 (buf!582 (_2!615 lt!14041)))))))

(declare-fun bm!156 () Bool)

(declare-fun c!576 () Bool)

(assert (=> bm!156 (= call!159 (reader!0 (ite c!576 (_2!615 lt!14036) (_2!615 lt!12862)) (ite c!576 (_2!615 lt!14014) (_2!615 lt!12862))))))

(declare-fun b!9323 () Bool)

(declare-fun res!9621 () Bool)

(assert (=> b!9323 (=> (not res!9621) (not e!5755))))

(assert (=> b!9323 (= res!9621 (isPrefixOf!0 (_2!615 lt!12862) (_2!615 lt!14041)))))

(declare-fun b!9321 () Bool)

(declare-fun lt!14015 () tuple2!1170)

(assert (=> b!9321 (= e!5755 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!14041) (_1!616 lt!14015) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!615 lt!14041) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!9321 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9321 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!14051 () Unit!746)

(declare-fun lt!14048 () Unit!746)

(assert (=> b!9321 (= lt!14051 lt!14048)))

(assert (=> b!9321 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!14041)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) lt!14013)))

(assert (=> b!9321 (= lt!14048 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!615 lt!12862) (buf!582 (_2!615 lt!14041)) lt!14013))))

(assert (=> b!9321 e!5754))

(declare-fun res!9619 () Bool)

(assert (=> b!9321 (=> (not res!9619) (not e!5754))))

(assert (=> b!9321 (= res!9619 (and (= (size!246 (buf!582 (_2!615 lt!12862))) (size!246 (buf!582 (_2!615 lt!14041)))) (bvsge lt!14013 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9321 (= lt!14013 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!9321 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9321 (= lt!14015 (reader!0 (_2!615 lt!12862) (_2!615 lt!14041)))))

(declare-fun d!2896 () Bool)

(assert (=> d!2896 e!5755))

(declare-fun res!9623 () Bool)

(assert (=> d!2896 (=> (not res!9623) (not e!5755))))

(declare-fun lt!14030 () (_ BitVec 64))

(assert (=> d!2896 (= res!9623 (= (bitIndex!0 (size!246 (buf!582 (_2!615 lt!14041))) (currentByte!1621 (_2!615 lt!14041)) (currentBit!1616 (_2!615 lt!14041))) (bvsub lt!14030 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!2896 (or (= (bvand lt!14030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14030 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!14044 () (_ BitVec 64))

(assert (=> d!2896 (= lt!14030 (bvadd lt!14044 from!367 nBits!460))))

(assert (=> d!2896 (or (not (= (bvand lt!14044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14044 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2896 (= lt!14044 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862))))))

(assert (=> d!2896 (= lt!14041 e!5756)))

(assert (=> d!2896 (= c!576 (bvslt (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!14019 () Unit!746)

(declare-fun lt!14050 () Unit!746)

(assert (=> d!2896 (= lt!14019 lt!14050)))

(assert (=> d!2896 (isPrefixOf!0 (_2!615 lt!12862) (_2!615 lt!12862))))

(assert (=> d!2896 (= lt!14050 (lemmaIsPrefixRefl!0 (_2!615 lt!12862)))))

(assert (=> d!2896 (= lt!14046 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862))))))

(assert (=> d!2896 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2896 (= (appendBitsMSBFirstLoop!0 (_2!615 lt!12862) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)) lt!14041)))

(assert (= (and d!2896 c!576) b!9320))

(assert (= (and d!2896 (not c!576)) b!9319))

(assert (= (or b!9320 b!9319) bm!156))

(assert (= (and d!2896 res!9623) b!9317))

(assert (= (and b!9317 res!9622) b!9322))

(assert (= (and b!9322 res!9618) b!9323))

(assert (= (and b!9323 res!9621) b!9318))

(assert (= (and b!9318 res!9620) b!9321))

(assert (= (and b!9321 res!9619) b!9316))

(declare-fun m!13189 () Bool)

(assert (=> b!9316 m!13189))

(declare-fun m!13191 () Bool)

(assert (=> bm!156 m!13191))

(declare-fun m!13193 () Bool)

(assert (=> b!9323 m!13193))

(declare-fun m!13195 () Bool)

(assert (=> b!9317 m!13195))

(declare-fun m!13197 () Bool)

(assert (=> b!9321 m!13197))

(declare-fun m!13199 () Bool)

(assert (=> b!9321 m!13199))

(declare-fun m!13201 () Bool)

(assert (=> b!9321 m!13201))

(declare-fun m!13203 () Bool)

(assert (=> b!9321 m!13203))

(declare-fun m!13205 () Bool)

(assert (=> b!9321 m!13205))

(declare-fun m!13207 () Bool)

(assert (=> b!9319 m!13207))

(declare-fun m!13209 () Bool)

(assert (=> b!9319 m!13209))

(declare-fun m!13211 () Bool)

(assert (=> b!9320 m!13211))

(declare-fun m!13213 () Bool)

(assert (=> b!9320 m!13213))

(declare-fun m!13215 () Bool)

(assert (=> b!9320 m!13215))

(declare-fun m!13217 () Bool)

(assert (=> b!9320 m!13217))

(declare-fun m!13219 () Bool)

(assert (=> b!9320 m!13219))

(declare-fun m!13221 () Bool)

(assert (=> b!9320 m!13221))

(declare-fun m!13223 () Bool)

(assert (=> b!9320 m!13223))

(declare-fun m!13225 () Bool)

(assert (=> b!9320 m!13225))

(assert (=> b!9320 m!13211))

(declare-fun m!13227 () Bool)

(assert (=> b!9320 m!13227))

(declare-fun m!13229 () Bool)

(assert (=> b!9320 m!13229))

(declare-fun m!13231 () Bool)

(assert (=> b!9320 m!13231))

(declare-fun m!13233 () Bool)

(assert (=> b!9320 m!13233))

(declare-fun m!13235 () Bool)

(assert (=> b!9320 m!13235))

(declare-fun m!13237 () Bool)

(assert (=> b!9320 m!13237))

(declare-fun m!13239 () Bool)

(assert (=> b!9320 m!13239))

(declare-fun m!13241 () Bool)

(assert (=> b!9320 m!13241))

(declare-fun m!13243 () Bool)

(assert (=> b!9320 m!13243))

(declare-fun m!13245 () Bool)

(assert (=> b!9320 m!13245))

(assert (=> b!9320 m!13223))

(declare-fun m!13247 () Bool)

(assert (=> b!9320 m!13247))

(declare-fun m!13249 () Bool)

(assert (=> b!9320 m!13249))

(declare-fun m!13251 () Bool)

(assert (=> b!9320 m!13251))

(declare-fun m!13253 () Bool)

(assert (=> b!9320 m!13253))

(declare-fun m!13255 () Bool)

(assert (=> b!9320 m!13255))

(assert (=> b!9320 m!13137))

(declare-fun m!13257 () Bool)

(assert (=> b!9320 m!13257))

(declare-fun m!13259 () Bool)

(assert (=> b!9320 m!13259))

(declare-fun m!13261 () Bool)

(assert (=> b!9320 m!13261))

(assert (=> b!9320 m!13137))

(declare-fun m!13263 () Bool)

(assert (=> b!9320 m!13263))

(declare-fun m!13265 () Bool)

(assert (=> b!9320 m!13265))

(declare-fun m!13267 () Bool)

(assert (=> b!9320 m!13267))

(assert (=> b!9320 m!11977))

(assert (=> b!9320 m!13233))

(declare-fun m!13269 () Bool)

(assert (=> b!9320 m!13269))

(declare-fun m!13271 () Bool)

(assert (=> d!2896 m!13271))

(assert (=> d!2896 m!11977))

(assert (=> d!2896 m!13103))

(assert (=> d!2896 m!13099))

(assert (=> b!8725 d!2896))

(declare-fun d!2898 () Bool)

(assert (=> d!2898 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12846) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486))) lt!12846))))

(declare-fun bs!897 () Bool)

(assert (= bs!897 d!2898))

(declare-fun m!13273 () Bool)

(assert (=> bs!897 m!13273))

(assert (=> b!8725 d!2898))

(declare-fun d!2900 () Bool)

(assert (=> d!2900 (= (bitAt!0 (buf!582 (_2!615 lt!12862)) lt!12872) (bitAt!0 (buf!582 (_2!615 lt!12840)) lt!12872))))

(declare-fun lt!14056 () Unit!746)

(declare-fun choose!31 (array!574 array!574 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!746)

(assert (=> d!2900 (= lt!14056 (choose!31 (buf!582 (_2!615 lt!12862)) (buf!582 (_2!615 lt!12840)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12872 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862)))))))

(assert (=> d!2900 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862)))))))

(assert (=> d!2900 (= (arrayBitRangesEqImpliesEq!0 (buf!582 (_2!615 lt!12862)) (buf!582 (_2!615 lt!12840)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12872 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12862))) (currentByte!1621 (_2!615 lt!12862)) (currentBit!1616 (_2!615 lt!12862)))) lt!14056)))

(declare-fun bs!898 () Bool)

(assert (= bs!898 d!2900))

(assert (=> bs!898 m!11997))

(assert (=> bs!898 m!11961))

(assert (=> bs!898 m!11977))

(declare-fun m!13275 () Bool)

(assert (=> bs!898 m!13275))

(assert (=> b!8725 d!2900))

(declare-fun d!2902 () Bool)

(assert (=> d!2902 (= (head!48 (bitStreamReadBitsIntoList!0 (_2!615 lt!12862) (_1!616 lt!12864) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!258 (bitStreamReadBitsIntoList!0 (_2!615 lt!12862) (_1!616 lt!12864) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!8725 d!2902))

(declare-fun d!2904 () Bool)

(assert (=> d!2904 (= (bitAt!0 (buf!582 (_2!615 lt!12862)) lt!12872) (not (= (bvand ((_ sign_extend 24) (select (arr!651 (buf!582 (_2!615 lt!12862))) ((_ extract 31 0) (bvsdiv lt!12872 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!12872 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!899 () Bool)

(assert (= bs!899 d!2904))

(declare-fun m!13277 () Bool)

(assert (=> bs!899 m!13277))

(declare-fun m!13279 () Bool)

(assert (=> bs!899 m!13279))

(assert (=> b!8725 d!2904))

(declare-fun d!2906 () Bool)

(assert (=> d!2906 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) (bvsub lt!12852 lt!12837)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862)))) (bvsub lt!12852 lt!12837)))))

(declare-fun bs!900 () Bool)

(assert (= bs!900 d!2906))

(assert (=> bs!900 m!13143))

(assert (=> b!8725 d!2906))

(declare-fun b!9324 () Bool)

(declare-fun e!5757 () Unit!746)

(declare-fun Unit!801 () Unit!746)

(assert (=> b!9324 (= e!5757 Unit!801)))

(declare-fun lt!14065 () (_ BitVec 64))

(declare-fun lt!14066 () (_ BitVec 64))

(declare-fun lt!14076 () tuple2!1170)

(declare-fun b!9325 () Bool)

(declare-fun e!5758 () Bool)

(assert (=> b!9325 (= e!5758 (= (_1!616 lt!14076) (withMovedBitIndex!0 (_2!616 lt!14076) (bvsub lt!14065 lt!14066))))))

(assert (=> b!9325 (or (= (bvand lt!14065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14066 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14065 lt!14066) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9325 (= lt!14066 (bitIndex!0 (size!246 (buf!582 (_2!615 lt!12840))) (currentByte!1621 (_2!615 lt!12840)) (currentBit!1616 (_2!615 lt!12840))))))

(assert (=> b!9325 (= lt!14065 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(declare-fun b!9326 () Bool)

(declare-fun lt!14069 () Unit!746)

(assert (=> b!9326 (= e!5757 lt!14069)))

(declare-fun lt!14068 () (_ BitVec 64))

(assert (=> b!9326 (= lt!14068 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14072 () (_ BitVec 64))

(assert (=> b!9326 (= lt!14072 (bitIndex!0 (size!246 (buf!582 thiss!1486)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(assert (=> b!9326 (= lt!14069 (arrayBitRangesEqSymmetric!0 (buf!582 thiss!1486) (buf!582 (_2!615 lt!12840)) lt!14068 lt!14072))))

(assert (=> b!9326 (arrayBitRangesEq!0 (buf!582 (_2!615 lt!12840)) (buf!582 thiss!1486) lt!14068 lt!14072)))

(declare-fun b!9327 () Bool)

(declare-fun res!9624 () Bool)

(assert (=> b!9327 (=> (not res!9624) (not e!5758))))

(assert (=> b!9327 (= res!9624 (isPrefixOf!0 (_2!616 lt!14076) (_2!615 lt!12840)))))

(declare-fun b!9328 () Bool)

(declare-fun res!9625 () Bool)

(assert (=> b!9328 (=> (not res!9625) (not e!5758))))

(assert (=> b!9328 (= res!9625 (isPrefixOf!0 (_1!616 lt!14076) thiss!1486))))

(declare-fun d!2908 () Bool)

(assert (=> d!2908 e!5758))

(declare-fun res!9626 () Bool)

(assert (=> d!2908 (=> (not res!9626) (not e!5758))))

(assert (=> d!2908 (= res!9626 (isPrefixOf!0 (_1!616 lt!14076) (_2!616 lt!14076)))))

(declare-fun lt!14071 () BitStream!470)

(assert (=> d!2908 (= lt!14076 (tuple2!1171 lt!14071 (_2!615 lt!12840)))))

(declare-fun lt!14070 () Unit!746)

(declare-fun lt!14063 () Unit!746)

(assert (=> d!2908 (= lt!14070 lt!14063)))

(assert (=> d!2908 (isPrefixOf!0 lt!14071 (_2!615 lt!12840))))

(assert (=> d!2908 (= lt!14063 (lemmaIsPrefixTransitive!0 lt!14071 (_2!615 lt!12840) (_2!615 lt!12840)))))

(declare-fun lt!14075 () Unit!746)

(declare-fun lt!14059 () Unit!746)

(assert (=> d!2908 (= lt!14075 lt!14059)))

(assert (=> d!2908 (isPrefixOf!0 lt!14071 (_2!615 lt!12840))))

(assert (=> d!2908 (= lt!14059 (lemmaIsPrefixTransitive!0 lt!14071 thiss!1486 (_2!615 lt!12840)))))

(declare-fun lt!14057 () Unit!746)

(assert (=> d!2908 (= lt!14057 e!5757)))

(declare-fun c!577 () Bool)

(assert (=> d!2908 (= c!577 (not (= (size!246 (buf!582 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!14060 () Unit!746)

(declare-fun lt!14061 () Unit!746)

(assert (=> d!2908 (= lt!14060 lt!14061)))

(assert (=> d!2908 (isPrefixOf!0 (_2!615 lt!12840) (_2!615 lt!12840))))

(assert (=> d!2908 (= lt!14061 (lemmaIsPrefixRefl!0 (_2!615 lt!12840)))))

(declare-fun lt!14062 () Unit!746)

(declare-fun lt!14064 () Unit!746)

(assert (=> d!2908 (= lt!14062 lt!14064)))

(assert (=> d!2908 (= lt!14064 (lemmaIsPrefixRefl!0 (_2!615 lt!12840)))))

(declare-fun lt!14074 () Unit!746)

(declare-fun lt!14058 () Unit!746)

(assert (=> d!2908 (= lt!14074 lt!14058)))

(assert (=> d!2908 (isPrefixOf!0 lt!14071 lt!14071)))

(assert (=> d!2908 (= lt!14058 (lemmaIsPrefixRefl!0 lt!14071))))

(declare-fun lt!14073 () Unit!746)

(declare-fun lt!14067 () Unit!746)

(assert (=> d!2908 (= lt!14073 lt!14067)))

(assert (=> d!2908 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2908 (= lt!14067 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2908 (= lt!14071 (BitStream!471 (buf!582 (_2!615 lt!12840)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486)))))

(assert (=> d!2908 (isPrefixOf!0 thiss!1486 (_2!615 lt!12840))))

(assert (=> d!2908 (= (reader!0 thiss!1486 (_2!615 lt!12840)) lt!14076)))

(assert (= (and d!2908 c!577) b!9326))

(assert (= (and d!2908 (not c!577)) b!9324))

(assert (= (and d!2908 res!9626) b!9328))

(assert (= (and b!9328 res!9625) b!9327))

(assert (= (and b!9327 res!9624) b!9325))

(declare-fun m!13281 () Bool)

(assert (=> b!9325 m!13281))

(assert (=> b!9325 m!11945))

(assert (=> b!9325 m!11863))

(assert (=> d!2908 m!12031))

(declare-fun m!13283 () Bool)

(assert (=> d!2908 m!13283))

(assert (=> d!2908 m!12045))

(declare-fun m!13285 () Bool)

(assert (=> d!2908 m!13285))

(declare-fun m!13287 () Bool)

(assert (=> d!2908 m!13287))

(declare-fun m!13289 () Bool)

(assert (=> d!2908 m!13289))

(assert (=> d!2908 m!12047))

(declare-fun m!13291 () Bool)

(assert (=> d!2908 m!13291))

(declare-fun m!13293 () Bool)

(assert (=> d!2908 m!13293))

(declare-fun m!13295 () Bool)

(assert (=> d!2908 m!13295))

(declare-fun m!13297 () Bool)

(assert (=> d!2908 m!13297))

(declare-fun m!13299 () Bool)

(assert (=> b!9328 m!13299))

(assert (=> b!9326 m!11863))

(declare-fun m!13301 () Bool)

(assert (=> b!9326 m!13301))

(declare-fun m!13303 () Bool)

(assert (=> b!9326 m!13303))

(declare-fun m!13305 () Bool)

(assert (=> b!9327 m!13305))

(assert (=> b!8725 d!2908))

(declare-fun d!2910 () Bool)

(assert (=> d!2910 (isPrefixOf!0 thiss!1486 (_2!615 lt!12840))))

(declare-fun lt!14077 () Unit!746)

(assert (=> d!2910 (= lt!14077 (choose!30 thiss!1486 (_2!615 lt!12862) (_2!615 lt!12840)))))

(assert (=> d!2910 (isPrefixOf!0 thiss!1486 (_2!615 lt!12862))))

(assert (=> d!2910 (= (lemmaIsPrefixTransitive!0 thiss!1486 (_2!615 lt!12862) (_2!615 lt!12840)) lt!14077)))

(declare-fun bs!901 () Bool)

(assert (= bs!901 d!2910))

(assert (=> bs!901 m!12031))

(declare-fun m!13307 () Bool)

(assert (=> bs!901 m!13307))

(assert (=> bs!901 m!13097))

(assert (=> b!8725 d!2910))

(assert (=> b!8725 d!2614))

(declare-fun d!2912 () Bool)

(assert (=> d!2912 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12848) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12862)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486))) lt!12848))))

(declare-fun bs!902 () Bool)

(assert (= bs!902 d!2912))

(declare-fun m!13309 () Bool)

(assert (=> bs!902 m!13309))

(assert (=> b!8725 d!2912))

(declare-fun b!9332 () Bool)

(declare-fun e!5760 () Bool)

(declare-fun lt!14080 () List!143)

(assert (=> b!9332 (= e!5760 (> (length!21 lt!14080) 0))))

(declare-fun d!2914 () Bool)

(assert (=> d!2914 e!5760))

(declare-fun c!578 () Bool)

(assert (=> d!2914 (= c!578 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5759 () tuple2!1178)

(assert (=> d!2914 (= lt!14080 (_1!622 e!5759))))

(declare-fun c!579 () Bool)

(assert (=> d!2914 (= c!579 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2914 (bvsge (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2914 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_1!616 lt!12865) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!14080)))

(declare-fun lt!14078 () tuple2!1180)

(declare-fun b!9330 () Bool)

(declare-fun lt!14079 () (_ BitVec 64))

(assert (=> b!9330 (= e!5759 (tuple2!1179 (Cons!139 (_1!623 lt!14078) (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_2!623 lt!14078) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) lt!14079))) (_2!623 lt!14078)))))

(assert (=> b!9330 (= lt!14078 (readBit!0 (_1!616 lt!12865)))))

(assert (=> b!9330 (= lt!14079 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9329 () Bool)

(assert (=> b!9329 (= e!5759 (tuple2!1179 Nil!140 (_1!616 lt!12865)))))

(declare-fun b!9331 () Bool)

(assert (=> b!9331 (= e!5760 (isEmpty!26 lt!14080))))

(assert (= (and d!2914 c!579) b!9329))

(assert (= (and d!2914 (not c!579)) b!9330))

(assert (= (and d!2914 c!578) b!9331))

(assert (= (and d!2914 (not c!578)) b!9332))

(declare-fun m!13311 () Bool)

(assert (=> b!9332 m!13311))

(declare-fun m!13313 () Bool)

(assert (=> b!9330 m!13313))

(assert (=> b!9330 m!13185))

(declare-fun m!13315 () Bool)

(assert (=> b!9331 m!13315))

(assert (=> b!8725 d!2914))

(declare-fun b!9336 () Bool)

(declare-fun e!5762 () Bool)

(declare-fun lt!14083 () List!143)

(assert (=> b!9336 (= e!5762 (> (length!21 lt!14083) 0))))

(declare-fun d!2916 () Bool)

(assert (=> d!2916 e!5762))

(declare-fun c!580 () Bool)

(assert (=> d!2916 (= c!580 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5761 () tuple2!1178)

(assert (=> d!2916 (= lt!14083 (_1!622 e!5761))))

(declare-fun c!581 () Bool)

(assert (=> d!2916 (= c!581 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2916 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2916 (= (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_1!616 lt!12850) (bvsub (bvadd from!367 nBits!460) from!367)) lt!14083)))

(declare-fun lt!14082 () (_ BitVec 64))

(declare-fun lt!14081 () tuple2!1180)

(declare-fun b!9334 () Bool)

(assert (=> b!9334 (= e!5761 (tuple2!1179 (Cons!139 (_1!623 lt!14081) (bitStreamReadBitsIntoList!0 (_2!615 lt!12840) (_2!623 lt!14081) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!14082))) (_2!623 lt!14081)))))

(assert (=> b!9334 (= lt!14081 (readBit!0 (_1!616 lt!12850)))))

(assert (=> b!9334 (= lt!14082 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9333 () Bool)

(assert (=> b!9333 (= e!5761 (tuple2!1179 Nil!140 (_1!616 lt!12850)))))

(declare-fun b!9335 () Bool)

(assert (=> b!9335 (= e!5762 (isEmpty!26 lt!14083))))

(assert (= (and d!2916 c!581) b!9333))

(assert (= (and d!2916 (not c!581)) b!9334))

(assert (= (and d!2916 c!580) b!9335))

(assert (= (and d!2916 (not c!580)) b!9336))

(declare-fun m!13317 () Bool)

(assert (=> b!9336 m!13317))

(declare-fun m!13319 () Bool)

(assert (=> b!9334 m!13319))

(declare-fun m!13321 () Bool)

(assert (=> b!9334 m!13321))

(declare-fun m!13323 () Bool)

(assert (=> b!9335 m!13323))

(assert (=> b!8725 d!2916))

(declare-fun d!2918 () Bool)

(assert (=> d!2918 (= (bitAt!0 (buf!582 (_2!615 lt!12840)) lt!12872) (not (= (bvand ((_ sign_extend 24) (select (arr!651 (buf!582 (_2!615 lt!12840))) ((_ extract 31 0) (bvsdiv lt!12872 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!12872 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!903 () Bool)

(assert (= bs!903 d!2918))

(declare-fun m!13325 () Bool)

(assert (=> bs!903 m!13325))

(assert (=> bs!903 m!13279))

(assert (=> b!8725 d!2918))

(declare-fun d!2920 () Bool)

(assert (=> d!2920 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862))) lt!12849) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))) ((_ sign_extend 32) (currentByte!1621 (_2!615 lt!12862))) ((_ sign_extend 32) (currentBit!1616 (_2!615 lt!12862)))) lt!12849))))

(declare-fun bs!904 () Bool)

(assert (= bs!904 d!2920))

(declare-fun m!13327 () Bool)

(assert (=> bs!904 m!13327))

(assert (=> b!8725 d!2920))

(declare-fun d!2922 () Bool)

(declare-fun c!582 () Bool)

(assert (=> d!2922 (= c!582 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5763 () List!143)

(assert (=> d!2922 (= (byteArrayBitContentToList!0 (_2!615 lt!12840) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!5763)))

(declare-fun b!9337 () Bool)

(assert (=> b!9337 (= e!5763 Nil!140)))

(declare-fun b!9338 () Bool)

(assert (=> b!9338 (= e!5763 (Cons!139 (not (= (bvand ((_ sign_extend 24) (select (arr!651 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!615 lt!12840) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2922 c!582) b!9337))

(assert (= (and d!2922 (not c!582)) b!9338))

(assert (=> b!9338 m!12027))

(assert (=> b!9338 m!12833))

(assert (=> b!9338 m!11943))

(assert (=> b!8725 d!2922))

(declare-fun d!2924 () Bool)

(assert (=> d!2924 (validate_offset_bits!1 ((_ sign_extend 32) (size!246 (buf!582 (_2!615 lt!12840)))) ((_ sign_extend 32) (currentByte!1621 thiss!1486)) ((_ sign_extend 32) (currentBit!1616 thiss!1486)) lt!12846)))

(declare-fun lt!14084 () Unit!746)

(assert (=> d!2924 (= lt!14084 (choose!9 thiss!1486 (buf!582 (_2!615 lt!12840)) lt!12846 (BitStream!471 (buf!582 (_2!615 lt!12840)) (currentByte!1621 thiss!1486) (currentBit!1616 thiss!1486))))))

(assert (=> d!2924 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!582 (_2!615 lt!12840)) lt!12846) lt!14084)))

(declare-fun bs!905 () Bool)

(assert (= bs!905 d!2924))

(assert (=> bs!905 m!12013))

(declare-fun m!13329 () Bool)

(assert (=> bs!905 m!13329))

(assert (=> b!8725 d!2924))

(declare-fun d!2926 () Bool)

(assert (=> d!2926 (= (head!48 (byteArrayBitContentToList!0 (_2!615 lt!12862) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!258 (byteArrayBitContentToList!0 (_2!615 lt!12862) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!8725 d!2926))

(push 1)

(assert (not b!9267))

(assert (not b!9306))

(assert (not d!2890))

(assert (not b!9331))

(assert (not b!9246))

(assert (not b!9182))

(assert (not b!9263))

(assert (not b!9240))

(assert (not b!9143))

(assert (not b!9139))

(assert (not b!9239))

(assert (not b!9162))

(assert (not b!9211))

(assert (not b!9172))

(assert (not b!9304))

(assert (not b!9265))

(assert (not bm!156))

(assert (not b!9164))

(assert (not b!9195))

(assert (not b!9171))

(assert (not d!2848))

(assert (not d!2794))

(assert (not b!9307))

(assert (not b!9321))

(assert (not d!2910))

(assert (not b!9206))

(assert (not d!2872))

(assert (not d!2826))

(assert (not b!9180))

(assert (not b!9251))

(assert (not b!9166))

(assert (not d!2836))

(assert (not b!9325))

(assert (not b!9258))

(assert (not d!2864))

(assert (not b!9274))

(assert (not b!9277))

(assert (not b!9313))

(assert (not b!9242))

(assert (not b!9138))

(assert (not d!2920))

(assert (not d!2822))

(assert (not b!9210))

(assert (not d!2866))

(assert (not b!9204))

(assert (not b!9332))

(assert (not b!9335))

(assert (not d!2844))

(assert (not d!2828))

(assert (not d!2854))

(assert (not d!2908))

(assert (not b!9320))

(assert (not b!9259))

(assert (not b!9244))

(assert (not b!9273))

(assert (not b!9132))

(assert (not b!9252))

(assert (not b!9334))

(assert (not b!9168))

(assert (not b!9253))

(assert (not b!9249))

(assert (not b!9198))

(assert (not d!2924))

(assert (not b!9234))

(assert (not d!2816))

(assert (not b!9212))

(assert (not b!9248))

(assert (not b!9317))

(assert (not b!9314))

(assert (not d!2876))

(assert (not b!9181))

(assert (not b!9311))

(assert (not b!9141))

(assert (not b!9184))

(assert (not bm!154))

(assert (not b!9284))

(assert (not b!9336))

(assert (not d!2862))

(assert (not d!2874))

(assert (not b!9192))

(assert (not b!9203))

(assert (not b!9261))

(assert (not b!9338))

(assert (not b!9247))

(assert (not b!9208))

(assert (not bm!148))

(assert (not d!2784))

(assert (not d!2790))

(assert (not b!9327))

(assert (not d!2888))

(assert (not d!2814))

(assert (not b!9326))

(assert (not b!9309))

(assert (not b!9174))

(assert (not d!2900))

(assert (not d!2812))

(assert (not d!2858))

(assert (not d!2830))

(assert (not b!9163))

(assert (not b!9275))

(assert (not bm!155))

(assert (not b!9271))

(assert (not b!9197))

(assert (not b!9241))

(assert (not d!2886))

(assert (not b!9194))

(assert (not b!9268))

(assert (not d!2806))

(assert (not b!9279))

(assert (not d!2798))

(assert (not b!9200))

(assert (not b!9179))

(assert (not b!9310))

(assert (not b!9167))

(assert (not b!9201))

(assert (not b!9260))

(assert (not b!9305))

(assert (not d!2884))

(assert (not d!2892))

(assert (not b!9319))

(assert (not b!9315))

(assert (not d!2898))

(assert (not b!9266))

(assert (not d!2912))

(assert (not b!9233))

(assert (not b!9235))

(assert (not bm!149))

(assert (not b!9257))

(assert (not b!9323))

(assert (not b!9328))

(assert (not d!2896))

(assert (not b!9316))

(assert (not b!9330))

(assert (not b!9255))

(assert (not d!2906))

(assert (not b!9308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

