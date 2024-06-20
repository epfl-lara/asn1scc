; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7482 () Bool)

(assert start!7482)

(declare-fun b!36440 () Bool)

(declare-fun e!24032 () Bool)

(declare-fun e!24042 () Bool)

(assert (=> b!36440 (= e!24032 e!24042)))

(declare-fun res!31049 () Bool)

(assert (=> b!36440 (=> res!31049 e!24042)))

(declare-fun lt!54742 () Bool)

(declare-fun lt!54757 () Bool)

(assert (=> b!36440 (= res!31049 (not (= lt!54742 lt!54757)))))

(declare-datatypes ((array!1920 0))(
  ( (array!1921 (arr!1345 (Array (_ BitVec 32) (_ BitVec 8))) (size!858 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1484 0))(
  ( (BitStream!1485 (buf!1186 array!1920) (currentByte!2580 (_ BitVec 32)) (currentBit!2575 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2667 0))(
  ( (Unit!2668) )
))
(declare-datatypes ((tuple2!3594 0))(
  ( (tuple2!3595 (_1!1884 Unit!2667) (_2!1884 BitStream!1484)) )
))
(declare-fun lt!54749 () tuple2!3594)

(declare-fun lt!54759 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1920 (_ BitVec 64)) Bool)

(assert (=> b!36440 (= lt!54742 (bitAt!0 (buf!1186 (_2!1884 lt!54749)) lt!54759))))

(declare-fun b!36441 () Bool)

(declare-fun e!24034 () Bool)

(declare-fun e!24035 () Bool)

(assert (=> b!36441 (= e!24034 e!24035)))

(declare-fun res!31045 () Bool)

(assert (=> b!36441 (=> (not res!31045) (not e!24035))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!54752 () (_ BitVec 64))

(assert (=> b!36441 (= res!31045 (bvsle to!314 lt!54752))))

(declare-fun srcBuffer!2 () array!1920)

(assert (=> b!36441 (= lt!54752 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!858 srcBuffer!2))))))

(declare-fun b!36442 () Bool)

(declare-fun res!31040 () Bool)

(declare-fun e!24045 () Bool)

(assert (=> b!36442 (=> res!31040 e!24045)))

(declare-fun lt!54753 () tuple2!3594)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!36442 (= res!31040 (not (invariant!0 (currentBit!2575 (_2!1884 lt!54749)) (currentByte!2580 (_2!1884 lt!54749)) (size!858 (buf!1186 (_2!1884 lt!54753))))))))

(declare-fun res!31048 () Bool)

(assert (=> start!7482 (=> (not res!31048) (not e!24034))))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!7482 (= res!31048 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!7482 e!24034))

(assert (=> start!7482 true))

(declare-fun thiss!1379 () BitStream!1484)

(declare-fun e!24036 () Bool)

(declare-fun inv!12 (BitStream!1484) Bool)

(assert (=> start!7482 (and (inv!12 thiss!1379) e!24036)))

(declare-fun array_inv!795 (array!1920) Bool)

(assert (=> start!7482 (array_inv!795 srcBuffer!2)))

(declare-fun b!36443 () Bool)

(declare-fun e!24044 () Bool)

(declare-fun e!24033 () Bool)

(assert (=> b!36443 (= e!24044 e!24033)))

(declare-fun res!31042 () Bool)

(assert (=> b!36443 (=> res!31042 e!24033)))

(declare-fun isPrefixOf!0 (BitStream!1484 BitStream!1484) Bool)

(assert (=> b!36443 (= res!31042 (not (isPrefixOf!0 (_2!1884 lt!54749) (_2!1884 lt!54753))))))

(assert (=> b!36443 (isPrefixOf!0 thiss!1379 (_2!1884 lt!54753))))

(declare-fun lt!54739 () Unit!2667)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1484 BitStream!1484 BitStream!1484) Unit!2667)

(assert (=> b!36443 (= lt!54739 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1884 lt!54749) (_2!1884 lt!54753)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1484 array!1920 (_ BitVec 64) (_ BitVec 64)) tuple2!3594)

