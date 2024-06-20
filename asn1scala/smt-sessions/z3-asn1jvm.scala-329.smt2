; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7480 () Bool)

(assert start!7480)

(declare-fun b!36377 () Bool)

(declare-fun e!23987 () Bool)

(declare-fun e!23983 () Bool)

(assert (=> b!36377 (= e!23987 e!23983)))

(declare-fun res!30983 () Bool)

(assert (=> b!36377 (=> res!30983 e!23983)))

(declare-fun lt!54666 () Bool)

(declare-datatypes ((array!1918 0))(
  ( (array!1919 (arr!1344 (Array (_ BitVec 32) (_ BitVec 8))) (size!857 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1482 0))(
  ( (BitStream!1483 (buf!1185 array!1918) (currentByte!2579 (_ BitVec 32)) (currentBit!2574 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3590 0))(
  ( (tuple2!3591 (_1!1882 BitStream!1482) (_2!1882 BitStream!1482)) )
))
(declare-fun lt!54675 () tuple2!3590)

(declare-fun lt!54673 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1918 (_ BitVec 64)) Bool)

(assert (=> b!36377 (= res!30983 (not (= lt!54666 (bitAt!0 (buf!1185 (_1!1882 lt!54675)) lt!54673))))))

(declare-fun lt!54680 () tuple2!3590)

(assert (=> b!36377 (= lt!54666 (bitAt!0 (buf!1185 (_1!1882 lt!54680)) lt!54673))))

(declare-fun b!36378 () Bool)

(declare-fun e!23996 () Bool)

(declare-fun e!23995 () Bool)

(assert (=> b!36378 (= e!23996 e!23995)))

(declare-fun res!30992 () Bool)

(assert (=> b!36378 (=> res!30992 e!23995)))

(declare-datatypes ((Unit!2665 0))(
  ( (Unit!2666) )
))
(declare-datatypes ((tuple2!3592 0))(
  ( (tuple2!3593 (_1!1883 Unit!2665) (_2!1883 BitStream!1482)) )
))
(declare-fun lt!54663 () tuple2!3592)

(declare-fun lt!54681 () tuple2!3592)

(declare-fun isPrefixOf!0 (BitStream!1482 BitStream!1482) Bool)

(assert (=> b!36378 (= res!30992 (not (isPrefixOf!0 (_2!1883 lt!54663) (_2!1883 lt!54681))))))

(declare-fun thiss!1379 () BitStream!1482)

(assert (=> b!36378 (isPrefixOf!0 thiss!1379 (_2!1883 lt!54681))))

(declare-fun lt!54679 () Unit!2665)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1482 BitStream!1482 BitStream!1482) Unit!2665)

(assert (=> b!36378 (= lt!54679 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1883 lt!54663) (_2!1883 lt!54681)))))

(declare-fun srcBuffer!2 () array!1918)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1482 array!1918 (_ BitVec 64) (_ BitVec 64)) tuple2!3592)

