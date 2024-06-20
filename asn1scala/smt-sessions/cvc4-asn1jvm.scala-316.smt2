; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6894 () Bool)

(assert start!6894)

(declare-fun b!32699 () Bool)

(declare-fun res!27951 () Bool)

(declare-fun e!21631 () Bool)

(assert (=> b!32699 (=> (not res!27951) (not e!21631))))

(declare-datatypes ((array!1830 0))(
  ( (array!1831 (arr!1282 (Array (_ BitVec 32) (_ BitVec 8))) (size!807 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1406 0))(
  ( (BitStream!1407 (buf!1135 array!1830) (currentByte!2502 (_ BitVec 32)) (currentBit!2497 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1406)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32699 (= res!27951 (validate_offset_bits!1 ((_ sign_extend 32) (size!807 (buf!1135 thiss!1379))) ((_ sign_extend 32) (currentByte!2502 thiss!1379)) ((_ sign_extend 32) (currentBit!2497 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32700 () Bool)

(declare-datatypes ((Unit!2469 0))(
  ( (Unit!2470) )
))
(declare-datatypes ((tuple2!3342 0))(
  ( (tuple2!3343 (_1!1758 Unit!2469) (_2!1758 BitStream!1406)) )
))
(declare-fun lt!48363 () tuple2!3342)

(declare-fun lt!48371 () (_ BitVec 64))

(declare-fun e!21633 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32700 (= e!21633 (= lt!48371 (bvsub (bvsub (bvadd (bitIndex!0 (size!807 (buf!1135 (_2!1758 lt!48363))) (currentByte!2502 (_2!1758 lt!48363)) (currentBit!2497 (_2!1758 lt!48363))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32701 () Bool)

(declare-fun e!21632 () Bool)

(declare-fun e!21630 () Bool)

(assert (=> b!32701 (= e!21632 e!21630)))

(declare-fun res!27953 () Bool)

(assert (=> b!32701 (=> res!27953 e!21630)))

(declare-fun lt!48374 () tuple2!3342)

(assert (=> b!32701 (= res!27953 (not (= (size!807 (buf!1135 (_2!1758 lt!48363))) (size!807 (buf!1135 (_2!1758 lt!48374))))))))

(assert (=> b!32701 e!21633))

(declare-fun res!27955 () Bool)

(assert (=> b!32701 (=> (not res!27955) (not e!21633))))

(assert (=> b!32701 (= res!27955 (= (size!807 (buf!1135 (_2!1758 lt!48374))) (size!807 (buf!1135 thiss!1379))))))

(declare-fun b!32702 () Bool)

(declare-fun e!21635 () Bool)

(assert (=> b!32702 (= e!21631 (not e!21635))))

(declare-fun res!27957 () Bool)

(assert (=> b!32702 (=> res!27957 e!21635)))

(assert (=> b!32702 (= res!27957 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1406 BitStream!1406) Bool)

(assert (=> b!32702 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48375 () Unit!2469)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1406) Unit!2469)

(assert (=> b!32702 (= lt!48375 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48365 () (_ BitVec 64))

(assert (=> b!32702 (= lt!48365 (bitIndex!0 (size!807 (buf!1135 thiss!1379)) (currentByte!2502 thiss!1379) (currentBit!2497 thiss!1379)))))

(declare-fun b!32703 () Bool)

(declare-fun e!21634 () Bool)

(assert (=> b!32703 (= e!21634 e!21632)))

(declare-fun res!27949 () Bool)

(assert (=> b!32703 (=> res!27949 e!21632)))

(assert (=> b!32703 (= res!27949 (not (= lt!48371 (bvsub (bvadd lt!48365 to!314) i!635))))))

(assert (=> b!32703 (= lt!48371 (bitIndex!0 (size!807 (buf!1135 (_2!1758 lt!48374))) (currentByte!2502 (_2!1758 lt!48374)) (currentBit!2497 (_2!1758 lt!48374))))))

(declare-fun b!32704 () Bool)

(declare-fun res!27960 () Bool)

(assert (=> b!32704 (=> res!27960 e!21630)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32704 (= res!27960 (not (invariant!0 (currentBit!2497 (_2!1758 lt!48363)) (currentByte!2502 (_2!1758 lt!48363)) (size!807 (buf!1135 (_2!1758 lt!48363))))))))

(declare-fun b!32705 () Bool)

(declare-fun e!21637 () Bool)

(declare-fun array_inv!756 (array!1830) Bool)

(assert (=> b!32705 (= e!21637 (array_inv!756 (buf!1135 thiss!1379)))))

(declare-fun b!32706 () Bool)

(declare-fun e!21636 () Bool)

(assert (=> b!32706 (= e!21636 e!21634)))

(declare-fun res!27958 () Bool)

(assert (=> b!32706 (=> res!27958 e!21634)))

(assert (=> b!32706 (= res!27958 (not (isPrefixOf!0 (_2!1758 lt!48363) (_2!1758 lt!48374))))))

(assert (=> b!32706 (isPrefixOf!0 thiss!1379 (_2!1758 lt!48374))))

(declare-fun lt!48376 () Unit!2469)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1406 BitStream!1406 BitStream!1406) Unit!2469)

(assert (=> b!32706 (= lt!48376 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1758 lt!48363) (_2!1758 lt!48374)))))

(declare-fun srcBuffer!2 () array!1830)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1406 array!1830 (_ BitVec 64) (_ BitVec 64)) tuple2!3342)

(assert (=> b!32706 (= lt!48374 (appendBitsMSBFirstLoop!0 (_2!1758 lt!48363) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21626 () Bool)

(assert (=> b!32706 e!21626))

(declare-fun res!27962 () Bool)

(assert (=> b!32706 (=> (not res!27962) (not e!21626))))

(assert (=> b!32706 (= res!27962 (validate_offset_bits!1 ((_ sign_extend 32) (size!807 (buf!1135 (_2!1758 lt!48363)))) ((_ sign_extend 32) (currentByte!2502 thiss!1379)) ((_ sign_extend 32) (currentBit!2497 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48372 () Unit!2469)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1406 array!1830 (_ BitVec 64)) Unit!2469)

(assert (=> b!32706 (= lt!48372 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1135 (_2!1758 lt!48363)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3344 0))(
  ( (tuple2!3345 (_1!1759 BitStream!1406) (_2!1759 BitStream!1406)) )
))
(declare-fun lt!48367 () tuple2!3344)

(declare-fun reader!0 (BitStream!1406 BitStream!1406) tuple2!3344)

(assert (=> b!32706 (= lt!48367 (reader!0 thiss!1379 (_2!1758 lt!48363)))))

(declare-fun b!32707 () Bool)

(declare-datatypes ((List!404 0))(
  ( (Nil!401) (Cons!400 (h!519 Bool) (t!1154 List!404)) )
))
(declare-fun head!241 (List!404) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1406 array!1830 (_ BitVec 64) (_ BitVec 64)) List!404)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1406 BitStream!1406 (_ BitVec 64)) List!404)

(assert (=> b!32707 (= e!21626 (= (head!241 (byteArrayBitContentToList!0 (_2!1758 lt!48363) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!241 (bitStreamReadBitsIntoList!0 (_2!1758 lt!48363) (_1!1759 lt!48367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32708 () Bool)

(declare-fun res!27950 () Bool)

(assert (=> b!32708 (=> res!27950 e!21630)))

(assert (=> b!32708 (= res!27950 (not (invariant!0 (currentBit!2497 (_2!1758 lt!48363)) (currentByte!2502 (_2!1758 lt!48363)) (size!807 (buf!1135 (_2!1758 lt!48374))))))))

(declare-fun b!32709 () Bool)

(declare-fun e!21629 () Bool)

(assert (=> b!32709 (= e!21629 true)))

(declare-fun lt!48378 () List!404)

(declare-fun lt!48366 () List!404)

(declare-fun tail!121 (List!404) List!404)

(assert (=> b!32709 (= lt!48378 (tail!121 lt!48366))))

(declare-fun lt!48364 () tuple2!3344)

(declare-fun lt!48369 () Unit!2469)

(declare-fun lt!48370 () tuple2!3344)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1406 BitStream!1406 BitStream!1406 BitStream!1406 (_ BitVec 64) List!404) Unit!2469)

(assert (=> b!32709 (= lt!48369 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1758 lt!48374) (_2!1758 lt!48374) (_1!1759 lt!48364) (_1!1759 lt!48370) (bvsub to!314 i!635) lt!48366))))

(declare-fun b!32710 () Bool)

(declare-fun res!27954 () Bool)

(assert (=> b!32710 (=> res!27954 e!21629)))

(declare-fun length!130 (List!404) Int)

(assert (=> b!32710 (= res!27954 (<= (length!130 lt!48366) 0))))

(declare-fun b!32711 () Bool)

(assert (=> b!32711 (= e!21635 e!21636)))

(declare-fun res!27963 () Bool)

(assert (=> b!32711 (=> res!27963 e!21636)))

(assert (=> b!32711 (= res!27963 (not (isPrefixOf!0 thiss!1379 (_2!1758 lt!48363))))))

(declare-fun lt!48373 () (_ BitVec 64))

(assert (=> b!32711 (validate_offset_bits!1 ((_ sign_extend 32) (size!807 (buf!1135 (_2!1758 lt!48363)))) ((_ sign_extend 32) (currentByte!2502 (_2!1758 lt!48363))) ((_ sign_extend 32) (currentBit!2497 (_2!1758 lt!48363))) lt!48373)))

(assert (=> b!32711 (= lt!48373 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48379 () Unit!2469)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1406 BitStream!1406 (_ BitVec 64) (_ BitVec 64)) Unit!2469)

(assert (=> b!32711 (= lt!48379 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1758 lt!48363) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1406 (_ BitVec 8) (_ BitVec 32)) tuple2!3342)

(assert (=> b!32711 (= lt!48363 (appendBitFromByte!0 thiss!1379 (select (arr!1282 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32698 () Bool)

(declare-fun res!27956 () Bool)

(assert (=> b!32698 (=> res!27956 e!21632)))

(assert (=> b!32698 (= res!27956 (not (invariant!0 (currentBit!2497 (_2!1758 lt!48374)) (currentByte!2502 (_2!1758 lt!48374)) (size!807 (buf!1135 (_2!1758 lt!48374))))))))

(declare-fun res!27961 () Bool)

(assert (=> start!6894 (=> (not res!27961) (not e!21631))))

(assert (=> start!6894 (= res!27961 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!807 srcBuffer!2))))))))

(assert (=> start!6894 e!21631))

(assert (=> start!6894 true))

(assert (=> start!6894 (array_inv!756 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1406) Bool)

(assert (=> start!6894 (and (inv!12 thiss!1379) e!21637)))

(declare-fun b!32712 () Bool)

(declare-fun res!27952 () Bool)

(assert (=> b!32712 (=> res!27952 e!21632)))

(assert (=> b!32712 (= res!27952 (not (= (size!807 (buf!1135 thiss!1379)) (size!807 (buf!1135 (_2!1758 lt!48374))))))))

(declare-fun b!32713 () Bool)

(assert (=> b!32713 (= e!21630 e!21629)))

(declare-fun res!27959 () Bool)

(assert (=> b!32713 (=> res!27959 e!21629)))

(assert (=> b!32713 (= res!27959 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!32713 (= lt!48378 (bitStreamReadBitsIntoList!0 (_2!1758 lt!48374) (_1!1759 lt!48370) lt!48373))))

(assert (=> b!32713 (= lt!48366 (bitStreamReadBitsIntoList!0 (_2!1758 lt!48374) (_1!1759 lt!48364) (bvsub to!314 i!635)))))

(assert (=> b!32713 (validate_offset_bits!1 ((_ sign_extend 32) (size!807 (buf!1135 (_2!1758 lt!48374)))) ((_ sign_extend 32) (currentByte!2502 (_2!1758 lt!48363))) ((_ sign_extend 32) (currentBit!2497 (_2!1758 lt!48363))) lt!48373)))

(declare-fun lt!48368 () Unit!2469)

(assert (=> b!32713 (= lt!48368 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1758 lt!48363) (buf!1135 (_2!1758 lt!48374)) lt!48373))))

(assert (=> b!32713 (= lt!48370 (reader!0 (_2!1758 lt!48363) (_2!1758 lt!48374)))))

(assert (=> b!32713 (validate_offset_bits!1 ((_ sign_extend 32) (size!807 (buf!1135 (_2!1758 lt!48374)))) ((_ sign_extend 32) (currentByte!2502 thiss!1379)) ((_ sign_extend 32) (currentBit!2497 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48377 () Unit!2469)

(assert (=> b!32713 (= lt!48377 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1135 (_2!1758 lt!48374)) (bvsub to!314 i!635)))))

(assert (=> b!32713 (= lt!48364 (reader!0 thiss!1379 (_2!1758 lt!48374)))))

(assert (= (and start!6894 res!27961) b!32699))

(assert (= (and b!32699 res!27951) b!32702))

(assert (= (and b!32702 (not res!27957)) b!32711))

(assert (= (and b!32711 (not res!27963)) b!32706))

(assert (= (and b!32706 res!27962) b!32707))

(assert (= (and b!32706 (not res!27958)) b!32703))

(assert (= (and b!32703 (not res!27949)) b!32698))

(assert (= (and b!32698 (not res!27956)) b!32712))

(assert (= (and b!32712 (not res!27952)) b!32701))

(assert (= (and b!32701 res!27955) b!32700))

(assert (= (and b!32701 (not res!27953)) b!32704))

(assert (= (and b!32704 (not res!27960)) b!32708))

(assert (= (and b!32708 (not res!27950)) b!32713))

(assert (= (and b!32713 (not res!27959)) b!32710))

(assert (= (and b!32710 (not res!27954)) b!32709))

(assert (= start!6894 b!32705))

(declare-fun m!48393 () Bool)

(assert (=> b!32698 m!48393))

(declare-fun m!48395 () Bool)

(assert (=> b!32707 m!48395))

(assert (=> b!32707 m!48395))

(declare-fun m!48397 () Bool)

(assert (=> b!32707 m!48397))

(declare-fun m!48399 () Bool)

(assert (=> b!32707 m!48399))

(assert (=> b!32707 m!48399))

(declare-fun m!48401 () Bool)

(assert (=> b!32707 m!48401))

(declare-fun m!48403 () Bool)

(assert (=> b!32706 m!48403))

(declare-fun m!48405 () Bool)

(assert (=> b!32706 m!48405))

(declare-fun m!48407 () Bool)

(assert (=> b!32706 m!48407))

(declare-fun m!48409 () Bool)

(assert (=> b!32706 m!48409))

(declare-fun m!48411 () Bool)

(assert (=> b!32706 m!48411))

(declare-fun m!48413 () Bool)

(assert (=> b!32706 m!48413))

(declare-fun m!48415 () Bool)

(assert (=> b!32706 m!48415))

(declare-fun m!48417 () Bool)

(assert (=> b!32700 m!48417))

(declare-fun m!48419 () Bool)

(assert (=> b!32704 m!48419))

(declare-fun m!48421 () Bool)

(assert (=> start!6894 m!48421))

(declare-fun m!48423 () Bool)

(assert (=> start!6894 m!48423))

(declare-fun m!48425 () Bool)

(assert (=> b!32705 m!48425))

(declare-fun m!48427 () Bool)

(assert (=> b!32709 m!48427))

(declare-fun m!48429 () Bool)

(assert (=> b!32709 m!48429))

(declare-fun m!48431 () Bool)

(assert (=> b!32703 m!48431))

(declare-fun m!48433 () Bool)

(assert (=> b!32711 m!48433))

(declare-fun m!48435 () Bool)

(assert (=> b!32711 m!48435))

(declare-fun m!48437 () Bool)

(assert (=> b!32711 m!48437))

(declare-fun m!48439 () Bool)

(assert (=> b!32711 m!48439))

(declare-fun m!48441 () Bool)

(assert (=> b!32711 m!48441))

(assert (=> b!32711 m!48437))

(declare-fun m!48443 () Bool)

(assert (=> b!32699 m!48443))

(declare-fun m!48445 () Bool)

(assert (=> b!32710 m!48445))

(declare-fun m!48447 () Bool)

(assert (=> b!32708 m!48447))

(declare-fun m!48449 () Bool)

(assert (=> b!32713 m!48449))

(declare-fun m!48451 () Bool)

(assert (=> b!32713 m!48451))

(declare-fun m!48453 () Bool)

(assert (=> b!32713 m!48453))

(declare-fun m!48455 () Bool)

(assert (=> b!32713 m!48455))

(declare-fun m!48457 () Bool)

(assert (=> b!32713 m!48457))

(declare-fun m!48459 () Bool)

(assert (=> b!32713 m!48459))

(declare-fun m!48461 () Bool)

(assert (=> b!32713 m!48461))

(declare-fun m!48463 () Bool)

(assert (=> b!32713 m!48463))

(declare-fun m!48465 () Bool)

(assert (=> b!32702 m!48465))

(declare-fun m!48467 () Bool)

(assert (=> b!32702 m!48467))

(declare-fun m!48469 () Bool)

(assert (=> b!32702 m!48469))

(push 1)

(assert (not b!32713))

(assert (not start!6894))

(assert (not b!32709))

(assert (not b!32699))

(assert (not b!32707))

(assert (not b!32705))

(assert (not b!32710))

(assert (not b!32704))

(assert (not b!32702))

(assert (not b!32708))

(assert (not b!32700))

(assert (not b!32698))

(assert (not b!32711))

(assert (not b!32706))

(assert (not b!32703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