(assert (=> b!36443 (= lt!54753 (appendBitsMSBFirstLoop!0 (_2!1884 lt!54749) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!24043 () Bool)

(assert (=> b!36443 e!24043))

(declare-fun res!31047 () Bool)

(assert (=> b!36443 (=> (not res!31047) (not e!24043))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36443 (= res!31047 (validate_offset_bits!1 ((_ sign_extend 32) (size!858 (buf!1186 (_2!1884 lt!54749)))) ((_ sign_extend 32) (currentByte!2580 thiss!1379)) ((_ sign_extend 32) (currentBit!2575 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54750 () Unit!2667)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1484 array!1920 (_ BitVec 64)) Unit!2667)

(assert (=> b!36443 (= lt!54750 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1186 (_2!1884 lt!54749)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3596 0))(
  ( (tuple2!3597 (_1!1885 BitStream!1484) (_2!1885 BitStream!1484)) )
))
(declare-fun lt!54748 () tuple2!3596)

(declare-fun reader!0 (BitStream!1484 BitStream!1484) tuple2!3596)

(assert (=> b!36443 (= lt!54748 (reader!0 thiss!1379 (_2!1884 lt!54749)))))

(declare-fun b!36444 () Bool)

(declare-fun e!24046 () Bool)

(assert (=> b!36444 (= e!24046 e!24032)))

(declare-fun res!31051 () Bool)

(assert (=> b!36444 (=> res!31051 e!24032)))

(declare-datatypes ((List!443 0))(
  ( (Nil!440) (Cons!439 (h!558 Bool) (t!1193 List!443)) )
))
(declare-fun head!280 (List!443) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1484 array!1920 (_ BitVec 64) (_ BitVec 64)) List!443)

(assert (=> b!36444 (= res!31051 (not (= (head!280 (byteArrayBitContentToList!0 (_2!1884 lt!54753) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!54757)))))

(assert (=> b!36444 (= lt!54757 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!36445 () Bool)

(declare-fun e!24031 () Bool)

(assert (=> b!36445 (= e!24033 e!24031)))

(declare-fun res!31052 () Bool)

(assert (=> b!36445 (=> res!31052 e!24031)))

(declare-fun lt!54736 () (_ BitVec 64))

(assert (=> b!36445 (= res!31052 (not (= lt!54736 (bvsub (bvadd lt!54759 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!36445 (= lt!54736 (bitIndex!0 (size!858 (buf!1186 (_2!1884 lt!54753))) (currentByte!2580 (_2!1884 lt!54753)) (currentBit!2575 (_2!1884 lt!54753))))))

(declare-fun b!36446 () Bool)

(declare-fun res!31043 () Bool)

(assert (=> b!36446 (=> res!31043 e!24045)))

(assert (=> b!36446 (= res!31043 (not (invariant!0 (currentBit!2575 (_2!1884 lt!54749)) (currentByte!2580 (_2!1884 lt!54749)) (size!858 (buf!1186 (_2!1884 lt!54749))))))))

(declare-fun b!36447 () Bool)

(declare-fun e!24041 () Bool)

(assert (=> b!36447 (= e!24045 e!24041)))

(declare-fun res!31035 () Bool)

(assert (=> b!36447 (=> res!31035 e!24041)))

(assert (=> b!36447 (= res!31035 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!54746 () List!443)

(declare-fun lt!54738 () (_ BitVec 64))

(declare-fun lt!54741 () tuple2!3596)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1484 BitStream!1484 (_ BitVec 64)) List!443)

(assert (=> b!36447 (= lt!54746 (bitStreamReadBitsIntoList!0 (_2!1884 lt!54753) (_1!1885 lt!54741) lt!54738))))

(declare-fun lt!54744 () List!443)

(declare-fun lt!54740 () tuple2!3596)

(assert (=> b!36447 (= lt!54744 (bitStreamReadBitsIntoList!0 (_2!1884 lt!54753) (_1!1885 lt!54740) (bvsub to!314 i!635)))))

(assert (=> b!36447 (validate_offset_bits!1 ((_ sign_extend 32) (size!858 (buf!1186 (_2!1884 lt!54753)))) ((_ sign_extend 32) (currentByte!2580 (_2!1884 lt!54749))) ((_ sign_extend 32) (currentBit!2575 (_2!1884 lt!54749))) lt!54738)))

(declare-fun lt!54760 () Unit!2667)

(assert (=> b!36447 (= lt!54760 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1884 lt!54749) (buf!1186 (_2!1884 lt!54753)) lt!54738))))

(assert (=> b!36447 (= lt!54741 (reader!0 (_2!1884 lt!54749) (_2!1884 lt!54753)))))

(assert (=> b!36447 (validate_offset_bits!1 ((_ sign_extend 32) (size!858 (buf!1186 (_2!1884 lt!54753)))) ((_ sign_extend 32) (currentByte!2580 thiss!1379)) ((_ sign_extend 32) (currentBit!2575 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!54755 () Unit!2667)

(assert (=> b!36447 (= lt!54755 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1186 (_2!1884 lt!54753)) (bvsub to!314 i!635)))))

(assert (=> b!36447 (= lt!54740 (reader!0 thiss!1379 (_2!1884 lt!54753)))))

(declare-fun b!36448 () Bool)

(declare-fun res!31037 () Bool)

(assert (=> b!36448 (=> res!31037 e!24046)))

(declare-fun lt!54758 () Bool)

(assert (=> b!36448 (= res!31037 (not (= (head!280 lt!54744) lt!54758)))))

(declare-fun b!36449 () Bool)

(assert (=> b!36449 (= e!24036 (array_inv!795 (buf!1186 thiss!1379)))))

(declare-fun b!36450 () Bool)

(declare-fun res!31050 () Bool)

(assert (=> b!36450 (=> res!31050 e!24031)))

(assert (=> b!36450 (= res!31050 (not (= (size!858 (buf!1186 thiss!1379)) (size!858 (buf!1186 (_2!1884 lt!54753))))))))

(declare-fun b!36451 () Bool)

(declare-fun e!24040 () Bool)

(assert (=> b!36451 (= e!24040 e!24044)))

(declare-fun res!31041 () Bool)

(assert (=> b!36451 (=> res!31041 e!24044)))

(assert (=> b!36451 (= res!31041 (not (isPrefixOf!0 thiss!1379 (_2!1884 lt!54749))))))

(assert (=> b!36451 (validate_offset_bits!1 ((_ sign_extend 32) (size!858 (buf!1186 (_2!1884 lt!54749)))) ((_ sign_extend 32) (currentByte!2580 (_2!1884 lt!54749))) ((_ sign_extend 32) (currentBit!2575 (_2!1884 lt!54749))) lt!54738)))

(assert (=> b!36451 (= lt!54738 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54743 () Unit!2667)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1484 BitStream!1484 (_ BitVec 64) (_ BitVec 64)) Unit!2667)

(assert (=> b!36451 (= lt!54743 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1884 lt!54749) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1484 (_ BitVec 8) (_ BitVec 32)) tuple2!3594)

(assert (=> b!36451 (= lt!54749 (appendBitFromByte!0 thiss!1379 (select (arr!1345 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!36452 () Bool)

(declare-fun res!31053 () Bool)

(assert (=> b!36452 (=> res!31053 e!24041)))

(declare-fun length!169 (List!443) Int)

(assert (=> b!36452 (= res!31053 (<= (length!169 lt!54744) 0))))

(declare-fun b!36453 () Bool)

(declare-fun e!24037 () Bool)

(assert (=> b!36453 (= e!24037 e!24046)))

(declare-fun res!31034 () Bool)

(assert (=> b!36453 (=> res!31034 e!24046)))

(assert (=> b!36453 (= res!31034 (not (= lt!54758 (bitAt!0 (buf!1186 (_1!1885 lt!54741)) lt!54759))))))

(assert (=> b!36453 (= lt!54758 (bitAt!0 (buf!1186 (_1!1885 lt!54740)) lt!54759))))

(declare-fun b!36454 () Bool)

(assert (=> b!36454 (= e!24041 e!24037)))

(declare-fun res!31039 () Bool)

(assert (=> b!36454 (=> res!31039 e!24037)))

(declare-fun lt!54747 () List!443)

(assert (=> b!36454 (= res!31039 (not (= lt!54747 lt!54746)))))

(assert (=> b!36454 (= lt!54746 lt!54747)))

(declare-fun tail!160 (List!443) List!443)

(assert (=> b!36454 (= lt!54747 (tail!160 lt!54744))))

(declare-fun lt!54756 () Unit!2667)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1484 BitStream!1484 BitStream!1484 BitStream!1484 (_ BitVec 64) List!443) Unit!2667)

(assert (=> b!36454 (= lt!54756 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1884 lt!54753) (_2!1884 lt!54753) (_1!1885 lt!54740) (_1!1885 lt!54741) (bvsub to!314 i!635) lt!54744))))

(declare-fun b!36455 () Bool)

(assert (=> b!36455 (= e!24043 (= (head!280 (byteArrayBitContentToList!0 (_2!1884 lt!54749) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!280 (bitStreamReadBitsIntoList!0 (_2!1884 lt!54749) (_1!1885 lt!54748) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!36456 () Bool)

(assert (=> b!36456 (= e!24031 e!24045)))

(declare-fun res!31046 () Bool)

(assert (=> b!36456 (=> res!31046 e!24045)))

(assert (=> b!36456 (= res!31046 (not (= (size!858 (buf!1186 (_2!1884 lt!54749))) (size!858 (buf!1186 (_2!1884 lt!54753))))))))

(declare-fun lt!54737 () (_ BitVec 64))

(assert (=> b!36456 (= lt!54736 (bvsub (bvsub (bvadd lt!54737 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!36456 (= lt!54737 (bitIndex!0 (size!858 (buf!1186 (_2!1884 lt!54749))) (currentByte!2580 (_2!1884 lt!54749)) (currentBit!2575 (_2!1884 lt!54749))))))

(assert (=> b!36456 (= (size!858 (buf!1186 (_2!1884 lt!54753))) (size!858 (buf!1186 thiss!1379)))))

(declare-fun b!36457 () Bool)

(declare-fun res!31044 () Bool)

(assert (=> b!36457 (=> (not res!31044) (not e!24035))))

(assert (=> b!36457 (= res!31044 (validate_offset_bits!1 ((_ sign_extend 32) (size!858 (buf!1186 thiss!1379))) ((_ sign_extend 32) (currentByte!2580 thiss!1379)) ((_ sign_extend 32) (currentBit!2575 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!36458 () Bool)

(declare-fun res!31036 () Bool)

(assert (=> b!36458 (=> res!31036 e!24031)))

(assert (=> b!36458 (= res!31036 (not (invariant!0 (currentBit!2575 (_2!1884 lt!54753)) (currentByte!2580 (_2!1884 lt!54753)) (size!858 (buf!1186 (_2!1884 lt!54753))))))))

(declare-fun lt!54745 () Bool)

(declare-fun b!36459 () Bool)

(assert (=> b!36459 (= e!24042 (or (not (= lt!54745 lt!54757)) (bvslt i!635 lt!54752)))))

(assert (=> b!36459 (= lt!54742 lt!54745)))

(assert (=> b!36459 (= lt!54745 (bitAt!0 (buf!1186 (_2!1884 lt!54753)) lt!54759))))

(declare-fun lt!54754 () Unit!2667)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1920 array!1920 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2667)

(assert (=> b!36459 (= lt!54754 (arrayBitRangesEqImpliesEq!0 (buf!1186 (_2!1884 lt!54749)) (buf!1186 (_2!1884 lt!54753)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54759 lt!54737))))

(declare-fun b!36460 () Bool)

(assert (=> b!36460 (= e!24035 (not e!24040))))

(declare-fun res!31038 () Bool)

(assert (=> b!36460 (=> res!31038 e!24040)))

(assert (=> b!36460 (= res!31038 (bvsge i!635 to!314))))

(assert (=> b!36460 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!54751 () Unit!2667)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1484) Unit!2667)

(assert (=> b!36460 (= lt!54751 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!36460 (= lt!54759 (bitIndex!0 (size!858 (buf!1186 thiss!1379)) (currentByte!2580 thiss!1379) (currentBit!2575 thiss!1379)))))

(assert (= (and start!7482 res!31048) b!36441))

(assert (= (and b!36441 res!31045) b!36457))

(assert (= (and b!36457 res!31044) b!36460))

(assert (= (and b!36460 (not res!31038)) b!36451))

(assert (= (and b!36451 (not res!31041)) b!36443))

(assert (= (and b!36443 res!31047) b!36455))

(assert (= (and b!36443 (not res!31042)) b!36445))

(assert (= (and b!36445 (not res!31052)) b!36458))

(assert (= (and b!36458 (not res!31036)) b!36450))

(assert (= (and b!36450 (not res!31050)) b!36456))

(assert (= (and b!36456 (not res!31046)) b!36446))

(assert (= (and b!36446 (not res!31043)) b!36442))

(assert (= (and b!36442 (not res!31040)) b!36447))

(assert (= (and b!36447 (not res!31035)) b!36452))

(assert (= (and b!36452 (not res!31053)) b!36454))

(assert (= (and b!36454 (not res!31039)) b!36453))

(assert (= (and b!36453 (not res!31034)) b!36448))

(assert (= (and b!36448 (not res!31037)) b!36444))

(assert (= (and b!36444 (not res!31051)) b!36440))

(assert (= (and b!36440 (not res!31049)) b!36459))

(assert (= start!7482 b!36449))

(declare-fun m!54993 () Bool)

(assert (=> b!36447 m!54993))

(declare-fun m!54995 () Bool)

(assert (=> b!36447 m!54995))

(declare-fun m!54997 () Bool)

(assert (=> b!36447 m!54997))

(declare-fun m!54999 () Bool)

(assert (=> b!36447 m!54999))

(declare-fun m!55001 () Bool)

(assert (=> b!36447 m!55001))

(declare-fun m!55003 () Bool)

(assert (=> b!36447 m!55003))

(declare-fun m!55005 () Bool)

(assert (=> b!36447 m!55005))

(declare-fun m!55007 () Bool)

(assert (=> b!36447 m!55007))

(declare-fun m!55009 () Bool)

(assert (=> b!36451 m!55009))

(declare-fun m!55011 () Bool)

(assert (=> b!36451 m!55011))

(declare-fun m!55013 () Bool)

(assert (=> b!36451 m!55013))

(declare-fun m!55015 () Bool)

(assert (=> b!36451 m!55015))

(assert (=> b!36451 m!55011))

(declare-fun m!55017 () Bool)

(assert (=> b!36451 m!55017))

(declare-fun m!55019 () Bool)

(assert (=> b!36443 m!55019))

(declare-fun m!55021 () Bool)

(assert (=> b!36443 m!55021))

(declare-fun m!55023 () Bool)

(assert (=> b!36443 m!55023))

(declare-fun m!55025 () Bool)

(assert (=> b!36443 m!55025))

(declare-fun m!55027 () Bool)

(assert (=> b!36443 m!55027))

(declare-fun m!55029 () Bool)

(assert (=> b!36443 m!55029))

(declare-fun m!55031 () Bool)

(assert (=> b!36443 m!55031))

(declare-fun m!55033 () Bool)

(assert (=> b!36445 m!55033))

(declare-fun m!55035 () Bool)

(assert (=> b!36460 m!55035))

(declare-fun m!55037 () Bool)

(assert (=> b!36460 m!55037))

(declare-fun m!55039 () Bool)

(assert (=> b!36460 m!55039))

(declare-fun m!55041 () Bool)

(assert (=> b!36449 m!55041))

(declare-fun m!55043 () Bool)

(assert (=> b!36453 m!55043))

(declare-fun m!55045 () Bool)

(assert (=> b!36453 m!55045))

(declare-fun m!55047 () Bool)

(assert (=> b!36448 m!55047))

(declare-fun m!55049 () Bool)

(assert (=> start!7482 m!55049))

(declare-fun m!55051 () Bool)

(assert (=> start!7482 m!55051))

(declare-fun m!55053 () Bool)

(assert (=> b!36440 m!55053))

(declare-fun m!55055 () Bool)

(assert (=> b!36456 m!55055))

(declare-fun m!55057 () Bool)

(assert (=> b!36458 m!55057))

(declare-fun m!55059 () Bool)

(assert (=> b!36457 m!55059))

(declare-fun m!55061 () Bool)

(assert (=> b!36446 m!55061))

(declare-fun m!55063 () Bool)

(assert (=> b!36442 m!55063))

(declare-fun m!55065 () Bool)

(assert (=> b!36444 m!55065))

(assert (=> b!36444 m!55065))

(declare-fun m!55067 () Bool)

(assert (=> b!36444 m!55067))

(declare-fun m!55069 () Bool)

(assert (=> b!36444 m!55069))

(declare-fun m!55071 () Bool)

(assert (=> b!36455 m!55071))

(assert (=> b!36455 m!55071))

(declare-fun m!55073 () Bool)

(assert (=> b!36455 m!55073))

(declare-fun m!55075 () Bool)

(assert (=> b!36455 m!55075))

(assert (=> b!36455 m!55075))

(declare-fun m!55077 () Bool)

(assert (=> b!36455 m!55077))

(declare-fun m!55079 () Bool)

(assert (=> b!36452 m!55079))

(declare-fun m!55081 () Bool)

(assert (=> b!36459 m!55081))

(declare-fun m!55083 () Bool)

(assert (=> b!36459 m!55083))

(declare-fun m!55085 () Bool)

(assert (=> b!36454 m!55085))

(declare-fun m!55087 () Bool)

(assert (=> b!36454 m!55087))

(push 1)

(assert (not b!36455))

(assert (not b!36459))

(assert (not b!36457))

(assert (not b!36449))

(assert (not b!36453))

(assert (not b!36451))

(assert (not b!36446))

(assert (not b!36442))

(assert (not b!36440))

(assert (not start!7482))

(assert (not b!36443))

(assert (not b!36460))

(assert (not b!36452))

(assert (not b!36458))

(assert (not b!36448))

(assert (not b!36444))

(assert (not b!36447))

(assert (not b!36456))

(assert (not b!36445))

(assert (not b!36454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