(assert (=> b!36378 (= lt!54681 (appendBitsMSBFirstLoop!0 (_2!1883 lt!54663) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!23997 () Bool)

(assert (=> b!36378 e!23997))

(declare-fun res!30976 () Bool)

(assert (=> b!36378 (=> (not res!30976) (not e!23997))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36378 (= res!30976 (validate_offset_bits!1 ((_ sign_extend 32) (size!857 (buf!1185 (_2!1883 lt!54663)))) ((_ sign_extend 32) (currentByte!2579 thiss!1379)) ((_ sign_extend 32) (currentBit!2574 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54682 () Unit!2665)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1482 array!1918 (_ BitVec 64)) Unit!2665)

(assert (=> b!36378 (= lt!54682 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1185 (_2!1883 lt!54663)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54672 () tuple2!3590)

(declare-fun reader!0 (BitStream!1482 BitStream!1482) tuple2!3590)

(assert (=> b!36378 (= lt!54672 (reader!0 thiss!1379 (_2!1883 lt!54663)))))

(declare-fun b!36379 () Bool)

(declare-fun res!30979 () Bool)

(declare-fun e!23985 () Bool)

(assert (=> b!36379 (=> res!30979 e!23985)))

(declare-datatypes ((List!442 0))(
  ( (Nil!439) (Cons!438 (h!557 Bool) (t!1192 List!442)) )
))
(declare-fun lt!54669 () List!442)

(declare-fun length!168 (List!442) Int)

(assert (=> b!36379 (= res!30979 (<= (length!168 lt!54669) 0))))

(declare-fun b!36380 () Bool)

(assert (=> b!36380 (= e!23985 e!23987)))

(declare-fun res!30978 () Bool)

(assert (=> b!36380 (=> res!30978 e!23987)))

(declare-fun lt!54667 () List!442)

(declare-fun lt!54670 () List!442)

(assert (=> b!36380 (= res!30978 (not (= lt!54667 lt!54670)))))

(assert (=> b!36380 (= lt!54670 lt!54667)))

(declare-fun tail!159 (List!442) List!442)

(assert (=> b!36380 (= lt!54667 (tail!159 lt!54669))))

(declare-fun lt!54661 () Unit!2665)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1482 BitStream!1482 BitStream!1482 BitStream!1482 (_ BitVec 64) List!442) Unit!2665)

(assert (=> b!36380 (= lt!54661 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1883 lt!54681) (_2!1883 lt!54681) (_1!1882 lt!54680) (_1!1882 lt!54675) (bvsub to!314 i!635) lt!54669))))

(declare-fun b!36381 () Bool)

(declare-fun res!30986 () Bool)

(declare-fun e!23990 () Bool)

(assert (=> b!36381 (=> res!30986 e!23990)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!36381 (= res!30986 (not (invariant!0 (currentBit!2574 (_2!1883 lt!54681)) (currentByte!2579 (_2!1883 lt!54681)) (size!857 (buf!1185 (_2!1883 lt!54681))))))))

(declare-fun b!36382 () Bool)

(declare-fun res!30991 () Bool)

(declare-fun e!23994 () Bool)

(assert (=> b!36382 (=> (not res!30991) (not e!23994))))

(assert (=> b!36382 (= res!30991 (validate_offset_bits!1 ((_ sign_extend 32) (size!857 (buf!1185 thiss!1379))) ((_ sign_extend 32) (currentByte!2579 thiss!1379)) ((_ sign_extend 32) (currentBit!2574 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!36383 () Bool)

(declare-fun e!23998 () Bool)

(assert (=> b!36383 (= e!23998 e!23996)))

(declare-fun res!30985 () Bool)

(assert (=> b!36383 (=> res!30985 e!23996)))

(assert (=> b!36383 (= res!30985 (not (isPrefixOf!0 thiss!1379 (_2!1883 lt!54663))))))

(declare-fun lt!54677 () (_ BitVec 64))

(assert (=> b!36383 (validate_offset_bits!1 ((_ sign_extend 32) (size!857 (buf!1185 (_2!1883 lt!54663)))) ((_ sign_extend 32) (currentByte!2579 (_2!1883 lt!54663))) ((_ sign_extend 32) (currentBit!2574 (_2!1883 lt!54663))) lt!54677)))

(assert (=> b!36383 (= lt!54677 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54685 () Unit!2665)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1482 BitStream!1482 (_ BitVec 64) (_ BitVec 64)) Unit!2665)

(assert (=> b!36383 (= lt!54685 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1883 lt!54663) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1482 (_ BitVec 8) (_ BitVec 32)) tuple2!3592)

(assert (=> b!36383 (= lt!54663 (appendBitFromByte!0 thiss!1379 (select (arr!1344 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!36384 () Bool)

(assert (=> b!36384 (= e!23995 e!23990)))

(declare-fun res!30975 () Bool)

(assert (=> b!36384 (=> res!30975 e!23990)))

(declare-fun lt!54665 () (_ BitVec 64))

(assert (=> b!36384 (= res!30975 (not (= lt!54665 (bvsub (bvadd lt!54673 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!36384 (= lt!54665 (bitIndex!0 (size!857 (buf!1185 (_2!1883 lt!54681))) (currentByte!2579 (_2!1883 lt!54681)) (currentBit!2574 (_2!1883 lt!54681))))))

(declare-fun b!36385 () Bool)

(declare-fun e!23984 () Bool)

(assert (=> b!36385 (= e!23983 e!23984)))

(declare-fun res!30981 () Bool)

(assert (=> b!36385 (=> res!30981 e!23984)))

(declare-fun lt!54676 () Bool)

(declare-fun head!279 (List!442) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1482 array!1918 (_ BitVec 64) (_ BitVec 64)) List!442)

(assert (=> b!36385 (= res!30981 (not (= (head!279 (byteArrayBitContentToList!0 (_2!1883 lt!54681) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!54676)))))

(assert (=> b!36385 (= lt!54676 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!36386 () Bool)

(declare-fun e!23986 () Bool)

(assert (=> b!36386 (= e!23986 e!23985)))

(declare-fun res!30988 () Bool)

(assert (=> b!36386 (=> res!30988 e!23985)))

(assert (=> b!36386 (= res!30988 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1482 BitStream!1482 (_ BitVec 64)) List!442)

(assert (=> b!36386 (= lt!54670 (bitStreamReadBitsIntoList!0 (_2!1883 lt!54681) (_1!1882 lt!54675) lt!54677))))

(assert (=> b!36386 (= lt!54669 (bitStreamReadBitsIntoList!0 (_2!1883 lt!54681) (_1!1882 lt!54680) (bvsub to!314 i!635)))))

(assert (=> b!36386 (validate_offset_bits!1 ((_ sign_extend 32) (size!857 (buf!1185 (_2!1883 lt!54681)))) ((_ sign_extend 32) (currentByte!2579 (_2!1883 lt!54663))) ((_ sign_extend 32) (currentBit!2574 (_2!1883 lt!54663))) lt!54677)))

(declare-fun lt!54674 () Unit!2665)

(assert (=> b!36386 (= lt!54674 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1883 lt!54663) (buf!1185 (_2!1883 lt!54681)) lt!54677))))

(assert (=> b!36386 (= lt!54675 (reader!0 (_2!1883 lt!54663) (_2!1883 lt!54681)))))

(assert (=> b!36386 (validate_offset_bits!1 ((_ sign_extend 32) (size!857 (buf!1185 (_2!1883 lt!54681)))) ((_ sign_extend 32) (currentByte!2579 thiss!1379)) ((_ sign_extend 32) (currentBit!2574 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!54668 () Unit!2665)

(assert (=> b!36386 (= lt!54668 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1185 (_2!1883 lt!54681)) (bvsub to!314 i!635)))))

(assert (=> b!36386 (= lt!54680 (reader!0 thiss!1379 (_2!1883 lt!54681)))))

(declare-fun b!36387 () Bool)

(declare-fun res!30989 () Bool)

(assert (=> b!36387 (=> res!30989 e!23990)))

(assert (=> b!36387 (= res!30989 (not (= (size!857 (buf!1185 thiss!1379)) (size!857 (buf!1185 (_2!1883 lt!54681))))))))

(declare-fun res!30990 () Bool)

(declare-fun e!23991 () Bool)

(assert (=> start!7480 (=> (not res!30990) (not e!23991))))

(assert (=> start!7480 (= res!30990 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!7480 e!23991))

(assert (=> start!7480 true))

(declare-fun e!23993 () Bool)

(declare-fun inv!12 (BitStream!1482) Bool)

(assert (=> start!7480 (and (inv!12 thiss!1379) e!23993)))

(declare-fun array_inv!794 (array!1918) Bool)

(assert (=> start!7480 (array_inv!794 srcBuffer!2)))

(declare-fun b!36388 () Bool)

(declare-fun res!30977 () Bool)

(assert (=> b!36388 (=> res!30977 e!23983)))

(assert (=> b!36388 (= res!30977 (not (= (head!279 lt!54669) lt!54666)))))

(declare-fun b!36389 () Bool)

(declare-fun e!23988 () Bool)

(assert (=> b!36389 (= e!23984 e!23988)))

(declare-fun res!30987 () Bool)

(assert (=> b!36389 (=> res!30987 e!23988)))

(declare-fun lt!54664 () Bool)

(assert (=> b!36389 (= res!30987 (not (= lt!54664 lt!54676)))))

(assert (=> b!36389 (= lt!54664 (bitAt!0 (buf!1185 (_2!1883 lt!54663)) lt!54673))))

(declare-fun b!36390 () Bool)

(declare-fun res!30980 () Bool)

(assert (=> b!36390 (=> res!30980 e!23986)))

(assert (=> b!36390 (= res!30980 (not (invariant!0 (currentBit!2574 (_2!1883 lt!54663)) (currentByte!2579 (_2!1883 lt!54663)) (size!857 (buf!1185 (_2!1883 lt!54681))))))))

(declare-fun b!36391 () Bool)

(assert (=> b!36391 (= e!23990 e!23986)))

(declare-fun res!30993 () Bool)

(assert (=> b!36391 (=> res!30993 e!23986)))

(assert (=> b!36391 (= res!30993 (not (= (size!857 (buf!1185 (_2!1883 lt!54663))) (size!857 (buf!1185 (_2!1883 lt!54681))))))))

(declare-fun lt!54678 () (_ BitVec 64))

(assert (=> b!36391 (= lt!54665 (bvsub (bvsub (bvadd lt!54678 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!36391 (= lt!54678 (bitIndex!0 (size!857 (buf!1185 (_2!1883 lt!54663))) (currentByte!2579 (_2!1883 lt!54663)) (currentBit!2574 (_2!1883 lt!54663))))))

(assert (=> b!36391 (= (size!857 (buf!1185 (_2!1883 lt!54681))) (size!857 (buf!1185 thiss!1379)))))

(declare-fun b!36392 () Bool)

(declare-fun res!30982 () Bool)

(assert (=> b!36392 (=> res!30982 e!23986)))

(assert (=> b!36392 (= res!30982 (not (invariant!0 (currentBit!2574 (_2!1883 lt!54663)) (currentByte!2579 (_2!1883 lt!54663)) (size!857 (buf!1185 (_2!1883 lt!54663))))))))

(declare-fun b!36393 () Bool)

(assert (=> b!36393 (= e!23991 e!23994)))

(declare-fun res!30974 () Bool)

(assert (=> b!36393 (=> (not res!30974) (not e!23994))))

(declare-fun lt!54684 () (_ BitVec 64))

(assert (=> b!36393 (= res!30974 (bvsle to!314 lt!54684))))

(assert (=> b!36393 (= lt!54684 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!857 srcBuffer!2))))))

(declare-fun b!36394 () Bool)

(assert (=> b!36394 (= e!23993 (array_inv!794 (buf!1185 thiss!1379)))))

(declare-fun b!36395 () Bool)

(assert (=> b!36395 (= e!23997 (= (head!279 (byteArrayBitContentToList!0 (_2!1883 lt!54663) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!279 (bitStreamReadBitsIntoList!0 (_2!1883 lt!54663) (_1!1882 lt!54672) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!36396 () Bool)

(declare-fun lt!54662 () Bool)

(assert (=> b!36396 (= e!23988 (or (not (= lt!54662 lt!54676)) (bvslt i!635 lt!54684)))))

(assert (=> b!36396 (= lt!54664 lt!54662)))

(assert (=> b!36396 (= lt!54662 (bitAt!0 (buf!1185 (_2!1883 lt!54681)) lt!54673))))

(declare-fun lt!54671 () Unit!2665)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1918 array!1918 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2665)

(assert (=> b!36396 (= lt!54671 (arrayBitRangesEqImpliesEq!0 (buf!1185 (_2!1883 lt!54663)) (buf!1185 (_2!1883 lt!54681)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54673 lt!54678))))

(declare-fun b!36397 () Bool)

(assert (=> b!36397 (= e!23994 (not e!23998))))

(declare-fun res!30984 () Bool)

(assert (=> b!36397 (=> res!30984 e!23998)))

(assert (=> b!36397 (= res!30984 (bvsge i!635 to!314))))

(assert (=> b!36397 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!54683 () Unit!2665)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1482) Unit!2665)

(assert (=> b!36397 (= lt!54683 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!36397 (= lt!54673 (bitIndex!0 (size!857 (buf!1185 thiss!1379)) (currentByte!2579 thiss!1379) (currentBit!2574 thiss!1379)))))

(assert (= (and start!7480 res!30990) b!36393))

(assert (= (and b!36393 res!30974) b!36382))

(assert (= (and b!36382 res!30991) b!36397))

(assert (= (and b!36397 (not res!30984)) b!36383))

(assert (= (and b!36383 (not res!30985)) b!36378))

(assert (= (and b!36378 res!30976) b!36395))

(assert (= (and b!36378 (not res!30992)) b!36384))

(assert (= (and b!36384 (not res!30975)) b!36381))

(assert (= (and b!36381 (not res!30986)) b!36387))

(assert (= (and b!36387 (not res!30989)) b!36391))

(assert (= (and b!36391 (not res!30993)) b!36392))

(assert (= (and b!36392 (not res!30982)) b!36390))

(assert (= (and b!36390 (not res!30980)) b!36386))

(assert (= (and b!36386 (not res!30988)) b!36379))

(assert (= (and b!36379 (not res!30979)) b!36380))

(assert (= (and b!36380 (not res!30978)) b!36377))

(assert (= (and b!36377 (not res!30983)) b!36388))

(assert (= (and b!36388 (not res!30977)) b!36385))

(assert (= (and b!36385 (not res!30981)) b!36389))

(assert (= (and b!36389 (not res!30987)) b!36396))

(assert (= start!7480 b!36394))

(declare-fun m!54897 () Bool)

(assert (=> b!36390 m!54897))

(declare-fun m!54899 () Bool)

(assert (=> b!36392 m!54899))

(declare-fun m!54901 () Bool)

(assert (=> start!7480 m!54901))

(declare-fun m!54903 () Bool)

(assert (=> start!7480 m!54903))

(declare-fun m!54905 () Bool)

(assert (=> b!36386 m!54905))

(declare-fun m!54907 () Bool)

(assert (=> b!36386 m!54907))

(declare-fun m!54909 () Bool)

(assert (=> b!36386 m!54909))

(declare-fun m!54911 () Bool)

(assert (=> b!36386 m!54911))

(declare-fun m!54913 () Bool)

(assert (=> b!36386 m!54913))

(declare-fun m!54915 () Bool)

(assert (=> b!36386 m!54915))

(declare-fun m!54917 () Bool)

(assert (=> b!36386 m!54917))

(declare-fun m!54919 () Bool)

(assert (=> b!36386 m!54919))

(declare-fun m!54921 () Bool)

(assert (=> b!36397 m!54921))

(declare-fun m!54923 () Bool)

(assert (=> b!36397 m!54923))

(declare-fun m!54925 () Bool)

(assert (=> b!36397 m!54925))

(declare-fun m!54927 () Bool)

(assert (=> b!36396 m!54927))

(declare-fun m!54929 () Bool)

(assert (=> b!36396 m!54929))

(declare-fun m!54931 () Bool)

(assert (=> b!36377 m!54931))

(declare-fun m!54933 () Bool)

(assert (=> b!36377 m!54933))

(declare-fun m!54935 () Bool)

(assert (=> b!36379 m!54935))

(declare-fun m!54937 () Bool)

(assert (=> b!36383 m!54937))

(declare-fun m!54939 () Bool)

(assert (=> b!36383 m!54939))

(declare-fun m!54941 () Bool)

(assert (=> b!36383 m!54941))

(assert (=> b!36383 m!54939))

(declare-fun m!54943 () Bool)

(assert (=> b!36383 m!54943))

(declare-fun m!54945 () Bool)

(assert (=> b!36383 m!54945))

(declare-fun m!54947 () Bool)

(assert (=> b!36385 m!54947))

(assert (=> b!36385 m!54947))

(declare-fun m!54949 () Bool)

(assert (=> b!36385 m!54949))

(declare-fun m!54951 () Bool)

(assert (=> b!36385 m!54951))

(declare-fun m!54953 () Bool)

(assert (=> b!36378 m!54953))

(declare-fun m!54955 () Bool)

(assert (=> b!36378 m!54955))

(declare-fun m!54957 () Bool)

(assert (=> b!36378 m!54957))

(declare-fun m!54959 () Bool)

(assert (=> b!36378 m!54959))

(declare-fun m!54961 () Bool)

(assert (=> b!36378 m!54961))

(declare-fun m!54963 () Bool)

(assert (=> b!36378 m!54963))

(declare-fun m!54965 () Bool)

(assert (=> b!36378 m!54965))

(declare-fun m!54967 () Bool)

(assert (=> b!36382 m!54967))

(declare-fun m!54969 () Bool)

(assert (=> b!36384 m!54969))

(declare-fun m!54971 () Bool)

(assert (=> b!36388 m!54971))

(declare-fun m!54973 () Bool)

(assert (=> b!36391 m!54973))

(declare-fun m!54975 () Bool)

(assert (=> b!36395 m!54975))

(assert (=> b!36395 m!54975))

(declare-fun m!54977 () Bool)

(assert (=> b!36395 m!54977))

(declare-fun m!54979 () Bool)

(assert (=> b!36395 m!54979))

(assert (=> b!36395 m!54979))

(declare-fun m!54981 () Bool)

(assert (=> b!36395 m!54981))

(declare-fun m!54983 () Bool)

(assert (=> b!36394 m!54983))

(declare-fun m!54985 () Bool)

(assert (=> b!36389 m!54985))

(declare-fun m!54987 () Bool)

(assert (=> b!36380 m!54987))

(declare-fun m!54989 () Bool)

(assert (=> b!36380 m!54989))

(declare-fun m!54991 () Bool)

(assert (=> b!36381 m!54991))

(check-sat (not b!36388) (not b!36390) (not b!36395) (not b!36392) (not b!36378) (not b!36382) (not b!36381) (not b!36380) (not b!36396) (not b!36383) (not b!36379) (not b!36386) (not b!36384) (not b!36385) (not b!36394) (not b!36397) (not b!36377) (not start!7480) (not b!36389) (not b!36391))
(check-sat)
